//
//  Store.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface Store : NSObject {
    
}

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContex;

- (Item *)rootItem;

@end
