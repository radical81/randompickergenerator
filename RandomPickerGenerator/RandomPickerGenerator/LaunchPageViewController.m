//
//  LaunchPageViewController.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "LaunchPageViewController.h"
#import "RandomElementCollection.h"
#import "ResultsViewController.h"
#import "CustomRandomCollectionTableViewController.h"

@implementation LaunchPageViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)onRollDiceButtonClicked:(id)sender {
    RandomElementCollection* collection = [RandomElementCollection generateRollDiceRandomCollection];
    [self pushResultsViewControllerWithCollection:collection];
}

- (IBAction)onDrawCardButtonClicked:(id)sender {
    RandomElementCollection* collection = [RandomElementCollection generateDrawCardRandomCollection];
    [self pushResultsViewControllerWithCollection:collection];
}

- (IBAction)onTossCoinButtonClicked:(id)sender {
    RandomElementCollection* collection = [RandomElementCollection generateTossCoinRandomCollection];
    [self pushResultsViewControllerWithCollection:collection];
}

- (IBAction)onCustomRandomButtonClicked:(id)sender {
    CustomRandomCollectionTableViewController* controller = [[CustomRandomCollectionTableViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void) pushResultsViewControllerWithCollection: (RandomElementCollection*) collection {
    ResultsViewController* controller = [[ResultsViewController alloc] init];
    controller.collection = collection;
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
    
//    RVViewController* controller = [[RVViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
//    [controller release];
    
}

- (void)dealloc {
    [super dealloc];
}
@end
