//
//  QuoteCell.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 20..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuoteCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *receiver;
@property (nonatomic, strong) IBOutlet UILabel *total_price;
@property (nonatomic, strong) IBOutlet UILabel *sent_datetime;
@property (nonatomic, strong) IBOutlet UILabel *status;
@end
