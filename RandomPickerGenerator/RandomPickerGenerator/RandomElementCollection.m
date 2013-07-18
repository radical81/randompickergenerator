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
    return resultSet;
}

@end
