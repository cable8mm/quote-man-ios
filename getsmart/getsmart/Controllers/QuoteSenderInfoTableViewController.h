//
//  QuoteSenderInfoTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IQuotationSender;

@interface QuoteSenderInfoTableViewController : UITableViewController
@property (nonatomic, weak) IQuotationSender *iQuotationSender;
@end
