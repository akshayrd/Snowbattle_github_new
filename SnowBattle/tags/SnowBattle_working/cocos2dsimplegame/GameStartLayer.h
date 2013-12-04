//
//  GameStartLayer.h
//  cocos2dsimplegame
//
//  Created by Student on 10/7/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface GameStartLayer : CCLayer {
    
}

+(id) firstScene:(BOOL)start;
- (id)initW:(BOOL)start;

@end
