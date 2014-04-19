//
//  FetchedResultsControllerDataSource.h
//  CoreDataDemo
//
//  Created by Mohanasundaram on 19/04/14.
//  Copyright (c) 2014 Mohanasundaram. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@protocol FetchedResultsControllerDataSourceDelegate;

@interface FetchedResultsControllerDataSource : NSObject<UITableViewDataSource, NSFetchedResultsControllerDelegate> {
    
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSString *reuseIdentifier;
@property (nonatomic, weak) id<FetchedResultsControllerDataSourceDelegate> delegate;
@property (nonatomic) BOOL paused;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (Item *)selectedItem;

@end


@protocol FetchedResultsControllerDataSourceDelegate <NSObject>

- (void)fetchedResultsControllerDataSource:(FetchedResultsControllerDataSource *)fetchedResultsControllerDataSource configureCell:(UITableViewCell *)cell   withObject:(id)object;

- (void)fetchedResultsControllerDataSource:(FetchedResultsControllerDataSource *)fetchedResultsControllerDataSource deleteObject:(id)object;
@end