//
//  IQuotationProject.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IQuotationProjectItem;

@interface IQuotationProject : NSObject
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDecimalNumber * sub_total_price;
@property (nonatomic, retain) NSDecimalNumber * sub_total_price_without_vat;
@property (nonatomic, retain) NSDecimalNumber * sub_total_vat;
@property (nonatomic, retain) NSNumber * row;
@property (nonatomic, retain) NSMutableArray *projectItems;

- (IQuotationProject *)initWithDefault;
- (NSUInteger) getItemCount;
- (IQuotationProjectItem *) getProjectItem:(NSUInteger)key;
@end
