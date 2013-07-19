//
//  AddCustomRandomCollectionViewController.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "AddCustomRandomCollectionViewController.h"

@implementation AddCustomRandomCollectionViewController

@synthesize addImagesButton = _addImagesButton;
@synthesize imageAddedLabel = _imageAddedLabel;
@synthesize nSelectionTextField = _nSelectionTextField;
@synthesize canRepeatSwitch = _canRepeatSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishAdding)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightButton release];
}

- (void) finishAdding {

}

- (void)viewDidUnload
{
    [self setAddImagesButton:nil];
    [self setImageAddedLabel:nil];
    [self setNSelectionTextField:nil];
    [self setCanRepeatSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_addImagesButton release];
    [_imageAddedLabel release];
    [_nSelectionTextField release];
    [_canRepeatSwitch release];
    [super dealloc];
}
- (IBAction)onAddImagesButtonClicked:(id)sender {
}
@end
