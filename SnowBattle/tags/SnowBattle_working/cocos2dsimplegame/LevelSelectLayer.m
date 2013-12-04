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
#import "HelloWorldLayer_Level3.h"
#import "SimpleAudioEngine.h"
#import "GameStartLayer.h"

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
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"GameSound.mp3"];
        
        CCParticleRain * p = [[CCParticleRain alloc]initWithTotalParticles:10000];
        [p autorelease];
        p.texture=[[CCTextureCache sharedTextureCache] addImage:@"snowImage.png"];
        p.autoRemoveOnFinish = YES;
        p.speed=100.0;
        p.duration = 1000;
        p.position=ccp(200,750);
        p.scaleX=2.0f;
        p.endSize=10.0f;
        p.startSize = 8.0f;
        //p.startColor = [ccColor4F colorWithRed:0 green:0 blue:255];
        [self addChild:p z:1];
        
        selectLevel1 = [CCMenuItemImage itemWithNormalImage:@"SelectLevel_clipped_rev_1.png"
                                                           selectedImage:@"SelectLevel_clipped_rev_1.png" target:self
                                                                selector:@selector(nextLevelStart:)];
        /*selectLevel = [CCMenuItemFont itemWithString:@"Select Level"
                                              target:self
                                            selector:@selector(nextLevelStart:)];*/
        selectLevel1.tag=0;
        //selectLevel.color=ccBLACK;
        selectLevel1.visible=false;
        CCMenu *menu2 = [CCMenu menuWithItems: selectLevel1, nil];
        menu2.position=ccp(550,50);
        [menu2 alignItemsVerticallyWithPadding:15];
        [self addChild:menu2];
        
        
        [CCMenuItemFont setFontName:@"Chalkduster"];
        [CCMenuItemFont setFontSize:38];
        
        CCMenuItemImage *newGame = [CCMenuItemImage itemWithNormalImage:@"Level1.png"
                                                          selectedImage:@"Level1.png" target:self
                                                               selector:@selector(showMap:)];
        /*CCMenuItemFont *newGame = [CCMenuItemFont itemWithString:@"Level 1"
                                                          target:self
                                                        selector:@selector(showMap:)];*/
        powerupList=[[NSMutableArray alloc] initWithCapacity:2];
        powerupList[0]=[NSString stringWithFormat:@"1"];
        newGame.userData=powerupList;
        
        CCMenuItemImage *newGame1 = [CCMenuItemImage itemWithNormalImage:@"Level2.png"
                                                          selectedImage:@"Level2.png" target:self
                                                               selector:@selector(showMap:)];

       /* CCMenuItemFont *newGame1 = [CCMenuItemFont itemWithString:@"Level 2"
                                                           target:self
                                                         selector:@selector(showMap:)];*/
        powerupList=[[NSMutableArray alloc] initWithCapacity:2];
        powerupList[0]=[NSString stringWithFormat:@"2"];
        newGame1.userData=powerupList;
        
        CCMenuItemImage *newGame2 = [CCMenuItemImage itemWithNormalImage:@"Level3.png"
                                                           selectedImage:@"Level3.png" target:self
                                                                selector:@selector(showMap:)];
        /*CCMenuItemFont *newGame2 = [CCMenuItemFont itemWithString:@"Level 3"
                                                           target:self
                                                         selector:@selector(showMap:)];*/
        powerupList=[[NSMutableArray alloc] initWithCapacity:2];
        powerupList[0]=[NSString stringWithFormat:@"3"];
        newGame2.userData=powerupList;
