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
    
    HudLayer *hud;
    
    
    // Level timer
    CCLabelTTF *timeLabel;
    ccTime totalTime;
    int levelTimeLimit;
    int myTime;
    
    int currentTime;

    
    
}

+(CCScene *) scene;

@end

