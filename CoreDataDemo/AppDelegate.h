//
//  AppDelegate.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 18/04/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistenceStack;
@class Store;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PersistenceStack *persistenceStack;
@property (strong, nonatomic) Store *store;
@end
