//
//  ShopLayer.m
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 11/5/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "ShopLayer.h"
#import "HelloWorldLayer_Level2.h"

@implementation ShopLayer
+(id) scene3:(int)timeBonus{
    CCScene *scene3 = [CCScene node];
    ShopLayer *layer =[[[ShopLayer alloc] initW:timeBonus] autorelease];
    [scene3 addChild: layer];
    return scene3;
}

-(id) initW:(int)timeBonus
{
    if( (self=[super init] )) {
         /*CCSprite *bg =[CCSprite spriteWithFile:@"shop1.png"];
         bg.position=ccp(0,0);
         bg.anchorPoint = ccp(0, 0);
         [self addChild:bg z:0];*/
        
        
        player1 = false;
        remainingTimeBonus=timeBonus;
        
        [CCMenuItemFont setFontName:@"Chalkduster"];
        [CCMenuItemFont setFontSize:38];
        CCMenuItemFont *bonusPointsLabel = [CCMenuItemFont itemFromString:@"BONUS POINTS:"
                                                               target:self
                                                             selector:@selector(startGame:)];
        bonusPointsLabel.color=ccBLUE;
        CCMenu *menu5 = [CCMenu menuWithItems: bonusPointsLabel, nil];
        menu5.position=ccp(200,700);
        [menu5 alignItemsVerticallyWithPadding:15];
        [self addChild:menu5];
        
        CCLabelTTF * label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", timeBonus]  fontName:@"Chalkduster" fontSize:40];
        label1.color = ccRED;
        //label.color = ccc3(0,0,0);
        label1.position = ccp(200, 600);
        [self addChild:label1];
        
        menuItem3 = [CCMenuItemImage itemFromNormalImage:@"shop1.png"
                                           selectedImage:@"shop1.png"
                                                  target:self selector:@selector(changePlayerImage1:)];
        //menuItem1.position=ccp(300,300);
        CCMenu *menu3 = [CCMenu menuWithItems: menuItem3, nil];
        menu3.position=ccp(500,500);
        [menu3 alignItemsVerticallyWithPadding:15];
        [self addChild:menu3];
        
        menuItem1 = [CCMenuItemImage itemFromNormalImage:@"life.png"
                                           selectedImage:@"life.png"
                                                  target:self selector:@selector(changePlayerImage1:)];
        //menuItem1.position=ccp(300,300);
        CCMenu *menu = [CCMenu menuWithItems: menuItem1, nil];
        menu.position=ccp(300,200);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
        
        CCMenuItemFont *lifePower = [CCMenuItemFont itemFromString:@"40 $"
                                                               target:self
                                                             selector:@selector(startGame:)];
        lifePower.color=ccORANGE;
        CCMenu *menu4 = [CCMenu menuWithItems: lifePower, nil];
        menu4.position=ccp(300,100);
        [menu4 alignItemsVerticallyWithPadding:15];
        [self addChild:menu4];
        
        menuItem2 = [CCMenuItemImage itemFromNormalImage:@"powerup12.png"
                                           selectedImage:@"powerup12.png"
                                                  target:self selector:@selector(changePlayerImage2:)];
        //menuItem2.position=ccp(800,300);
        CCMenu *menu1 = [CCMenu menuWithItems: menuItem2, nil];
        menu1.position=ccp(800,200);
        [menu1 alignItemsVerticallyWithPadding:15];
        [self addChild:menu1];
        
        CCMenuItemFont *bluePower = [CCMenuItemFont itemFromString:@"55 $"
                                                            target:self
                                                          selector:@selector(startGame:)];
        bluePower.color=ccORANGE;
        CCMenu *menu6 = [CCMenu menuWithItems: bluePower, nil];
        menu6.position=ccp(800,100);
        [menu6 alignItemsVerticallyWithPadding:15];
        [self addChild:menu6];

        CCMenuItemFont *selectPlayer = [CCMenuItemFont itemFromString:@"BUY NOW"
                                                               target:self
                                                             selector:@selector(nextLevelStart:)];
        selectPlayer.color=ccBLUE;
        CCMenu *menu2 = [CCMenu menuWithItems: selectPlayer, nil];
        menu2.position=ccp(550,50);
        [menu2 alignItemsVerticallyWithPadding:15];
        [self addChild:menu2];
        
        CCMenuItemFont *shopCart = [CCMenuItemFont itemFromString:@"CART"];
        shopCart.color=ccYELLOW;
        CCMenu *menu7 = [CCMenu menuWithItems: shopCart, nil];
        menu7.position=ccp(850,700);
        [menu7 alignItemsVerticallyWithPadding:15];
        [self addChild:menu7];
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
    
    CCMenuItemImage *menuItem4 = [CCMenuItemImage itemFromNormalImage:@"life.png"
                                                        selectedImage:@"life.png"];
    CCMenu *menu8 = [CCMenu menuWithItems: menuItem4, nil];
    menu8.position=ccp(850,600);
    [menu8 alignItemsVerticallyWithPadding:15];
    [self addChild:menu8];
    remainingTimeBonus=remainingTimeBonus-40;
    
}

-(void) changePlayerImage2: (id) sender {
    player1=false;
    [menuItem2 setScale:2];
    //menuItem2.position=ccp(800/2+40,300*1.5);
    double dx=(800*2-800);
    double dy=(300*2-300);
    menuItem2.position=ccp(800-dx,300-dy);
    [menuItem1 setScale:1];
    
    CCMenuItemImage *menuItem3 = [CCMenuItemImage itemFromNormalImage:@"powerup12.png"
                                       selectedImage:@"powerup12.png"];
    CCMenu *menu9 = [CCMenu menuWithItems: menuItem3, nil];
    menu9.position=ccp(850,650);
    [menu9 alignItemsVerticallyWithPadding:15];
    [self addChild:menu9];
    remainingTimeBonus=remainingTimeBonus-55;
}

-(void) startGame: (id) sender {
    /*[[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:player1]]];*/
}

-(void)nextLevelStart:(id) sender
{
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:YES timeBonus:remainingTimeBonus]]];
}

@end
