//
//  IQuotation.h
//  getsmart
//
//  Created by cable8mm on 2015. 8. 25..
//  Copyright (c) 2015년 FastCode. All rights reserved.
//

typedef enum {
    kIQuotationValidateCodeOK,                  // 통과
    kIQuotationValidateCodeReceiverRequired,    // 수신자 정보 없음
    kIQuotationValidateCodeSenderRequired       // 발신자 정보 없음
} IQuotationValidateCode;

#import <Foundation/Foundation.h>
@class IQuotationReceiver;
@class IQuotationSender;
@class IQuotationProject;
@class IQuotationAdditionItem;

@interface IQuotation : NSObject
@property (nonatomic, retain) IQuotationReceiver * receiver;
@property (nonatomic, retain) IQuotationSender * sender;
@property (nonatomic, retain) NSMutableArray *projects;
@property (nonatomic, retain) NSMutableArray *additionItems;

@property (nonatomic, retain) NSString * remark;
@property (nonatomic, retain) NSString * serial;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic) int terms_of_payment;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDecimalNumber * total_price;
@property (nonatomic, retain) NSDecimalNumber * total_price_without_vat;
@property (nonatomic, retain) NSDecimalNumber * total_vat;
@property (nonatomic, retain) NSNumber * validity;

@property (nonatomic) NSUInteger down_payment;
@property (nonatomic) NSUInteger middle_payment;
@property (nonatomic) NSUInteger balance;

- (IQuotation *) initWithDefault;
- (void) create;
- (IQuotationProject *) getProject:(NSUInteger)key;
- (NSUInteger) getProjectCount;
- (void) addProjectItem:(NSUInteger)projectKey;
- (void) addProject;
- (NSString *) getProjectTitle:(NSUInteger)projectKey;
- (NSUInteger) getProjectItemCount:(NSUInteger)projectKey;
- (NSUInteger) getProjectAdditionCount;
- (IQuotationAdditionItem *) getAdditionItem:(NSUInteger)key;
- (void) addAdditionItem;
- (NSUInteger) getAdditionItemCount;

- (IQuotationValidateCode) validate;

@end
