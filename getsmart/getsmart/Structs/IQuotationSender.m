//
//  IQuotationSender.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "IQuotationSender.h"
#import "User.h"
#import "CommonMacros.h"

@implementation IQuotationSender

- (void) importFromUser {
    self.sender_name            = StringOrEmpty([User get:@"User.name"]);
    self.sender_name_of_company = StringOrEmpty([User get:@"User.name_of_company"]);
    self.sender_address         = StringOrEmpty([User get:@"User.address"]);
    self.sender_tel             = StringOrEmpty([User get:@"User.tel"]);
    self.sender_website         = StringOrEmpty([User get:@"User.website"]);
}

@end
