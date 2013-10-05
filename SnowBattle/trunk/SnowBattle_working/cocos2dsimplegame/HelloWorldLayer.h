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
    CCTMXLayer *meta;
    CCTMXLayer *border;
    CCTMXLayer *street;
    
    HudLayer *hud;
 
}

+(CCScene *) scene;

@end

