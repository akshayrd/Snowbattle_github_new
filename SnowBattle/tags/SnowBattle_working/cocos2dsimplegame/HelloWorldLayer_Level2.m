//
//  HelloWorldLayer_Level2.m
//  cocos2dsimplegame
//
//  Created by Student on 10/30/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "HelloWorldLayer_Level2.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "GameOverLayer.h"
#import "GameStartLayer.h"
#import "LevelSelectLayer.h"

@interface HelloWorldLayer_Level2 ()
@property (assign) int numCollected;

@end

#pragma mark - HelloWorldLayer_Level2
// HelloWorldLayer implementation

@implementation HelloWorldLayer_Level2

+(CCScene *) scene2:(BOOL)start timeBonus:(int) timeRemaining powerup1:(Boolean)powerup1Check powerup2:(Boolean)powerup2Check{
    // 'scene' is an autorelease object.
    CCScene *scene2 = [CCScene node];
    
    // 'layer' is an autorelease object.
    HelloWorldLayer_Level2 *layer = [[HelloWorldLayer_Level2 alloc] initWithPlayer:start timeBonus:timeRemaining powerup1:powerup1Check powerup2:powerup2Check];
    
    // add layer as a child to scene
    [scene2 addChild: layer];
    
    return scene2;
    
}

// on "init" you need to initialize your instance

-(id) initWithPlayer:(BOOL)player1 timeBonus:(int) timeRemaining powerup1:(Boolean)powerup1Check powerup2:(Boolean)powerup2Check

