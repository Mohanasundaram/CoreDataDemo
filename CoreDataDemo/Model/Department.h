//
//  Department.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 20/06/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Department : NSManagedObject

@property (nonatomic) int64_t departmentId;
@property (nonatomic, retain) NSString * name;

@end
