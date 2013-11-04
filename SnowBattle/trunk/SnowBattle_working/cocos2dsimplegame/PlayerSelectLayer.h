//
//  PlayerSelectLayer.h
//  cocos2dsimplegame
//
//  Created by Student on 11/3/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PlayerSelectLayer : CCLayer {
    Boolean player1;
    CCMenuItemImage *menuItem1;
    CCMenuItemImage *menuItem2;
}

+(id) selectScene:(BOOL)start;
- (id)initW:(BOOL)start;

@end
