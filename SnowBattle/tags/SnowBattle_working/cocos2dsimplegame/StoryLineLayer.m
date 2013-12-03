//
//  StoryLineLayer.m
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 12/3/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "StoryLineLayer.h"
#import "LevelSelectLayer.h"

@implementation StoryLineLayer

+(id) scene{
    CCScene *scene = [CCScene node];
    StoryLineLayer *layer =[[[StoryLineLayer alloc] init] autorelease];
    [scene addChild: layer];
    return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        static NSUInteger currentCharacter = 0;
        
        // Your instance variable stores the text you want to "type" in it:
        //NSString *_text;
        
        // Sorry, I can't remember substring functions, this is pseudo-code:
        //NSString *substring = [@"This string is immutable" getSubstringFrom:0 to:currentCharacter];
        
        // Also can't remember how to get length of a string (yipes)
        NSUInteger stringLength = [@"This string is immutable" length];
        
        if (currentCharacter < stringLength)
        {
            CCSequence *loop = [CCSequence actions:[CCDelayTime actionWithDuration:0.3f],[CCCallFunc actionWithTarget:self selector:@selector(typeText)],nil];
            [self runAction:loop];
        }
    }
    return self;
}
@end
