//
//  LevelSelectLayer.h
//  cocos2dsimplegame
//
//  Created by Student on 10/15/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelSelectLayer : CCLayer {
    BOOL player1Select;
    NSMutableArray *powerupList;
    CCMenuItemFont *selectLevel ;
}

+(id) firstScene:(BOOL)start;
- (id)initW:(BOOL)start;

@end
