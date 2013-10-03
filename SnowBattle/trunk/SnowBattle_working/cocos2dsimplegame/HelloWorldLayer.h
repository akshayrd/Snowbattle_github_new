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
    CCTMXLayer *background;
    CCSprite *player;
    CCTMXLayer *meta;
    
    HudLayer *hud;
 
}

+(CCScene *) scene;

@end

