//
//  QuoteDetailViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteDetailViewController.h"
#import "UINavigationItem+MultipleButtonsAddition.h"

#define WWW_ROOT            @"/HTMLs"

@interface QuoteDetailViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)sendQuote:(id)sender;
@end

@implementation QuoteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *documentDir   = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *templatePath  = [NSString stringWithFormat:@"%@%@/", documentDir, WWW_ROOT];
    NSString *templateFile = [templatePath stringByAppendingPathComponent:@"index.html"];
    NSString *html  = [NSString stringWithContentsOfFile:templateFile encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:templatePath]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
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

- (IBAction)sendQuote:(id)sender {
}
@end
