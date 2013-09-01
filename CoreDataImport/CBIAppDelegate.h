//
//  CBIAppDelegate.h
//  CoreDataImport
//
//  Created by dshe on 27.08.13.
//  Copyright (c) 2013 Shemet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end