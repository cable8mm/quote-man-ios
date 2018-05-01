//
//  QuoteMemoViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 30..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteAddTableViewController.h"

@interface QuoteMemoViewController : UIViewController <UITextViewDelegate>
@property (nonatomic, weak) QuoteAddTableViewController *delegate;
@end