{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        //self.isTouchEnabled = YES;
        count = 90;
        darkBlueCount = 0;
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"funk.mp3"];
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"tileMap3.tmx"];
        snow = [_tileMap layerNamed:@"Snow"];
        border = [_tileMap layerNamed:@"Border"];
        //street  = [_tileMap layerNamed:@"Street"];
        building = [_tileMap layerNamed:@"Building"];
        darkBlue = [_tileMap layerNamed:@"DarkBlueTiles"];
        powerBlueLayer = [_tileMap layerNamed:@"power_blue"];
        powerLivesLayer = [_tileMap layerNamed:@"Power_lives"];
        powerLivesLayer.visible = FALSE;
        //[_tileMap removeChild:powerLivesLayer];
        //powerLivesLayer = NULL;
        
       // playerDirection = 1;
        winScore = 188;
        //winScore = 10;
        totalLives = 2;
        //        totalLives = 1;
        lifeCount = 2;
        levelTimeLimit = 240;
        powerLiveTimeLimit = 45;
        
        for(CCTMXLayer *child in [_tileMap children])
        {
            [[child texture] setAliasTexParameters];
        }
        
        [self addChild: _tileMap];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus Score: %d", timeRemaining] fontName:@"Verdana-Bold" fontSize:21.0];
        label.color = ccc3(0,0,0);
        label.position = ccp(200 , 36);
        [self addChild: label];
        
        //player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        if(player1==true)
        {
            player = [CCSprite spriteWithFile:@"HyperPlayer_40x40.png"] ;
        }
        else{
            player = [CCSprite spriteWithFile:@"NormalPlayer_40x40.png"] ;
        }
        [self spawnPlayer];
        if(player == nil)
        {
            printf("this is an error");
        }
        [self addChild:player];
        /*monster1 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster1.position = ccp(winSize.width/3+35, winSize.height/2+90);
        [self addChild:monster1];
        monster2 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster2.position = ccp(winSize.width/3+35, winSize.height/2-65);
        [self addChild:monster2];
        monster3 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster3.position = ccp(winSize.width-45, winSize.height-50);
        [self addChild:monster3];
        
        monster4 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster4.position = ccp(75, 75);
        [self addChild:monster4];
         
        [self performSelectorInBackground:@selector(actionmonster1) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster2) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster3) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster4) withObject:self];*/
        
        // Standard method to pause the game
        CCMenuItem *starMenuItem = [CCMenuItemImage itemFromNormalImage:@"player_pause40x40.png" selectedImage:@"player_pause40x40.png" target:self selector:@selector(PauseResumeGame:)];
        
        //starMenuItem.position = ccp(870, 25);
        starMenuItem.position = ccp(22, 680);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];

        NSLog(@"booleans : %d and %d: ",powerup1Check,powerup2Check);
        if(powerup1Check==true)
        {
            NSLog(@"Powerup1 %d: ",powerup1Check);
            shopPowerUp1 = [CCMenuItemImage itemFromNormalImage:@"life.png" selectedImage:@"life.png" target:self selector:Nil];
            shopPowerUp1.position = ccp(22, 600-7*40);
            shopPowerUp1.visible = true;
            [self addChild:shopPowerUp1];
        }
        if(powerup2Check==true)
        {
            NSLog(@"Powerup2 %d: ",powerup1Check);
            shopPowerUp2 = [CCMenuItemImage itemFromNormalImage:@"powerup12.png" selectedImage:@"powerup12.png" target:self selector:Nil];
            shopPowerUp2.position = ccp(22, 600-9*40);
            shopPowerUp2.visible = true;
            [self addChild:shopPowerUp2];
        }
        
        for (int i=0; i<5; i++) {
            lifeItem[i] = [CCMenuItemImage itemFromNormalImage:@"life.png" selectedImage:@"life.png" target:self selector:Nil];
            lifeItem[i].position = ccp(22, 600-i*40);
            lifeItem[i].visible = true;
        }
        lifeItem[3].visible = false;
        lifeItem[4].visible = false;
        life = [CCMenu menuWithItems:lifeItem[0],lifeItem[1],lifeItem[2],lifeItem[3],lifeItem[4], nil];
        
        life.position = CGPointZero;
        [self addChild:life];
        
        
        myTime = 0;
        
        timeLabel = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:30];
        timeLabel.position = CGPointMake(winSize.width / 2+200, winSize.height);
        // Adjust the label's anchorPoint's y position to make it align with the top.
        timeLabel.anchorPoint = CGPointMake(0.5f, 1.0f);
        // Add the time label
        timeLabel.color=ccBLACK;
        [self addChild:timeLabel];
        
        //update
        
        timeLabelBlue = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:40];
        timeLabelBlue.position =ccp(200 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 46);
        // Adjust the label's anchorPoint's y position to make it align with the top.
        timeLabelBlue.anchorPoint = CGPointMake(0.5f, 1.0f);
        
        timeLabelBlue.color = ccBLACK;
        // Add the time label
        timeLabelBlue.visible = FALSE;
        /*collideTime = 0;
        
        PowerLabel = [CCSprite spriteWithFile:@"powerup12.png"];
        
        //PowerLabel.position = ccp(, winSize.height/2-65);
        PowerLabel.position =ccp(120 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 27);
        PowerLabel.visible = FALSE;
        [self addChild:PowerLabel];*/
        
        bubble = [CCSprite spriteWithFile:@"bubble4.png"];
        bubble.position = ccp(winSize.width - 420 , winSize.height - 380);
        [self addChild:bubble];
        bubble.visible = FALSE;
        
        bubble2 = [CCSprite spriteWithFile:@"bubble5.png"];
        bubble2.position = ccp(winSize.width/2 , winSize.height/2);
        [self addChild:bubble2];
        //bubble.visible = FALSE;
        
        [self schedule:@selector(removeBubble2) interval:3 repeat:1 delay:5];
        
        bubble3 = [CCSprite spriteWithFile:@"bubble6.png"];
        bubble3.position = ccp(winSize.width - 420 , winSize.height - 380);
        [self addChild:bubble3];
        bubble3.visible = FALSE;
        
        [self addChild:timeLabelBlue];
        
      [self schedule:@selector(LevelTimer:)];
        
    }
    return self;
    
}

int livePowerEnabled1 = 0;

