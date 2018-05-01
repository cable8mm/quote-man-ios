//
//  PopContactListTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 29..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Client;

@protocol PopClientListTableViewControllerDelegate;

@interface PopClientListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic, weak) id<PopClientListTableViewControllerDelegate> delegate;
@end

@protocol PopClientListTableViewControllerDelegate <NSObject>
- (void)selectClient:(Client*)client;
@end
