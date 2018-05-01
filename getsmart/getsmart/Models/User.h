//
//  User.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 23..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
+(NSString *) get:(NSString *)key;
+(void) save:(NSString *)key val:(NSString *)value;
+(NSDictionary *) getAll;
@end
