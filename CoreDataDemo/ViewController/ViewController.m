//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Mohanasundaram on 18/04/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "FetchedResultsControllerDataSource.h"
#import "Item.h"

static NSString* const selectItemSegue = @"selectItem";

@interface ViewController () <FetchedResultsControllerDataSourceDelegate, UITextFieldDelegate> {
    
}
@property (nonatomic, strong) UITextField *titleField;
@property (nonatomic, strong) FetchedResultsControllerDataSource *fetchedResultsControllerDataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupFetchedResultsControllerDataSource];
    [self setupNewItemField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.fetchedResultsControllerDataSource.paused = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.fetchedResultsControllerDataSource.paused = YES;
}

- (void)setupFetchedResultsControllerDataSource
{
    _fetchedResultsControllerDataSource = [[FetchedResultsControllerDataSource alloc] initWithTableView:self.tableView];
    _fetchedResultsControllerDataSource.fetchedResultsController = [self.rootItem childrenFetchedResultsController];
    _fetchedResultsControllerDataSource.reuseIdentifier = @"Cell";
    _fetchedResultsControllerDataSource.delegate = self;
}

- (void)setupNewItemField
{
    self.titleField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.tableView.rowHeight)];
    [self.titleField setBackgroundColor:[UIColor redColor]];
    self.titleField.delegate = self;
    self.titleField.placeholder = NSLocalizedString(@"Add a new item", @"Placeholder text for adding a new item");
    self.tableView.tableHeaderView = self.titleField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString* title = textField.text;
    NSString* actionName = [NSString stringWithFormat:NSLocalizedString(@"add item \"%@\"", @"Undo action name of add item"), title];
    [self.undoManager setActionName:actionName];
    [Item insertItemWithTitle:title parent:self.rootItem inManagedObjectContext:self.managedObjectContext];
    textField.text = @"";
    [textField resignFirstResponder];
    //[self hideNewItemField];
    return NO;
}

- (NSManagedObjectContext *)managedObjectContext
{
    return self.rootItem.managedObjectContext;
}

/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (-scrollView.contentOffset.y > self.titleField.bounds.size.height) {
        [self showNewItemField];
    } else if (scrollView.contentOffset.y > 0) {
        [self hideNewItemField];
    }
}

- (void)showNewItemField
{
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.top = 0;
    self.tableView.contentInset = insets;
}

- (void)hideNewItemField
{
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.top = -self.titleField.bounds.size.height;
    self.tableView.contentInset = insets;
}
*/
- (void)setRootItem:(Item *)rootItem
{
    _rootItem = rootItem;
    self.navigationItem.title = _rootItem.title;
}
#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:selectItemSegue]) {
        [self presentSubItemViewController:segue.destinationViewController];
    }
}

- (void)presentSubItemViewController:(ViewController *)subItemViewController
{
    Item *item = [self.fetchedResultsControllerDataSource selectedItem];
    subItemViewController.rootItem = item;
}


#pragma mark - Fetched Results Controller Delegate

- (void)fetchedResultsControllerDataSource:(FetchedResultsControllerDataSource *)fetchedResultsControllerDataSource configureCell:(UITableViewCell *)cell   withObject:(id)object
{
    UITableViewCell *aCell = cell;
    Item *item = object;
    aCell.textLabel.text = item.title;
}

- (void)fetchedResultsControllerDataSource:(FetchedResultsControllerDataSource *)fetchedResultsControllerDataSource deleteObject:(id)object
{
    Item *item = object;
    NSString *actionName = [NSString stringWithFormat:NSLocalizedString(@"Delete \"%@\"", @"Delete undo action name"), item.title];
    [self.undoManager setActionName:actionName];
    [item.managedObjectContext deleteObject:item];
}

@end
