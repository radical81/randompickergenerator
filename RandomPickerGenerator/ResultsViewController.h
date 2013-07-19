//
//  ResultsViewController.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomElementCollection.h"
#import "RVCollectionViewLayout.h"

@interface ResultsViewController : UIViewController
@property (nonatomic, retain) RandomElementCollection* collection;


@property (nonatomic, retain) IBOutlet UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * imagesArray;
@property (nonatomic, strong) NSMutableArray * imageNamesArray;
@property (nonatomic, strong) RVCollectionViewLayout * collectionViewLayout;
@end
