//
//  RandomElement.m
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import "RandomElement.h"

@implementation RandomElement

@synthesize elementText;
@synthesize elementImage;
@synthesize elementImagePath;

-(id) initWithText:(NSString*)_elementText {
    self = [super init];
    if(self) {
        self.elementText = _elementText;
    }
    return self;
}

-(id) initWithImage:(NSString*)_elementImage {
    self = [super init];
    if(self) {
        self.elementImage = _elementImage;
    }
    return self;
}


-(id) initWithImagePath:(NSString*)_elementImagePath {
    self = [super init];
    if(self) {
        self.elementImagePath = _elementImagePath;
    }
    return self;
}


-(void) dealloc {
    [elementImage release];
    [elementText release];
    [elementImagePath release];
    [super dealloc];
}
@end
