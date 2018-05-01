//
//  Project.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 6..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ProjectItem, Quotation;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSNumber * row;
@property (nonatomic, retain) NSDecimalNumber * sub_total_price;
@property (nonatomic, retain) NSDecimalNumber * sub_total_price_without_vat;
@property (nonatomic, retain) NSDecimalNumber * sub_total_vat;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *projectItems;
@property (nonatomic, retain) Quotation *quotation;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addProjectItemsObject:(ProjectItem *)value;
- (void)removeProjectItemsObject:(ProjectItem *)value;
- (void)addProjectItems:(NSSet *)values;
- (void)removeProjectItems:(NSSet *)values;

@end
