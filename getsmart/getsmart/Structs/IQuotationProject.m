//
//  IQuotationProject.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "IQuotationProject.h"
#import "IQuotationProjectItem.h"

@implementation IQuotationProject
- (IQuotationProject *)initWithDefault {
    self = [super init];
    if(self)
    {
        self.projectItems   = [NSMutableArray array];
        IQuotationProjectItem *newProjectItem = [[IQuotationProjectItem alloc] initWithDefault];
        [self.projectItems addObject:newProjectItem];
    }
    return self;
}

- (NSUInteger) getItemCount {
    return [self.projectItems count];
}

- (IQuotationProjectItem *) getProjectItem:(NSUInteger)key {
    return self.projectItems[key];
}

@end
