//
//  PlayerSelectLayer.m
//  cocos2dsimplegame
//
//  Created by Student on 11/3/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "PlayerSelectLayer.h"
#import "HelloWorldLayer.h"
#import "LevelSelectLayer.h"

@implementation PlayerSelectLayer

+(id) selectScene:(BOOL)start{
    CCScene *selectScene = [CCScene node];
    PlayerSelectLayer *layer =[[[PlayerSelectLayer alloc] initW:start] autorelease];
    [selectScene addChild: layer];
    return selectScene;
}

-(id) initW:(BOOL)start
{
    if( (self=[super init] )) {
       /* CCSprite *bg =[CCSprite spriteWithFile:@"levelscreen_final.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];*/
        
        [CCMenuItemFont setFontName:@"Chalkduster"];
        [CCMenuItemFont setFontSize:38];
        player1 = false;
        menuItem1 = [CCMenuItemImage itemFromNormalImage:@"HyperPlayer_40x40.png"
                                                            selectedImage:@"HyperPlayer_40x40.png"
                                                                   target:self selector:@selector(changePlayerImage1:)];
        //menuItem1.position=ccp(300,300);
        CCMenu *menu = [CCMenu menuWithItems: menuItem1, nil];
        menu.position=ccp(300,300);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];

        
        menuItem2 = [CCMenuItemImage itemFromNormalImage:@"NormalPlayer_40x40.png"
                                                            selectedImage:@"NormalPlayer_40x40.png"
                                                                   target:self selector:@selector(changePlayerImage2:)];
        //menuItem2.position=ccp(800,300);
        CCMenu *menu1 = [CCMenu menuWithItems: menuItem2, nil];
        menu1.position=ccp(800,300);
        [menu1 alignItemsVerticallyWithPadding:15];
        [self addChild:menu1];
        
        CCMenuItemFont *selectPlayer = [CCMenuItemFont itemFromString:@"SELECT PLAYER"
                                                          target:self
                                                        selector:@selector(startGame:)];
        selectPlayer.color=ccBLUE;
        CCMenu *menu2 = [CCMenu menuWithItems: selectPlayer, nil];
        menu2.position=ccp(550,200);
        [menu2 alignItemsVerticallyWithPadding:15];
        [self addChild:menu2];
        
    }
    return self;
}

-(void) changePlayerImage1: (id) sender {
    player1=true;
    [menuItem1 setScale:2];
    //menuItem1.position=ccp(300/2+40,300*1.5);
    double dx=(300*2-300);
    double dy=(300*2-300);
    menuItem1.position=ccp(300-dx,300-dy);
    [menuItem2 setScale:1];
}

-(void) changePlayerImage2: (id) sender {
    player1=false;
    [menuItem2 setScale:2];
    //menuItem2.position=ccp(800/2+40,300*1.5);
    double dx=(800*2-800);
    double dy=(300*2-300);
    menuItem2.position=ccp(800-dx,300-dy);    
    [menuItem1 setScale:1];
}

-(void) startGame: (id) sender {
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:player1]]];
}

@end
