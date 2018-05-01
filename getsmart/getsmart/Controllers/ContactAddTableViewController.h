//
//  ContactAddTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 9..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ClientAddDelegate;

@class Client;

@interface ContactAddTableViewController : UITableViewController
@property (nonatomic, strong) Client *client;
@property (nonatomic, unsafe_unretained) id <ClientAddDelegate> delegate;
@end

#pragma mark -

@protocol ClientAddDelegate <NSObject>

- (void)contactAddTableViewController:(ContactAddTableViewController *)contactAddTableViewController didAddClient:(Client *)client;
@end