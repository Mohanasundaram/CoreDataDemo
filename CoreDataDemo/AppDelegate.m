//
//  AppDelegate.m
//  CoreDataDemo
//
//  Created by Mohanasundaram on 18/04/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"
#import "PersistenceStack.h"
#import "Store.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.persistenceStack = [[PersistenceStack alloc] initWithStoreURL:[self storeURL] modelURL:[self modelURL]];
    self.store = [[Store alloc] init];
    self.store.managedObjectContex = self.persistenceStack.managedObjectContext;
    
    
    UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    ViewController *viewController = (ViewController*)navigationController.topViewController;
    
//    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    UINavigationController *navigationController = [mainStoryBoard instantiateInitialViewController];
//    ViewController *viewController = (ViewController *)navigationController.topViewController;
    viewController.rootItem = self.store.rootItem;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Fetch root item

- (NSURL *)storeURL
{
    NSURL *storeURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [storeURL URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL *)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"DemoModel" withExtension:@"momd"];
}

@end
