//
//  RandomElementCollection.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "RandomElementCollection.h"

@implementation RandomElementCollection

@synthesize randomElementsArray;
@synthesize numberOfSelections;
@synthesize canRepeatElements;

-(id) initWithArray:(NSArray*)_randomElementsArray numberOfSelections: (int) _numberOfSelections canRepeatElements: (BOOL) _canRepeatElements {
    self = [super init];
    if(self) {
        randomElementsArray = _randomElementsArray;
        numberOfSelections = _numberOfSelections;
        canRepeatElements = _canRepeatElements;
    }
    return self;
}

-(void) dealloc {
    [randomElementsArray release];
    [super dealloc];
}

-(int) getSizeOfSet {
    return [randomElementsArray count];
}

-(RandomElement*)getElementAtIndex:(int)_index {
    return [randomElementsArray objectAtIndex:_index];
}

-(NSMutableArray*) randomize {
    NSMutableArray* resultSet =[[[NSMutableArray alloc]init] autorelease];
    for (int i = 0; i < numberOfSelections; i++) {
        int nElement = [self getSizeOfSet];
        while (true) {
            int index = arc4random_uniform(nElement);
            RandomElement* element = [self getElementAtIndex:index];
            if (![resultSet containsObject:element] || canRepeatElements) {
                [resultSet addObject:element];
                break;
            }
        }
    }
    return resultSet;
}


+ (RandomElementCollection*) generateTossCoinRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:YES];
    NSMutableArray* listImageNames = [NSMutableArray arrayWithObjects:@"coin-head.jpg",@"coin-tail.jpg", nil];
    [RandomElementCollection addListRandomElementImage:listImageNames toCollection:collection];
    return [collection autorelease];
}

+ (RandomElementCollection*) generateDrawCardRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    return [collection autorelease];
}

+ (RandomElementCollection*) generateRollDiceRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:YES];
    NSMutableArray* listImageNames = [NSMutableArray arrayWithObjects:@"dice1.png",@"dice2.png", @"dice3.png", @"dice4.png", @"dice5.png",@"dice6.png",nil];
    [RandomElementCollection addListRandomElementImage:listImageNames toCollection:collection];
    return [collection autorelease];
}

+ (void) addListRandomElementImage: (NSArray*) listElementImage toCollection:(RandomElementCollection*) collection {
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < [listElementImage count]; i++) {
        RandomElement* element = [[RandomElement alloc] initWithImage:[listElementImage objectAtIndex:i]];
        [arr addObject:element];
        [element release];
    }
    [collection setRandomElementsArray:arr];
    [arr release];
}

@end