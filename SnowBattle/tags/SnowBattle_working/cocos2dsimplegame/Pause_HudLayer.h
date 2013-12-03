//
//  Pause_HudLayer.h
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 12/2/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Pause_HudLayer : CCLayer {
    CCMenuItemImage *starMenuItem;
    CCMenu *pauseResumeMenu;
    CCMenu *pauseResumeMenu1;
    CCSprite *bg;
    int totalScore;
    CCMenuItemFont *menuGame1;
    CCMenuItemFont *restartGame1;
    CCMenuItemFont *resumeGame1;
}

@end
