#pragma once
#import <GameKit/GameKit.h>
#import "AppDelegate.h"

#import "cocos2d.h"
#import "HudLayer.h"
#import "Pause_HudLayer.h"


@interface HelloWorldLayer : CCLayer
{
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
    CCMenuItemImage *shopPowerUp2;
    CCMenuItemImage *shopPowerUp3;
    CCMenuItem *starMenuItem;
    
    HudLayer *hud;
    Pause_HudLayer *pause_hud;
    
    CCMenu *life;
    
    
    // Level timer
    CCLabelTTF *timeLabel;
    ccTime totalTime;
    int levelTimeLimit;
    int myTime;
    
    int currentTime;
    int currentLevelScore;
    int totalScore;
    
    // power up times
    
    ccTime totalTimePowerBlue;
    int myTimeBlue;
    int powerLiveTimeLimit;
    int currentTimeBlue;
    
    CCLabelTTF *timeLabelBlue;
    
    BOOL _playerimage;

    
    
}

+(CCScene *) scene:(BOOL)playerImage1;

@end

