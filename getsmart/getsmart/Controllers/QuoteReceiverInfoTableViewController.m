//
//  QuoteReceiverInfoTableViewController.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "QuoteReceiverInfoTableViewController.h"
#import "Client.h"
#import "PopClientListTableViewController.h"
#import "IQuotationReceiver.h"
#import "CommonMacros.h"

@interface QuoteReceiverInfoTableViewController ()

@property (strong, nonatomic) IBOutlet UITextField *receiver_name_of_company;
@property (strong, nonatomic) IBOutlet UITextField *receiver_name;
@property (strong, nonatomic) IBOutlet UITextField *receiver_tel;
@property (strong, nonatomic) IBOutlet UITextField *receiver_fax;

@end

@implementation QuoteReceiverInfoTableViewController

- (void)setClient:(Client *)client {
    self.iQuotationReceiver.receiver_name_of_company = client.name_of_company;
    self.iQuotationReceiver.receiver_name    = client.name;
    self.iQuotationReceiver.receiver_tel     = client.tel;
    self.iQuotationReceiver.receiver_fax     = client.fax;
    
    self.receiver_name_of_company.text  = StringOrEmpty(self.iQuotationReceiver.receiver_name_of_company);
    self.receiver_name.text  = StringOrEmpty(self.iQuotationReceiver.receiver_name);
    self.receiver_tel.text  = StringOrEmpty(self.iQuotationReceiver.receiver_tel);
    self.receiver_fax.text  = StringOrEmpty(self.iQuotationReceiver.receiver_fax);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.receiver_name_of_company.text  = StringOrEmpty(self.iQuotationReceiver.receiver_name_of_company);
    self.receiver_name.text  = StringOrEmpty(self.iQuotationReceiver.receiver_name);
    self.receiver_tel.text  = StringOrEmpty(self.iQuotationReceiver.receiver_tel);
    self.receiver_fax.text  = StringOrEmpty(self.iQuotationReceiver.receiver_fax);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.receiver_name_of_company) {
        self.iQuotationReceiver.receiver_name_of_company  = self.receiver_name_of_company.text;
    }
    if (textField == self.receiver_name) {
        self.iQuotationReceiver.receiver_name  = self.receiver_name.text;
    }
    if (textField == self.receiver_tel) {
        self.iQuotationReceiver.receiver_tel  = self.receiver_tel.text;
    }
    if (textField == self.receiver_fax) {
        self.iQuotationReceiver.receiver_fax  = self.receiver_fax.text;
    }
}

- (void)selectClient:(Client*)client {
    [self setClient:client];
}
#pragma mark - Table view data source

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showClientList"]) {
        UINavigationController *nav = [segue destinationViewController];
        PopClientListTableViewController *vc    = (PopClientListTableViewController*)[nav topViewController];
        vc.delegate = self;
    }
}

@end
