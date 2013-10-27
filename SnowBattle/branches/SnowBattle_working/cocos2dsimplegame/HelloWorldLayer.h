#import <GameKit/GameKit.h>
#import "AppDelegate.h"

#import "cocos2d.h"


@interface HudLayer : CCLayer
- (void)numCollectedChanged:(int)numCollected;
@end


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
    
    
    HudLayer *hud;
    
    CCMenu *life;
    
    
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
    
    CCLabelTTF *timeLabelBlue;
    
    CGPoint firstTouch;
    CGPoint lastTouch;
    

    
    
}

+(CCScene *) scene;

@end

