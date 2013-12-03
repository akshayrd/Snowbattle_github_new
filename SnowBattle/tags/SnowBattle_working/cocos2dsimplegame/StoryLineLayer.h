//
//  StoryLineLayer.h
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 12/3/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StoryLineLayer : CCLabelBMFont
{
   // NSObject <StoryLineLayerDelegate> *delegate;
    NSMutableArray *arrayOfCharacters;
    NSString *autoTypeString;
}
+(id) scene;
@end
