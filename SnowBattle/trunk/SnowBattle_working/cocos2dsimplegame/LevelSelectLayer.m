//
//  LevelSelectLayer.m
//  cocos2dsimplegame
//
//  Created by Student on 10/15/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "LevelSelectLayer.h"
#import "HelloWorldLayer.h"
#import "HelloWorldLayer_Level2.h"

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
        player1Select=start;
        CCSprite *bg =[CCSprite spriteWithFile:@"levelscreen_final.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        
        [CCMenuItemFont setFontName:@"Chalkduster"];
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
        [newGame1 setColor:ccBLUE];
        [newGame2 setColor:ccRED];
        [newGame3 setColor:ccRED];

        // not working
        newGame.position = ccp(240, 500);
        newGame1.position = ccp(540, 500);
        newGame2.position = ccp(240, 300);
        newGame3.position = ccp(440, 300);
        
        CCMenuItemImage *menuItem1 = [CCMenuItemImage itemFromNormalImage:@"bug_51x51.png"
                                                            selectedImage:@"bug_51x51.png"
                                                            target:self selector:@selector(startGame:start:)];
        
        //CCMenu *menu = [CCMenu menuWithItems: newGame, newGame1, newGame2,newGame3, menuItem1, nil];
        CCMenu *menu = [CCMenu menuWithItems: newGame, newGame1, newGame2,newGame3, nil];
        menu.position=ccp(440,200);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];

    }
    return self;
}

-(void) startGame: (id) sender{
    NSLog(@"1111Heree");
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer scene:player1Select]]];
}

-(void) startGameLevel2:(id) sender{
    NSLog(@"222Heree");
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:player1Select]]];

}

@end
