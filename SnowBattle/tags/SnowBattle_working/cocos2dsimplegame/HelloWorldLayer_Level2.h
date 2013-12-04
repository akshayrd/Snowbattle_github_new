#pragma once
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"
#import "Bonus_hud.h"
#import "Pause_HudLayer.h"

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
    CCTMXLayer *powerGrenadeLayer;
    CCTMXLayer *grenadeLayer;
    CCTMXLayer *bonusLayer;
    
    CCTMXLayer *ghostpitLayer;

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
    Bonus_hud *b_hud;
    Pause_HudLayer *pause_hud;
    BOOL bonusStageRunning;
    
    
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
    
}

+(CCScene *) scene2:(BOOL)playerImage1 timeBonus:(int)timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray;
- (void) Ghost1move:(ccTime)dt;
@end
