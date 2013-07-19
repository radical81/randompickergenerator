//
//  AddCustomRandomCollectionViewController.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerController.h"

@interface AddCustomRandomCollectionViewController : UIViewController <ELCImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIButton *addImagesButton;
@property (retain, nonatomic) IBOutlet UILabel *imageAddedLabel;
@property (retain, nonatomic) IBOutlet UITextField *nSelectionTextField;
@property (retain, nonatomic) IBOutlet UISwitch *canRepeatSwitch;
@property (retain, nonatomic) NSMutableArray* listImages;

- (IBAction)onAddImagesButtonClicked:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;

@end
