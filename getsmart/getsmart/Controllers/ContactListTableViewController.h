//
//  ContactListTableViewController.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 18..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <CoreData/CoreData.h>

#import "ContactAddTableViewController.h"

@interface ContactListTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
//@interface ContactListTableViewController : UITableViewController <ABPeoplePickerNavigationControllerDelegate, ABPersonViewControllerDelegate, NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
