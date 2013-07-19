//
//  ResultsViewController.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomElementCollection.h"

@interface ResultsViewController : UIViewController
@property (nonatomic, retain) RandomElementCollection* collection;
@property (retain, nonatomic) IBOutlet UIImageView *animatingImageView;
@property (retain, nonatomic) IBOutlet UIView *resultViewContainer;


@end
