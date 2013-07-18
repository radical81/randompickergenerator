//
//  RandomElement.h
//  RandomPickerGenerator
//
//  Created by Rex Jason Alobba on 18/7/13.
//  Copyright (c) 2013 ralobba@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomElement : NSObject

@property (nonatomic, retain) NSString* elementText;
@property (nonatomic, retain) NSString* elementImage;

-(id) initWithText:(NSString*)_elementText;
-(id) initWithImage:(NSString*)_elementImage;

@end
