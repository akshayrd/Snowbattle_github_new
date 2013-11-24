//
//  HelloWorldLayer_Level3.h
//  cocos2dsimplegame
//
//  Created by Chetna Aggarwal on 11/22/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"

@interface HelloWorldLayer_Level3 : CCLayer {
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
    CCTMXLayer *powerGrenadeLayer;
    CCTMXLayer *grenadeLayer;
    CCTMXLayer *bonusLayer;
    int livePowerEnabled1;
    
    CCTMXLayer *ghostpitLayer;
    CCSprite *monster5;
    CCSprite *monster6;
    CCSprite *monster7;
    CCSprite *monster8;
    int darkBlueCount;
    int powerBlue;
    int powerGrenade;
    int count;
    int lifeCount;
    int winScore;
    int totalLives;
    CCMenuItem *lifeItem[5];
    CCSprite* bubble;
    CCSprite* bubble2;
    CCSprite* bubble3;
    CCMenu *pauseResumeMenu;
    CCMenu *Powerupmenu2;
    CCMenuItem *starMenuItem;
    
    CGSize screenSize2;
    
    CCMenu *life;
    HudLayer *hud;
    BOOL bonusStageRunning;
    
    
    // Level timer
    CCLabelTTF *timeLabel;
    ccTime totalTime;
    int levelTimeLimit;
    int myTime;
    
    int currentTime;
    int currentTimeImmune;
    int myTimeImmune;
    int totalTimeImmune;
    
    // power up times
    
    ccTime totalTimePowerBlue;
    int myTimeBlue;
    int powerLiveTimeLimit;
    int currentTimeBlue;
    CCMenuItemImage* shopPowerUp1;
    CCMenuItemImage* shopPowerUp2;
    CCSprite *plane;
    CCSprite *_planeShadow;
    
    int playerDirection ;
    
    int collideTime;
    int immuneDuration;
    CCLabelTTF *timeLabelBlue;
    BOOL _playerimage;
    BOOL bonusRoundPlayed ;
    CGPoint bonusPointsLocation[5];
    bool isBonusDisplayed;
    int bonusIndex;
    
    int currentLevelScore;
    int totalScore;
    
    int pitTime;
    CCSprite * monster13;
    int c;
    int immunePowerUp;
    
}

+(CCScene *) scene:(BOOL)playerImage1 timeBonus:(int)timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray;

@end