//        CCMenuItemFont *newGame3 = [CCMenuItemFont itemWithString:@"Level 4"
//                                                           target:self
//                                                         selector:@selector(showMap:)];
       // [newGame setColor:ccBLUE];
       // [newGame1 setColor:ccBLUE];
       // [newGame2 setColor:ccBLUE];
        //[newGame3 setColor:ccRED];
        
        CCMenu *menu = [CCMenu menuWithItems: newGame, newGame1, newGame2, nil];
        menu.position=ccp(140,200);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
        
        CCMenuItemImage *selectLevel1 = [CCMenuItemImage itemWithNormalImage:@"GameArrowBlue_Modified.png"
                                                              selectedImage:@"GameArrowBlue_Modified.png"
                                                                     target:self
                                                                   selector:@selector(goBack:)];
        //selectLevel.color=ccBLUE;
        //selectLevel.visible=false;
        CCMenu *menu12 = [CCMenu menuWithItems: selectLevel1, nil];
        menu12.position=ccp(120,50);
        [menu12 alignItemsVerticallyWithPadding:15];
        [self addChild:menu12 z:1];
    }
    return self;
}

-(void) goBack: (id) sender {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES] ]];
}

-(void) showMap: (CCMenuItemFont *) sender{
    
    NSMutableArray *a=[[NSMutableArray alloc] initWithCapacity:2];
    a=sender.userData;
    CCMenuItemImage *menuItem19;
    CCMenu *menu8;
    
    NSString *b=[a objectAtIndex:0];
    int levelSelected = [b integerValue];
    
    if(levelSelected==1)
    {
        menuItem19 = [CCMenuItemImage itemWithNormalImage:[NSString stringWithFormat:@"level1_map.png"]
                                            selectedImage:[NSString stringWithFormat:@"level1_map.png"]
                                                   target:self selector:@selector(nextLevelStart:)];
        menuItem19.tag = levelSelected;
        menu8 = [CCMenu menuWithItems: menuItem19, nil];
        menu8.visible=false;
    }
    else if(levelSelected==2)
    {
        menuItem19 = [CCMenuItemImage itemWithNormalImage:[NSString stringWithFormat:@"level2_map.png"]
                                            selectedImage:[NSString stringWithFormat:@"level2_map.png" ] target:self selector:@selector(nextLevelStart:)];
        menuItem19.tag = levelSelected;
        menu8 = [CCMenu menuWithItems: menuItem19, nil];
        menu8.visible=false;
        
    }
    else{
        menuItem19 = [CCMenuItemImage itemWithNormalImage:[NSString stringWithFormat:@"level3_map.png"]
                                            selectedImage:[NSString stringWithFormat:@"level3_map.png"] target:self selector:@selector(nextLevelStart:)];
        menuItem19.tag = levelSelected;
        menu8 = [CCMenu menuWithItems: menuItem19, nil];
        menu8.visible=false;
    }
    
    menu8.position=ccp(600,300);
    [menu8 alignItemsVerticallyWithPadding:15];
    [self addChild:menu8];
    menu8.visible=true;
    
    selectLevel1.tag=levelSelected;
    selectLevel1.visible=true;
}

-(void) nextLevelStart:(CCMenuItemFont *) sender{
    
    int selectedLevel=(int)sender.tag;
    
    if(selectedLevel==1)
    {
        [[CCDirector sharedDirector]
         replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer scene:YES]]];
    }
    else if(selectedLevel==2)
    {
        int powerupArray[3];
        powerupArray[0]=0;
        powerupArray[1]=0;
        powerupArray[2]=0;
        int playerSelectArray[3];
        playerSelectArray[0]=1;
        playerSelectArray[1]=0;
        playerSelectArray[2]=0;
        
        [[CCDirector sharedDirector]
         replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:player1Select timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
    }
    else if(selectedLevel==3)
    {
        int powerupArray[3];
        powerupArray[0]=0;
        powerupArray[1]=0;
        powerupArray[2]=0;
        int playerSelectArray[3];
        playerSelectArray[0]=1;
        playerSelectArray[1]=0;
        playerSelectArray[2]=0;
        
        [[CCDirector sharedDirector]
         replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level3 scene:player1Select timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
    }
    
}

@end
