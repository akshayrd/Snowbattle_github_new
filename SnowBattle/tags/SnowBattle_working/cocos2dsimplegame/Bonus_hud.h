//
//  Bonus_hud.h
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 11/15/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"

@interface Bonus_hud : CCLayer {
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *bgLayer;
    CCTMXLayer *snow;
    CCSprite   *playerB;
    CCTMXLayer *building;
    CCTMXLayer *border;
    CCTMXLayer *street;
    CCTMXLayer *darkBlue;
    CCTMXLayer *powerBlueLayer;
    CCTMXLayer *powerLivesLayer;
    CCTMXLayer *powerGrenadeLayer;
    CCTMXLayer *grenadeLayer;
    CCTMXLayer *bonusLayer;
    
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
    
    CCMenu *life;
    HudLayer *hud;
    BOOL inBonusStage;
    
    
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
    bool touchEnabled;
    
    int collideTime;
    int immuneDuration;
    CCLabelTTF *timeLabelBlue;
    BOOL _playerimage;
    
    int _numCollected;
    

    
}

-(void) setTouch;


+(Bonus_hud *) scene:(BOOL)playerImage1;

@end
