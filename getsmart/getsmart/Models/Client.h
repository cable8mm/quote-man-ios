//
//  Client.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 6..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Client : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * business_card_url;
@property (nonatomic, retain) NSString * cel;
@property (nonatomic, retain) NSString * certification_of_business_registration_url;
@property (nonatomic, retain) NSDate * created_at;
@property (nonatomic, retain) NSString * fax;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * name_of_company;
@property (nonatomic, retain) NSString * tel;
@property (nonatomic, retain) NSDate * updated_at;

@end
