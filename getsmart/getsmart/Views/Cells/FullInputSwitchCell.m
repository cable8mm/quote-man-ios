//
//  FullInputSwitchCell.m
//  getsmart
//
//  Created by cable8mm on 2015. 7. 13..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "FullInputSwitchCell.h"

@implementation FullInputSwitchCell

- (void)awakeFromNib {
    // Initialization code
    self.onOff  = [[UISwitch alloc] init];
    self.accessoryView  = self.onOff;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
