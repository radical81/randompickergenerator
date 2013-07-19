//
//  RandomElementCollection.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomElement.h"

@interface RandomElementCollection : NSObject

@property (nonatomic, retain) NSMutableArray* randomElementsArray;
@property (nonatomic) int numberOfSelections;
@property (nonatomic) BOOL canRepeatElements;

-(id) initWithArray:(NSArray*)_randomElementsArray numberOfSelections: (int) _numberOfSelections canRepeatElements: (BOOL) _canRepeatElements;
-(int) getSizeOfSet;
-(RandomElement*)getElementAtIndex:(int)_index;
-(NSMutableArray*) randomize;
-(int) getIndexForRandomElement: (RandomElement*) element;
- (void) shuffle;

+ (RandomElementCollection*) generateTossCoinRandomCollection;
+ (RandomElementCollection*) generateDrawCardRandomCollection;
+ (RandomElementCollection*) generateRollDiceRandomCollection;

+ (void) addListRandomElementImagePath: (NSArray*) listElementImage toCollection: (RandomElementCollection*) collection;
@end
