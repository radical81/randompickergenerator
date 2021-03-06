//
//  AddCustomRandomCollectionViewController.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "AddCustomRandomCollectionViewController.h"
#import "ELCAlbumPickerController.h"
#import "ELCImagePickerController.h"
#import "AppDelegate.h"


@implementation AddCustomRandomCollectionViewController
@synthesize listImages;
@synthesize nameTextField = _nameTextField;
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


- (void)viewDidUnload
{
    [self setAddImagesButton:nil];
    [self setImageAddedLabel:nil];
    [self setNSelectionTextField:nil];
    [self setCanRepeatSwitch:nil];
    [self setNameTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


- (void)dealloc {
    [_addImagesButton release];
    [_imageAddedLabel release];
    [_nSelectionTextField release];
    [_canRepeatSwitch release];
    [_nameTextField release];
    [super dealloc];
}
- (IBAction)onAddImagesButtonClicked:(id)sender {
    ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName: nil bundle: nil];
	ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
    [albumController setParent:elcPicker];
	[elcPicker setDelegate:self];
    
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    if ([app.viewController respondsToSelector:@selector(presentViewController:animated:completion:)]){
//        [app.viewController presentViewController:elcPicker animated:YES completion:nil];
//    } else {
//        [app.viewController presentModalViewController:elcPicker animated:YES];
//    }
    
//    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
//        [self presentViewController:elcPicker animated:YES completion:nil];
//    } else {
//        [self presentModalViewController:elcPicker animated:YES];
//    }
    
    [self presentViewController:elcPicker
                       animated:YES
                     completion:nil];
    
    [elcPicker release];
    [albumController release];
}


#pragma mark ELCImagePickerControllerDelegate Methods


#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
    
    [listImages release];
    self.listImages = [[NSMutableArray alloc] init];
    
    [_imageAddedLabel setText:[NSString stringWithFormat:@"%d images added", [info count]]];
	
	for(NSDictionary *dict in info) {
        UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];
        [listImages addObject:image];
		
	}
	
}


-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

- (void) finishAdding {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    NSString * name = [_nameTextField text];
    NSString* nSelection = [_nSelectionTextField text];
    BOOL canRepeat = [_canRepeatSwitch isOn];
    
    [dict setObject:name forKey:@"name"];
    [dict setObject:nSelection forKey:@"nSelection"];
    if (canRepeat) {
        [dict setObject:@"1" forKey:@"canRepeat"];
    }
    else {
        [dict setObject:@"0" forKey:@"canRepeat"];
    }
    
    
    NSLog (@"name = %@, nSelection = %@", name, nSelection);
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"path = %@", path);
    NSMutableArray* listFileName = [NSMutableArray array];
    
    //Store the list of image & json
    for (int i = 0; i < [self.listImages count]; i++) {
        UIImage* image = [listImages objectAtIndex:i];
        NSString* fileName = [self generateRandomName];
        NSLog(@"fileName = %@", fileName);
        
        [self saveImage:image withFileName:fileName ofType:@"png" inDirectory:path];
        [listFileName addObject:fileName];
    }
    
    [dict setObject:listFileName forKey:@"images"];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:&error];
    NSString* jsonStr =  [[[NSString alloc] initWithData:jsonData
                                                                  encoding:NSUTF8StringEncoding] autorelease];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray* arr = [defaults objectForKey:@"custom"];
    NSMutableArray* mutableArr = [NSMutableArray array];
    if (arr != nil) {
        [mutableArr addObjectsFromArray:arr];
    }
    [mutableArr addObject:jsonStr];
    [defaults setObject:mutableArr forKey:@"custom"];
    [defaults synchronize];
    [dict release];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString*) generateRandomName {
    int index = arc4random_uniform(99999999999);
    return [NSString stringWithFormat:@"%d", index];
}


@end
