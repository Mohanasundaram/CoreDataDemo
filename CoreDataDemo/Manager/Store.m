//
//  Store.m
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import "Store.h"
#import "Item.h"

@implementation Store

- (Item *)rootItem
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Item"];
    request.predicate = [NSPredicate predicateWithFormat:@"parent = %@", nil];
    
    NSArray *objects = [self.managedObjectContex executeFetchRequest:request error:NULL];
    Item *item = [objects lastObject];
    
    if (!item) {
        item = [Item insertItemWithTitle:nil parent:nil inManagedObjectContext:self.managedObjectContex];
    }
    
    return item;
}

@end
