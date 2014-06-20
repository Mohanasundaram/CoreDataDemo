//
//  Employee.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 20/06/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (nonatomic) int64_t empId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * role;
@property (nonatomic, retain) NSDecimalNumber * experience;
@property (nonatomic) BOOL imageAvailable;
@property (nonatomic, retain) NSManagedObject *department;

@end
