//
//  Item.m
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import "Item.h"
#import "Item.h"


@implementation Item

@dynamic title;
@dynamic order;
@dynamic parent;
@dynamic children;

- (NSUInteger)numberOfChildren
{
    return self.children.count;
}

+ (NSString*)entityName
{
    return @"Item";
}

+ (instancetype)insertItemWithTitle:(NSString *)title parent:(Item *)parent inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:managedObjectContext];
    
    NSUInteger order = [parent numberOfChildren];
    item.order = @(order);
    item.title = title;
    item.parent = parent;
    return item;
}

- (NSFetchedResultsController *)childrenFetchedResultsController
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Item entityName]];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", self];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES]];
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
}

@end
