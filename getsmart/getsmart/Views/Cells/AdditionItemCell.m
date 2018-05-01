//
//  AdditionItemCell.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 31..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "AdditionItemCell.h"

@implementation AdditionItemCell

- (void)awakeFromNib {
    // Initialization code
    self.onOff  = [[UISwitch alloc] init];
    [self.onOff addTarget:self action:@selector(onOffAction:) forControlEvents:UIControlEventValueChanged];
    self.accessoryView  = self.onOff;
    self.textField.text = @"";
    self.textField.placeholder  = @"없음";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)onOffAction:(id)sender {
    if (self.onOff.on) {
        [self.textField becomeFirstResponder];
    } else {
        [self.textField resignFirstResponder];
        self.textField.text = @"";
        self.textField.placeholder  = @"없음";
    }
}

@end
