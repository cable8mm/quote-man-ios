//
//  ProjectItem.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 6..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface ProjectItem : NSManagedObject

@property (nonatomic, retain) NSString * item_code;
@property (nonatomic, retain) NSNumber * row;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSDecimalNumber * price_without_vat;
@property (nonatomic, retain) NSString * product_description;
@property (nonatomic, retain) NSDecimalNumber * quantity;
@property (nonatomic, retain) NSString * remark;
@property (nonatomic, retain) NSString * unit;
@property (nonatomic, retain) NSNumber * unit_price;
@property (nonatomic, retain) NSDecimalNumber * vat;
@property (nonatomic, retain) Project *project;

@end
