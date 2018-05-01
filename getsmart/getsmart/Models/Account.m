//
//  Account.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "Account.h"
@interface Account ()
@end

@implementation Account

+(void) add:(NSDictionary*)params {
    NSDictionary *account = @{@"bankNumber":params[@"bankNumber"], @"bankName":params[@"bankName"], @"holderName":params[@"holderName"]};
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *accounts = [[defaults objectForKey:@"Acounts"] mutableCopy];
    if (accounts == nil) {
        accounts = [NSMutableArray array];
    }
    [accounts addObject:account];
    [defaults setObject:accounts forKey:@"Acounts"];
    [defaults synchronize];
}

+(NSArray *) getAll {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *accounts = [defaults objectForKey:@"Acounts"];
    return accounts;
}

+(int) getCount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *accounts = [defaults objectForKey:@"Acounts"];
    return (int)[accounts count];
}

@end
