//
//  HelloWorldLayer.h
//  cocos2dsimplegame
//
//  Created by Student on 9/15/13.
//  Copyright gpadmin 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "AppDelegate.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

//
//@interface HudLayer : CCLayer
//- (void)numCollectedChanged:(int)numCollected;
//@end


@interface HelloWorldLayer : CCLayer
{
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *bgLayer;
    CCTMXLayer *background;
    CCSprite *player;
    CCTMXLayer *meta;
    //int numCollected;
    
    //HudLayer *hud;
 
}


// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

