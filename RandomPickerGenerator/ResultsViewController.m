//
//  ResultsViewController.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "ResultsViewController.h"

@implementation ResultsViewController
@synthesize collection;
@synthesize animatingImageView = _animatingImageView;
@synthesize resultViewContainer = _resultViewContainer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) dealloc {
    [collection release];
    [_animatingImageView release];
    [_resultViewContainer release];
    [super dealloc];
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
    [self setTitle:@"Let's get random"];
}

- (void)viewDidUnload
{
    [self setAnimatingImageView:nil];
    [self setResultViewContainer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

-(void) animateUsingCollectionImages {
    UIImage* imageFromName = [[UIImage alloc]init];
    NSMutableArray* imagesArray = [[NSMutableArray alloc]init];
        for (RandomElement* element in collection.randomElementsArray) {
             imageFromName = [UIImage imageNamed:[element elementImage]];
            [imagesArray addObject:imageFromName];
        }
    [imageFromName release];

    NSArray* imagesForAnimation = [[NSArray alloc]initWithArray:imagesArray];
    [imagesArray release];

    [_animatingImageView setAnimationImages:imagesForAnimation];
     [imagesForAnimation release];
    _animatingImageView.animationRepeatCount = 5;
    [_animatingImageView startAnimating];
}
  

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        [self animateUsingCollectionImages];
    }
}

- (void) animationEnd {

}




@end
