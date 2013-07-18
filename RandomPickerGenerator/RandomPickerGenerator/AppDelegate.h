//
//  AppDelegate.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LaunchPageViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LaunchPageViewController *launchPageViewController;

@property (strong, nonatomic) UINavigationController *navigationController;


@end
