//
//  Pause_HudLayer.m
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 12/2/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "Pause_HudLayer.h"
#import "SimpleAudioEngine.h"
#import "HelloWorldLayer_Level3.h"
#import "LevelSelectLayer.h"

@implementation Pause_HudLayer
- (id)init
{
    self = [super init];
    if (self) {
         bg =[CCSprite spriteWithFile:@"level.png"];
         bg.position=ccp(0,0);
         bg.anchorPoint = ccp(0, 0);
         [self addChild:bg z:0];
         bg.visible=false;
        
       // CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Standard method to pause the game
        starMenuItem = [CCMenuItemImage itemWithNormalImage:@"PausePng_45x45.png" selectedImage:@"PausePng_45x45.png" target:self selector:@selector(PauseResumeGame:)];
        
        //starMenuItem.position = ccp(870, 25);
        starMenuItem.position = ccp(800, 740);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
    }
    return self;
    
}

-(void) PauseGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    [[CCDirector sharedDirector] pause];
    self.touchEnabled = NO;
    starMenuItem.visible = NO;
    
}

-(void)startAnimation:(CGPoint)position
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Zoom!" fontName:@"Marker Felt" fontSize:48];
    [self addChild:label];
    NSLog(@"In start");
    // Animate the text from the current position to the end position
    CCSequence *sequence = [CCSequence actions:
                            [CCMoveTo actionWithDuration:3 position:position],
                            [CCCallFuncN actionWithTarget:self selector:@selector(afterAnimation:)],
                            nil];
    
    [label runAction:sequence];
}

-(void)afterAnimation:(id)sender
{
    NSLog(@"afterAnimation");
    [self removeChild:sender cleanup:YES];
}

-(void) PauseResumeGame:(id) sender
{
    //NSLog(@"helloo");
    bg.visible=true;
    [CCMenuItemFont setFontName:@"chalkduster"];
    
    [CCMenuItemFont setFontSize:30];
    
    CCMenuItemImage *resumeGame = [CCMenuItemImage itemWithNormalImage:@"Play_Original.png" selectedImage:@"Play_Original.png" target:self selector:@selector(ResumeGame:)];
    
    resumeGame1 = [CCMenuItemFont itemWithString:@"Resume"
                                                         target:self
                                                       selector:@selector(ResumeGame:)];
    //resumeGame1.position=ccp(600,400);
    
    [resumeGame1 setColor:ccBLUE];
    //[self addChild:resumeGame1];
   
    CCMenuItemImage *restartGame = [CCMenuItemImage itemWithNormalImage:@"RestartPNG_100x100.png" selectedImage:@"RestartPNG_100x100.png" target:self selector:@selector(RestartGame:)];
    restartGame1 = [CCMenuItemFont itemWithString:@"Restart Level"
                                                          target:self
                                                        selector:@selector(RestartGame:)];
    //restartGame1.position=ccp(600,300);
    
    [restartGame1 setColor:ccBLUE];
    //[self addChild:restartGame1];
    
    CCMenuItemImage *menuGame = [CCMenuItemImage itemWithNormalImage:@"LevelSelectPNG_100x100.png" selectedImage:@"LevelSelectPNG_100x100.png" target:self selector:@selector(MenuGame:)];

    menuGame1 = [CCMenuItemFont itemWithString:@"Select Level"
                                                       target:self
                                                     selector:@selector(MenuGame:)];
    //menuGame1.position=ccp(600,200);
    
    [menuGame1 setColor:ccBLUE];
    //[self addChild:menuGame1];
    
    pauseResumeMenu1 = [CCMenu menuWithItems: resumeGame1,restartGame1,menuGame1, nil];
    pauseResumeMenu1.position=ccp(600,400);
    [pauseResumeMenu1 alignItemsVerticallyWithPadding:85];
    [self addChild:pauseResumeMenu1];
    
    pauseResumeMenu = [CCMenu menuWithItems: resumeGame,restartGame,menuGame, nil];
    pauseResumeMenu.position=ccp(400,400);
    [pauseResumeMenu alignItemsVerticallyWithPadding:30];
    [self addChild:pauseResumeMenu];
    
    pauseResumeMenu.visible=true;
    menuGame1.visible=true;
    resumeGame1.visible=true;
    restartGame1.visible=true;
    
    [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(PauseGame:) userInfo:nil repeats:NO];
}

-(void)numCollectedChanged:(int)numCollected
{
    totalScore=numCollected;
    //_label.string = [NSString stringWithFormat:@"Score : %d", numCollected];
}

-(void)ResumeGame:(id)sender
{
    bg.visible=false;
    pauseResumeMenu.visible=false;
    menuGame1.visible=false;
    resumeGame1.visible=false;
    restartGame1.visible=false;
    
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] startAnimation];
    [self removeChild:pauseResumeMenu];
    self.touchEnabled = YES;
    starMenuItem.visible = YES;
}

-(void)RestartGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
    int powerupArray[3];
    powerupArray[0]=0;
    powerupArray[1]=0;
    powerupArray[2]=0;
    
    int playerSelectArray[3];
    playerSelectArray[0]=1;
    playerSelectArray[1]=0;
    playerSelectArray[2]=0;
    
    [[NSUserDefaults standardUserDefaults] setInteger:totalScore forKey:@"Score"];
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level3 scene:NO timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
}


-(void)MenuGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
    [[NSUserDefaults standardUserDefaults] setInteger:totalScore forKey:@"Score"];
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[LevelSelectLayer firstScene:YES]]];
}


@end
