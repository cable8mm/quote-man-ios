//
//  IQuotationProjectItem.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "IQuotationProjectItem.h"

@implementation IQuotationProjectItem

- (IQuotationProjectItem *)initWithDefault {
    self = [super init];
    if(self)
    {
        self.item_code  = @"000000001";
        self.row    = @0;
        self.price  = @10000;
        self.price_without_vat  = @1000;
        self.product_description    = @"항목 제목";
        self.quantity               = @1;
        self.unit                   = @"개";
        self.unit_price             = @10000;
        self.is_vat                  = YES;
    }
    return self;
}

@end
