//
//  IQuotationSender.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IQuotationSender : NSObject
@property (nonatomic, retain) NSString * sender_address;
@property (nonatomic, retain) NSString * sender_business_item;
@property (nonatomic, retain) NSString * sender_business_registration_number;
@property (nonatomic, retain) NSString * sender_business_stamp;
@property (nonatomic, retain) NSString * sender_business_type;
@property (nonatomic, retain) NSString * sender_email;
@property (nonatomic, retain) NSString * sender_fax;
@property (nonatomic, retain) NSString * sender_logo;
@property (nonatomic, retain) NSString * sender_name;
@property (nonatomic, retain) NSString * sender_name_of_company;
@property (nonatomic, retain) NSString * sender_name_of_representative;
@property (nonatomic, retain) NSString * sender_tel;
@property (nonatomic, retain) NSString * sender_website;

- (void) importFromUser;

@end
