//
//  AppDelegate.h
//  getsmart
//
//  Created by cable8mm on 2015. 6. 19..
//  Copyright (c) 2015년 Veriide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSZipArchive/SSZipArchive.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, SSZipArchiveDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
