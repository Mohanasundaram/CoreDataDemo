//
//  PersistenceStack.m
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import "PersistenceStack.h"

@implementation PersistenceStack


- (instancetype)initWithStoreURL:(NSURL *)storeURL modelURL:(NSURL *)modelURL
{
    self = [super init];
    if (self) {
        _storeURL = storeURL;
        _modelURL = modelURL;
        [self setUpCoreDataStack];
    }
    return self;
}

- (NSManagedObjectModel *)managedObjectModel
{
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:_modelURL];
    return managedObjectModel;
}

- (void)setUpCoreDataStack
{
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSError *error;
    [self.managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.storeURL options:nil error:&error];
    
    if (error) {
        NSLog(@"error: %@", error);
    }
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}

@end