-(void)LevelTimer:(ccTime)dt{
    totalTime += dt;
    currentTime = (int)totalTime;
    if (myTime < currentTime)
    {
        myTime = currentTime;
        [timeLabel setString:[NSString stringWithFormat:@"%02d:%02d", (levelTimeLimit - myTime)/60, (levelTimeLimit-myTime)%60]];
    }
    
    if (myTime == 15 && livePowerEnabled1 == 0) {
        livePowerEnabled1 = 1;
        //[self addChild:life];
        
        //powerLivesLayer = [_tileMap layerNamed:@"Power_lives"];
        //[_tileMap addChild:powerLivesLayer];
        powerLivesLayer.visible = TRUE;
    }
    if (myTime == 40) {
        CCBlink* blink1 = [CCBlink actionWithDuration:5 blinks:20];
        [powerLivesLayer runAction:blink1];
    }
    if (myTime == 45) {
        livePowerEnabled1 = 0;
        powerLivesLayer.visible = FALSE;
    }
    
    if(myTime==levelTimeLimit-30)
    {
        CCFadeTo *fadeIn = [CCFadeTo actionWithDuration:0.25 opacity:0];
        CCFadeTo *fadeOut = [CCFadeTo actionWithDuration:0.75 opacity:255];
        CCSequence *pulseSequence = [CCSequence actionOne:fadeIn two:fadeOut];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
        [timeLabel runAction:repeat];
        timeLabel.color=ccBLUE;
        
    }
    
    if (levelTimeLimit < myTime)
    {
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:_numCollected timeBonus:0];
        
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
    
}


-(void) spawnPlayer

{
    CCTMXObjectGroup *objectGroup = [_tileMap objectGroupNamed:@"Objects"];
    
    NSAssert(objectGroup != nil, @"tile map has no objects object layer");
    
    NSDictionary *spawnPoint = [objectGroup objectNamed:@"SpawnPoint"];
    
    int x_spawn = [spawnPoint[@"x"] integerValue];
    
    int y_spawn = [spawnPoint[@"y"] integerValue];
    
    
    
    CGPoint actualPos = [self tileCoordForPosition:ccp(x_spawn, y_spawn)];
    
    player.position = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
}

- (CGPoint)tileCoordForPosition:(CGPoint)position {
    int x = position.x / _tileMap.tileSize.width;
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / _tileMap.tileSize.height;
    return ccp(x, y);
}

- (void) PauseGame:(id)sender

{
    
    [[CCDirector sharedDirector] stopAnimation];
    
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    
    [[CCDirector sharedDirector] pause];
    
}

- (void) PauseResumeGame:(id) sender
{
    NSLog(@"helloo");
    [CCMenuItemFont setFontName:@"chalkduster"];
    
    [CCMenuItemFont setFontSize:50];
    
    
    CCMenuItemFont *resumeGame = [CCMenuItemFont itemFromString:@"Resume Game"
                                                         target:self
                                                       selector:@selector(ResumeGame:)];
    [resumeGame setColor:ccBLUE];
    CCMenuItemFont *restartGame = [CCMenuItemFont itemFromString:@"Restart"
                                                          target:self
                                                        selector:@selector(RestartGame:)];
    [restartGame setColor:ccBLUE];
    CCMenuItemFont *menuGame = [CCMenuItemFont itemFromString:@"Menu"
                                                       target:self
                                                     selector:@selector(MenuGame:)];
    [menuGame setColor:ccBLUE];
    
    pauseResumeMenu = [CCMenu menuWithItems: resumeGame,restartGame,menuGame, nil];
    pauseResumeMenu.position=ccp(500,300);
    [pauseResumeMenu alignItemsVerticallyWithPadding:15];
    [self addChild:pauseResumeMenu];
    
    [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(PauseGame:) userInfo:nil repeats:NO];
}


- (void)ResumeGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    [self removeChild:pauseResumeMenu];
    
}


- (void)RestartGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES]]];
}


- (void)MenuGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[LevelSelectLayer firstScene:YES]]];
    
}


-(void) removeBubble2
{
    bubble2.visible = FALSE;
}

-(void) removeBubble3
{
    bubble3.visible = FALSE;
}

@end
