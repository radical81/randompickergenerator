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

-(void) animateUsingCollectionImages:(NSArray*)randomResults {
    NSMutableArray* imagesArray = [[NSMutableArray alloc]init];
        for (RandomElement* element in collection.randomElementsArray) {
            UIImage* imageFromName = [UIImage imageNamed:[element elementImage]];
            [imagesArray addObject:imageFromName];
        }

    [_animatingImageView setAnimationImages:imagesArray];
    [imagesArray release];
    [_animatingImageView startAnimating];
    [self performSelector:@selector(endAnimation:) withObject:randomResults afterDelay:1];
}


//Populate the result
- (void) animationEndWithResult: (NSArray*) result {
    UIImage* resultImage = [UIImage imageNamed:[[result lastObject] elementImage]];
    [_animatingImageView setImage:resultImage];

    int imageX = 10;
    int imageHeight = 50;
    int imageWidth = 50;
    for (RandomElement* element in result) {
        NSString* imageName = [element elementImage];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(imageX, 0, imageWidth, imageHeight);
        [_resultViewContainer addSubview:imageView];
        imageX += 55;
    }
}

- (void) endAnimation:(NSArray*) randomResults {
    NSLog(@"endAnimation");
    [_animatingImageView stopAnimating];
    [self animationEndWithResult:randomResults];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSArray* randomResults = [collection randomize];
        [self animateUsingCollectionImages:randomResults];
    }
}





@end
