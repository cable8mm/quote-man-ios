//
//  ClientAddTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 9..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ClientAddDelegate;

@class Client;

@interface ClientAddTableViewController : UITableViewController
@property (nonatomic, strong) Client *client;
@property (nonatomic, unsafe_unretained) id <ClientAddDelegate> delegate;
@property (nonatomic, weak) NSManagedObjectContext *managedObjectContext;
@end

#pragma mark -

@protocol ClientAddDelegate <NSObject>

- (void)clientAddTableViewController:(ClientAddTableViewController *)clientAddTableViewController didAddClient:(Client *)client;
@end