//
//  QuoteMemoViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteMemoViewController.h"

@interface QuoteMemoViewController ()
@property (nonatomic) UIEdgeInsets noteTextViewInsets;
@property (nonatomic) UIEdgeInsets noteTextViewScrollIndicatorInsets;
@property (nonatomic) CGRect oldRect;
@property (strong, nonatomic) NSTimer *caretVisibilityTimer;
@property (nonatomic) float noteViewBottomInset;

@property (strong, nonatomic) IBOutlet UITextView *memoView;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end

@implementation QuoteMemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.memoView.text  = self.delegate.memoString;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    // http://myiossolutions.funcode.ro/2014/02/02/uitextview-on-a-uiscrollview-scroll-up-when-keyboard-is-displayed/
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.memoView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    
    // unregister for keyboard notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
}

- (void)keyboardWasShown:(NSNotification *)aNotification
{
    // keyboard frame is in window coordinates
    NSDictionary *userInfo = [aNotification userInfo];
    CGRect keyboardInfoFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // get the height of the keyboard by taking into account the orientation of the device too
    CGRect windowFrame = [self.view.window convertRect:self.view.frame fromView:self.view];
    CGRect keyboardFrame = CGRectIntersection (windowFrame, keyboardInfoFrame);
    CGRect coveredFrame = [self.view.window convertRect:keyboardFrame toView:self.view];
    
    // add the keyboard height to the content insets so that the scrollview can be scrolled
    UIEdgeInsets contentInsets = UIEdgeInsetsMake (self.memoView.contentInset.top, self.memoView.contentInset.left, coveredFrame.size.height, self.memoView.contentInset.right);
    self.memoView.contentInset = contentInsets;
    self.memoView.scrollIndicatorInsets = contentInsets;
    
    // make sure the scrollview content size width and height are greater than 0
    [self.memoView setContentSize:CGSizeMake (self.memoView.contentSize.width, self.memoView.contentSize.height)];
    
    // scroll to the text view
    [self.memoView scrollRectToVisible:self.memoView.superview.frame animated:YES];
}

// Called when the UIKeyboardWillHideNotification is received
- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    // scroll back..
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.memoView.contentInset = contentInsets;
    self.memoView.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    self.delegate.memoString    = self.memoView.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
