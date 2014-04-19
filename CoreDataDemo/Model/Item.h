//
//  Item.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) Item *parent;
@property (nonatomic, retain) NSSet *children;

+ (instancetype)insertItemWithTitle:(NSString *)title parent:(Item *)parent inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

- (NSFetchedResultsController *)childrenFetchedResultsController;

@end
