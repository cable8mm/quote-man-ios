//
//  QuoteSenderInfoTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteSenderInfoTableViewController.h"
#import "CommonMacros.h"
#import "IQuotationSender.h"

@interface QuoteSenderInfoTableViewController ()
@property (strong, nonatomic) IBOutlet UITextField *sender_name;
@property (strong, nonatomic) IBOutlet UITextField *sender_company_name;
@property (strong, nonatomic) IBOutlet UITextField *sender_address;
@property (strong, nonatomic) IBOutlet UITextField *sender_tel;
@property (strong, nonatomic) IBOutlet UITextField *sender_fax;
@property (strong, nonatomic) IBOutlet UITextField *sender_website;
@property (strong, nonatomic) IBOutlet UITextField *sender_email;

@end

@implementation QuoteSenderInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem.enabled  = NO;
    
    self.sender_name.text   = StringOrEmpty(self.iQuotationSender.sender_name);
    self.sender_company_name.text    = StringOrEmpty(self.iQuotationSender.sender_name_of_company);
    self.sender_address.text = StringOrEmpty(self.iQuotationSender.sender_address);
    self.sender_tel.text    = StringOrEmpty(self.iQuotationSender.sender_tel);
    self.sender_fax.text    = StringOrEmpty(self.iQuotationSender.sender_fax);
    self.sender_website.text     = StringOrEmpty(self.iQuotationSender.sender_website);
    self.sender_email.text  = StringOrEmpty(self.iQuotationSender.sender_email);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.sender_name) {
        self.self.iQuotationSender.sender_name  = self.sender_name.text;
    }
    if (textField == self.sender_company_name) {
        self.iQuotationSender.sender_name_of_company  = self.sender_company_name.text;
    }
    if (textField == self.sender_address) {
        self.iQuotationSender.sender_address  = self.sender_address.text;
    }
    if (textField == self.sender_tel) {
        self.iQuotationSender.sender_tel  = self.sender_tel.text;
    }
    if (textField == self.sender_fax) {
        self.iQuotationSender.sender_fax  = self.sender_fax.text;
    }
    if (textField == self.sender_website) {
        self.iQuotationSender.sender_website  = self.sender_website.text;
    }
    if (textField == self.sender_email) {
        self.iQuotationSender.sender_email  = self.sender_email.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
