//
//  QuoteReceiverInfoTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopClientListTableViewController.h"

@class IQuotationReceiver;

@interface QuoteReceiverInfoTableViewController : UITableViewController <UITextFieldDelegate, PopClientListTableViewControllerDelegate>
@property (nonatomic, weak) IQuotationReceiver *iQuotationReceiver;
@end
