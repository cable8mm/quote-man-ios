//
//  IQuotation.m
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

#import "IQuotation.h"
#import "IQuotationReceiver.h"
#import "IQuotationSender.h"
#import "IQuotationProject.h"
#import "IQuotationProjectItem.h"
#import "IQuotationAdditionItem.h"
#import "CommonMacros.h"

@implementation IQuotation
-(IQuotation *)init {
    self = [super init];
    if(self)
    {
        self.receiver   = [[IQuotationReceiver alloc] init];
        self.sender     = [[IQuotationSender alloc] init];
        self.projects   = [NSMutableArray array];
        self.additionItems  = [NSMutableArray array];
    }
    return self;
}

-(IQuotation *)initWithDefault {
    self = [self init];
    if(self)
    {
        [self create];
    }
    return self;
}

- (void) create {
    // 헤더
    self.title      = @"새로운 견적서";
    self.terms_of_payment   = 7;
    self.validity   = @7;
    
    [self addProject];
    
    [self addAdditionItem:@"재경비" price:@100000];
    [self addAdditionItem:@"할인" price:@-100000];
}

- (IQuotationProject *) getProject:(NSUInteger)key {
    IQuotationProject *iQuotationProject    = self.projects[key];
    return iQuotationProject;
}

- (IQuotationAdditionItem *) getAdditionItem:(NSUInteger)key {
    IQuotationAdditionItem *iQuotationAdditionItem    = self.additionItems[key];
    return iQuotationAdditionItem;
}

- (void) addProject {
    IQuotationProject *newProject   = [[IQuotationProject alloc] initWithDefault];
    [self.projects addObject:newProject];
}

- (void) addProjectItem:(NSUInteger)projectKey {
    IQuotationProject *iQuotationProject    = self.projects[projectKey];
    IQuotationProjectItem *newProjectItem = [[IQuotationProjectItem alloc] initWithDefault];
    [iQuotationProject.projectItems addObject:newProjectItem];
}

- (void) addAdditionItem:(NSString*)title price:(NSNumber*)price {
    IQuotationAdditionItem *newIQuotationAdditionItem    = [[IQuotationAdditionItem alloc] init];
    newIQuotationAdditionItem.title = title;
    newIQuotationAdditionItem.price = price;
    [self.additionItems addObject:newIQuotationAdditionItem];
}

- (void) addAdditionItem {
    IQuotationAdditionItem *newIQuotationAdditionItem    = [[IQuotationAdditionItem alloc] init];
    NSUInteger n = [self getAdditionItemCount] + 1;
    newIQuotationAdditionItem.title = [NSString stringWithFormat:@"추가 항목 %lu", n];
    newIQuotationAdditionItem.price = @100000;
    [self.additionItems addObject:newIQuotationAdditionItem];
}

- (NSUInteger) getProjectCount {
    return [self.projects count];
}

- (NSUInteger) getAdditionItemCount {
    return [self.additionItems count];
}

- (NSString *) getProjectTitle:(NSUInteger)projectKey {
    IQuotationProject *iQuotationProject    = self.projects[projectKey];
    return iQuotationProject.title == nil ? @"견적 제목" : iQuotationProject.title;
}

- (NSUInteger) getProjectItemCount:(NSUInteger)projectKey {
    IQuotationProject *iQuotationProject    = self.projects[projectKey];
    return [iQuotationProject getItemCount];
}

- (NSUInteger) getProjectAdditionCount {
    return [self.additionItems count];
}

- (IQuotationValidateCode) validate {
    IQuotationReceiver * receiver = self.receiver;
    if (NSStringIsNullOrEmpty(receiver.receiver_name)) {
        return kIQuotationValidateCodeReceiverRequired;
    }
    
    IQuotationSender * sender = self.sender;
    if (NSStringIsNullOrEmpty(sender.sender_name)) {
        return kIQuotationValidateCodeSenderRequired;
    }    
    
    return kIQuotationValidateCodeOK;
}

@end
