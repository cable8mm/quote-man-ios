//
//  ClientListTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 7. 9..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <CoreData/CoreData.h>

#import "ClientAddTableViewController.h"

@interface ClientListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
