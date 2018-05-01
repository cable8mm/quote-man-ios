//
//  ClientDetailTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 12..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Client;

@interface ClientDetailTableViewController : UITableViewController
@property (nonatomic, strong) Client *client;
@end
