//
//  User.m
//  getsmart
//
//  Created by cable8mm on 2015. 6. 23..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import "User.h"

@implementation User

+(NSString *) get:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:key];
}

+(void) save:(NSString *)key val:(NSString *)value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}
+(NSDictionary *) getAll {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic    = [NSMutableDictionary dictionary];
    dic[@"name"]                            = [defaults stringForKey:@"User.name"] == nil ? @"" : [defaults stringForKey:@"User.name"];
    dic[@"tel"]                             = [defaults stringForKey:@"User.tel"] == nil ? @"" : [defaults stringForKey:@"User.tel"];
    dic[@"fax"]                             = [defaults stringForKey:@"User.fax"] == nil ? @"" : [defaults stringForKey:@"User.fax"];
    dic[@"name_of_company"]                 = [defaults stringForKey:@"User.name_of_company"] == nil ? @"" : [defaults stringForKey:@"User.name_of_company"];
    dic[@"cel"]                             = [defaults stringForKey:@"User.cel"] == nil ? @"" : [defaults stringForKey:@"User.cel"];
    dic[@"website"]                         = [defaults stringForKey:@"User.website"] == nil ? @"" : [defaults stringForKey:@"User.website"];
    dic[@"business_registration_number"]    = [defaults stringForKey:@"User.business_registration_number"] == nil ? @"" : [defaults stringForKey:@"User.business_registration_number"];
    dic[@"name_of_representative"]          = [defaults stringForKey:@"User.name_of_representative"] == nil ? @"" : [defaults stringForKey:@"User.name_of_representative"];
    dic[@"address"]                         = [defaults stringForKey:@"User.address"] == nil ? @"" : [defaults stringForKey:@"User.address"];
    dic[@"business_type"]                   = [defaults stringForKey:@"User.business_type"] == nil ? @"" : [defaults stringForKey:@"User.business_type"];
    return dic;
}
@end
