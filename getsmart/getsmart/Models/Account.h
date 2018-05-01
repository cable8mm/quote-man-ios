//
//  Account.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject
@property(nonatomic, strong) NSString *bankNumber;
@property(nonatomic, strong) NSString *bankName;
@property(nonatomic, strong) NSString *holderName;

+(void) add:(NSDictionary*)params;
+(NSArray *) getAll;
+(int) getCount;
@end
