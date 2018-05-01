//
//  AdditionItemCell.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 31..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdditionItemCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) UISwitch *onOff;

@end
