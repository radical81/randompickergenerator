//
//  AddCustomRandomCollectionViewController.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCustomRandomCollectionViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *addImagesButton;
@property (retain, nonatomic) IBOutlet UILabel *imageAddedLabel;
@property (retain, nonatomic) IBOutlet UITextField *nSelectionTextField;
@property (retain, nonatomic) IBOutlet UISwitch *canRepeatSwitch;
- (IBAction)onAddImagesButtonClicked:(id)sender;

@end
