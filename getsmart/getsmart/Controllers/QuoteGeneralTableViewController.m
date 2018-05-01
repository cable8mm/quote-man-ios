//
//  QuoteGeneralTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteGeneralTableViewController.h"

@interface QuoteGeneralTableViewController ()
@property (strong, nonatomic) IBOutlet UITextField *attributeTextField;
@property (strong, nonatomic) IBOutlet UITextField *valueTextField;
- (IBAction)changeAttr:(id)sender;

@end

@implementation QuoteGeneralTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *generalItem = self.delegate.generalItems[self.key];
    self.attributeTextField.text = self.title = generalItem[0];
    self.valueTextField.text = [generalItem[1] stringValue];
    [self.attributeTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeAttr:(id)sender {
    UITextField *attr = (UITextField*)sender;
    self.title  = attr.text;
}
@end
