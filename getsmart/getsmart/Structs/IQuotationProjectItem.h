//
//  IQuotationProjectItem.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IQuotationProjectItem : NSObject
@property (nonatomic, retain) NSString * item_code;
@property (nonatomic, retain) NSNumber * row;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * price_without_vat;
@property (nonatomic, retain) NSString * product_description;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSString * remark;
@property (nonatomic, retain) NSString * unit;
@property (nonatomic, retain) NSNumber * unit_price;
@property (nonatomic) BOOL is_vat;

- (IQuotationProjectItem *) initWithDefault;

@end
