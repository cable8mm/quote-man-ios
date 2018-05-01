//
//  QuoteNewItemTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IQuotationProjectItem;

@interface QuoteAddItemTableViewController : UITableViewController
@property (nonatomic, weak) IQuotationProjectItem *iQuotationProjectItem;
@end
