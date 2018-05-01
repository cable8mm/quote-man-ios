//
//  Quotation.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 6..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface Quotation : NSManagedObject

@property (nonatomic, retain) NSDate * email_received_datetime;
@property (nonatomic, retain) NSDate * email_sent_datetime;
@property (nonatomic, retain) NSDate * fax_received_datetime;
@property (nonatomic, retain) NSDate * fax_sent_datetime;
@property (nonatomic, retain) NSString * receiver_fax;
@property (nonatomic, retain) NSString * receiver_name;
@property (nonatomic, retain) NSString * receiver_name_of_company;
@property (nonatomic, retain) NSString * receiver_tel;
@property (nonatomic, retain) NSString * remark;
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
@property (nonatomic, retain) NSDate * sent_datetime;
@property (nonatomic, retain) NSString * serial;
@property (nonatomic, retain) NSDate * sms_received_datetime;
@property (nonatomic, retain) NSDate * sms_sent_datetime;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * terms_of_payment;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDecimalNumber * total_price;
@property (nonatomic, retain) NSDecimalNumber * total_price_without_vat;
@property (nonatomic, retain) NSDecimalNumber * total_vat;
@property (nonatomic, retain) NSNumber * validity;
@property (nonatomic, retain) NSSet *projects;
@end

@interface Quotation (CoreDataGeneratedAccessors)

- (void)addProjectsObject:(Project *)value;
- (void)removeProjectsObject:(Project *)value;
- (void)addProjects:(NSSet *)values;
- (void)removeProjects:(NSSet *)values;

@end
