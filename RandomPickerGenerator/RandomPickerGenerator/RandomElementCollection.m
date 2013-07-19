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
        randomElementsArray = [[NSMutableArray alloc] initWithArray: _randomElementsArray];
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
    NSLog(@"resultSet %@", resultSet);
    return resultSet;
}

-(int) getIndexForRandomElement: (RandomElement*) element {
    return [randomElementsArray indexOfObject:element];
}

- (void) shuffle {
    NSUInteger count = [randomElementsArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [randomElementsArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
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

+ (RandomElementCollection*) generateEngineersCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:NO];
    NSMutableArray* imageNames = [NSMutableArray arrayWithObjects:@"jason.jpg", @"kenny.jpg", @"poon.jpg", @"Sri.jpg",@"waihong.jpg",@"artemis.jpg",@"chien.jpg",@"ernesto.jpg",@"jamoy.jpg", nil];
    [RandomElementCollection addListRandomElementImage:imageNames toCollection:collection];    
    return [collection autorelease];
}

+ (RandomElementCollection*) generateRockPaperScissorsCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:NO];
    NSMutableArray* imageNames = [NSMutableArray arrayWithObjects:@"rock.jpg", @"scissors.jpg", @"paper.jpg", nil];
    [RandomElementCollection addListRandomElementImage:imageNames toCollection:collection];    
    return [collection autorelease];
}

+ (RandomElementCollection*) generateTossCoinRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:YES];
    NSMutableArray* listImageNames = [NSMutableArray arrayWithObjects:@"coin-head.jpg",@"coin-tail.jpg", @"coin-head.jpg",@"coin-tail.jpg",@"coin-head.jpg",@"coin-tail.jpg",nil];
    [RandomElementCollection addListRandomElementImage:listImageNames toCollection:collection];
//    [collection shuffle];
    return [collection autorelease];
}

+ (RandomElementCollection*) generateDrawCardRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:5];
    [collection setCanRepeatElements:YES];
    NSMutableArray* arr = [NSMutableArray array];
    for (int i = 457; i <= 466; i++) {
        NSString* name = [NSString stringWithFormat:@"718%d_f260.jpg", i];
        [arr addObject:name];
    }
    [arr addObject:@"718468_f260.jpg"];
    [arr addObject:@"718527_f260.jpg"];
    
    for (int i = 478; i <= 485; i++) {
        NSString* name = [NSString stringWithFormat:@"718%d_f260.jpg", i];
        [arr addObject:name];
    }
    
    for (int i = 489; i <= 496; i++) {
        NSString* name = [NSString stringWithFormat:@"718%d_f260.jpg", i];
        [arr addObject:name];
    }
    
    for (int i = 499; i <= 506; i++) {
        NSString* name = [NSString stringWithFormat:@"718%d_f260.jpg", i];
        [arr addObject:name];
    }
    
    for (int i = 509; i <= 524; i++) {
        NSString* name = [NSString stringWithFormat:@"718%d_f260.jpg", i];
        [arr addObject:name];
    }
    
    
    
    [RandomElementCollection addListRandomElementImage:arr toCollection:collection];
    [collection shuffle];
    
    return [collection autorelease];
}

+ (RandomElementCollection*) generateRollDiceRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:YES];
    NSMutableArray* listImageNames = [NSMutableArray arrayWithObjects:@"dice1.png",@"dice2.png", @"dice3.png", @"dice4.png", @"dice5.png",@"dice6.png",nil];
    
    [RandomElementCollection addListRandomElementImage:listImageNames toCollection:collection];
    [collection shuffle];
    
    return [collection autorelease];
}

+ (RandomElementCollection*) generateTotallyRandomCollection {
    RandomElementCollection* collection = [[RandomElementCollection alloc] init];
    [collection setNumberOfSelections:1];
    [collection setCanRepeatElements:NO];
    NSMutableArray* listImageNames = [NSMutableArray arrayWithObjects:@"win_1.png",@"win_2.png",@"win_3.png",@"win_4.png",@"win_5.png",@"win_6.png",@"win_7.png",@"win_8.png",@"win_9.png",@"win_10.png",@"win_11.png",@"win_12.png",@"win_13.png",@"win_14.png",@"win_15.png",@"win_16.png",nil];
    NSLog(@"listImageNames %@", listImageNames);
    [RandomElementCollection addListRandomElementImage:listImageNames toCollection:collection];
    NSLog(@"collection %@ size %d", collection, [collection getSizeOfSet]);
    return [collection autorelease];    
}




@end