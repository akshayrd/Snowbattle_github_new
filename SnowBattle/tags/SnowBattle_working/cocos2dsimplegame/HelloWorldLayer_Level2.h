#pragma once
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"


@interface HelloWorldLayer_Level2 : CCLayer {
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *bgLayer;
    CCTMXLayer *snow;
    CCSprite *player;
    CCTMXLayer *building;
    CCTMXLayer *border;
    CCTMXLayer *street;
    CCTMXLayer *darkBlue;
    CCTMXLayer *powerBlueLayer;
    CCTMXLayer *powerLivesLayer;
    int darkBlueCount;
    int powerBlue;
    int count;
    int lifeCount;
    int winScore;
    int totalLives;
    CCMenuItem *lifeItem[5];
    CCSprite* bubble;
    CCSprite* bubble2;
    CCSprite* bubble3;
    CCMenu *pauseResumeMenu;
    
    CCMenu *life;
    HudLayer *hud;
    
    
    // Level timer
    CCLabelTTF *timeLabel;
    ccTime totalTime;
    int levelTimeLimit;
    int myTime;
    
    int currentTime;
    
    // power up times
    
    ccTime totalTimePowerBlue;
    int myTimeBlue;
    int powerLiveTimeLimit;
    int currentTimeBlue;
    CCMenuItemImage* shopPowerUp1;
    CCMenuItemImage* shopPowerUp2;
    
    int playerDirection ;
    
    
    CCLabelTTF *timeLabelBlue;
    
}

+(CCScene *) scene2:(BOOL)start timeBonus:(int)timeRemaining powerup1:(Boolean)s1 powerup2:(Boolean)s2;

@end
