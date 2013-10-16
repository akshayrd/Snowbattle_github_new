//
//  LevelSelectLayer.m
//  cocos2dsimplegame
//
//  Created by Student on 10/15/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "LevelSelectLayer.h"
#import "HelloWorldLayer.h"


@implementation LevelSelectLayer


+(id) firstScene:(BOOL)start{
    CCScene *firstScene = [CCScene node];
    LevelSelectLayer *layer =[[[LevelSelectLayer alloc] initW:start] autorelease];
    [firstScene addChild: layer];
    return firstScene;
}

-(id) initW:(BOOL)start
{
    if( (self=[super init] )) {
        CCSprite *bg =[CCSprite spriteWithFile:@"level.png"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        
        [CCMenuItemFont setFontName:@"Courier New"];
        [CCMenuItemFont setFontSize:38];
        
        CCMenuItemFont *newGame = [CCMenuItemFont itemFromString:@"Level 1"
                                                          target:self
                                                        selector:@selector(startGame:)];
        
        CCMenuItemFont *newGame1 = [CCMenuItemFont itemFromString:@"Level 2"
                                                          target:self
                                                        selector:@selector(startGameLevel2:)];
        CCMenuItemFont *newGame2 = [CCMenuItemFont itemFromString:@"Level 3"
                                                           target:self
                                                         selector:@selector(startGameLevel2:)];
        CCMenuItemFont *newGame3 = [CCMenuItemFont itemFromString:@"Level 4"
                                                           target:self
                                                         selector:@selector(startGameLevel2:)];
        [newGame setColor:ccBLUE];
        [newGame1 setColor:ccRED];
        [newGame2 setColor:ccRED];
        [newGame3 setColor:ccRED];
        CCMenu *menu = [CCMenu menuWithItems: newGame, newGame1, newGame2,newGame3, nil];
        menu.position=ccp(240,500);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];

    }
    return self;
}

-(void) startGame: (id) sender {
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer node]]];
}

-(void) startGameLevel2: (id) sender {
    ;
}

@end
