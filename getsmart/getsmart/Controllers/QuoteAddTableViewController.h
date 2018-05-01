//
//  NewQuoteTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 18..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quotation;

@interface QuoteAddTableViewController : UITableViewController
@property (nonatomic, strong) NSManagedObjectContext *moc;
@property (nonatomic, strong) Quotation *quotation;
@property (strong, nonatomic) NSString *memoString;
@property (strong, nonatomic) NSMutableArray *generalItems;
@end
