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

@implementation HelloWorldLayer_Level2

+(CCScene *) scene2:(BOOL)start timeBonus:(int) timeRemaining powerup1:(Boolean)powerup1Check powerup2:(Boolean)powerup2Check{
    // 'scene' is an autorelease object.
    CCScene *scene2 = [CCScene node];
    
    // 'layer' is an autorelease object.
    HelloWorldLayer_Level2 *layer = [[HelloWorldLayer_Level2 alloc] initWithPlayer:start timeBonus:timeRemaining powerup1:powerup1Check powerup2:powerup2Check];
    
    // add layer as a child to scene
    [scene2 addChild: layer];
    
    
    HudLayer *hud = [HudLayer node];
    [scene2 addChild:hud];
    layer->hud = hud;
    
    return scene2;
    
}


- (void) Monster5move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/3+435;
    int realY = winSize.height/2+40;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = winSize.width/3+635;
    int realY1 = winSize.height/2+40;
    
    int realX2 = winSize.width/3+635;
    int realY2 = winSize.height/2-10;
    
    int realX3 = winSize.width/3+435;
    int realY3 = winSize.height/2-10;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    float realMoveDuration = 0.5;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest3];
    
    [monster5 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,nil]];
}

- (void) Monster6move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/3+185;
    int realY = winSize.height/2+90;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = winSize.width/3+285;
    int realY1 = winSize.height/2+90;
    
    int realX2 = winSize.width/3+285;
    int realY2 = winSize.height/2-10;
    
    int realX3 = winSize.width/3+185;
    int realY3 = winSize.height/2-10;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    float realMoveDuration = 0.25;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest3];
    
    [monster6 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,nil]];
}

- (void) Monster8move:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 125;
    int realY = winSize.height/2-5;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = winSize.width/2-40;
    int realY1 = winSize.height/2-5;
    
    int realX2 = winSize.width/2-40;
    int realY2 = winSize.height-50;
    
    int realX3 = 125;
    int realY3 = winSize.height-50;
    
    int realX4 = 125;
    int realY4 = winSize.height/2+50;
    
    int realX5 = winSize.width/2-40;
    int realY5 = winSize.height/2+50;
    
    int realX6 = winSize.width/2-40;
    int realY6 = 75;
    
    int realX7 = 125;
    int realY7 = 75;
    
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    CGPoint realDest4 = ccp(realX4, realY4);
    CGPoint realDest5 = ccp(realX5, realY5);
    CGPoint realDest6 = ccp(realX6, realY6);
    CGPoint realDest7 = ccp(realX7, realY7);
    float realMoveDuration = 1.5;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest3];
    id actionMove4 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest4];
    id actionMove5 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest5];
    id actionMove6 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest6];
    id actionMove7 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest7];
    
    [monster8 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate360,actionMove2,actionRotate270,actionMove3,actionRotate180,actionMove4,actionRotate90,actionMove5,actionRotate180,actionMove6,actionRotate270,actionMove7,actionRotate360,nil]];
}

- (void) Monster7move:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width-45;
    int realY = 75;
    CGPoint realDest = ccp(realX, realY);
    int realX1 = winSize.width-200;
    int realY1 = 75;
    int realX2 = winSize.width-200;
    int realY2 = 125;
    int realX3 = winSize.width-95;
    int realY3 = 125;
    int realX4 = winSize.width-95;
    int realY4 = winSize.height-90;
    
    int realX5 = winSize.width-200;
    int realY5 = winSize.height-90;
    
    int realX6 = winSize.width-200;
    int realY6 = winSize.height-50;
    
    int realX7 = winSize.width-45;
    int realY7 = winSize.height-50;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    CGPoint realDest4 = ccp(realX4, realY4);
    CGPoint realDest5 = ccp(realX5, realY5);
    CGPoint realDest6 = ccp(realX6, realY6);
    CGPoint realDest7 = ccp(realX7, realY7);
    
    float realMoveDuration = 1.5;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration/4 position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration/6 position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration/6 position:realDest3];
    id actionMove4 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest4];
    id actionMove5 = [CCMoveTo actionWithDuration:realMoveDuration/6 position:realDest5];
    id actionMove6 = [CCMoveTo actionWithDuration:realMoveDuration/6 position:realDest6];
    id actionMove7 = [CCMoveTo actionWithDuration:realMoveDuration/4 position:realDest7];
    
    [monster7 runAction:
     [CCSequence actions: actionRotate180,actionMove,actionRotate270,actionMove1,actionRotate360,actionMove2,actionRotate90,actionMove3,actionRotate360,actionMove4,actionRotate270,actionMove5,actionRotate360,actionMove6,actionRotate90,actionMove7,actionRotate180,nil]];
    
    
}
- (void) Monster5Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster5 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) Monster6Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster5 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) Monster7Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster7 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) Monster8Freeze
{
    
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster8 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) actionmonster5
{
    [self Monster6Freeze];
    [self schedule:@selector(Monster5move: ) interval:1.5 repeat:250 delay:0];
}

- (void) actionmonster6
{
    
    [self schedule:@selector(Monster6move: ) interval:1.15 repeat:250 delay:0 ];
}

- (void) actionmonster7
{
    [self Monster7Freeze];
    [self schedule:@selector(Monster7move: ) interval:6 repeat:250 delay:0 ];
}

- (void) actionmonster8
{
    [self Monster8Freeze];
    [self schedule:@selector(Monster8move: ) interval:13 repeat:250 delay:0 ];
}

CCSprite *monster5;
CCSprite *monster6;
CCSprite *monster7;
CCSprite *monster8;

#pragma mark - handle touches

-(void)registerWithTouchDispatcher
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                              priority:0
                                                       swallowsTouches:YES];
}
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event

{
    
    CGPoint touchLocation = [touch locationInView:touch.view];
    
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    CGPoint playerPos = player.position;
    
    CGPoint diff = ccpSub(touchLocation, playerPos);
    
    if ( abs(diff.x) > abs(diff.y) ) {
        if (diff.x > 0) {
            playerPos.x += _tileMap.tileSize.width;
            //player.flipX = YES;
            if (playerDirection != 2) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 2;
                
            }
            
        } else {
            
            if (playerDirection != 4) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==2)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 4;
                
            }
            
            playerPos.x -= _tileMap.tileSize.width;
        }
        
    } else {
        if (diff.y > 0) {
            if (playerDirection != 1) {
                if ( playerDirection==2)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 1;
                
            }
            
            playerPos.y += _tileMap.tileSize.height;
        } else {
            if (playerDirection != 3) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==2)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [player runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 3;
            }
            playerPos.y -= _tileMap.tileSize.height;
        }
    }
    
    // safety check on the bounds of the map
    if (playerPos.x <= (_tileMap.mapSize.width * _tileMap.tileSize.width) &&
        playerPos.y <= (_tileMap.mapSize.height * _tileMap.tileSize.height) &&
        playerPos.y >= 0 &&
        playerPos.x >= 0 )
    {
        [self setPlayerPosition:playerPos];
        
        
    }
    //[self setViewPointCenter:player.position];
}

//int livePowerEnabled = 0;
CCSprite* PowerLabel;

-(void)setPlayerPosition:(CGPoint)position {
    CGPoint tileCoord = [self tileCoordForPosition:position];
    int tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                return;
            }
            
        }
        
    }
    
    tileCoord = [self tileCoordForPosition:position];
    tileGid = [border tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                return;
            }
        }
    }
    tileGid = [snow tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collectible = properties[@"Collectable"];
            if (collectible && [collectible isEqualToString:@"True"]) {
                [snow removeTileAt:tileCoord];
                _numCollected++;
                [hud numCollectedChanged:_numCollected];
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                if (_numCollected > winScore) {
                    
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES
                                                          withscoreValue:_numCollected timeBonus:levelTimeLimit-myTime];
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                    
                }
            }
        }
    }
    
    tileGid = [powerBlueLayer tileGIDAt:tileCoord];
    if (tileGid) {
        
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Power_blue"];
            if (collision && [collision isEqualToString:@"True"]) {
                [powerBlueLayer removeTileAt:tileCoord];
                powerBlue = 1;
                [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
                [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"HyperPlayer_40x40.png"]];
                bubble.visible = TRUE;
                
                [self schedule:@selector(MakeBubbleInvisible ) interval:3 repeat:1 delay:7];
                //[self newLocalScore];
            }
        }
    }
    
    tileGid = [powerLivesLayer tileGIDAt:tileCoord];
    if (tileGid && livePowerEnabled1 == 1) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"lives"];
            if (collision && [collision isEqualToString:@"True"]) {
                [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
                [powerLivesLayer removeTileAt:tileCoord];
                if (lifeCount<4)
                    lifeCount++;
                lifeItem[lifeCount].visible = true;
                
            }
        }
    }
    
    tileGid = [darkBlue tileGIDAt:tileCoord];
    
    if (tileGid) {
        
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        
        if (properties) {
            
            NSString *collectible = properties[@"collectible2x"];
            
            if(powerBlue!=1)
            {
                bubble3.visible=TRUE;
                [self schedule:@selector(removeBubble3) interval:3 repeat:1 delay:5];
            }
            
            if (collectible && [collectible isEqualToString:@"True"] && powerBlue == 1) {
                
                [darkBlue removeTileAt:tileCoord];
                
                _numCollected++;
                darkBlueCount++;
                if(darkBlueCount == 42)
                {
                    //[player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"FinalTwo_51x51x.png"]];
                    [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"NormalPlayer_40x40.png"]];
                    powerBlue = 0;
                    PowerLabel.visible=FALSE;
                    timeLabelBlue.visible=FALSE;
                    //[self removeChild: PowerLabel];
                    //[self removeChild:timeLabelBlue];
                    
                }
                
                [hud numCollectedChanged:_numCollected];
                
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                if (_numCollected > winScore) {
                    
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES withscoreValue:_numCollected timeBonus:levelTimeLimit-myTime];
                    
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                    
                }
                
            }
            
        }
        
    }
    
    
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    
    player.position = position;
}


- (void) checkCollisionWithMonster
{
    //NSLog(@"Time %d",myTime - collideTime );
    
    if((CGRectIntersectsRect([monster5 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster6 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster7 boundingBox], [player boundingBox])||CGRectIntersectsRect([monster8 boundingBox], [player boundingBox])) && totalTime - collideTime >= immuneDuration)
        
    {
        collideTime = totalTime;
        CCBlink* blink = [CCBlink actionWithDuration:immuneDuration blinks:20];
        lifeItem[lifeCount].visible = false;
        
        lifeCount--;
        count = 0;
        if (lifeCount < 0) {
            
            lifeCount = 2;
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:_numCollected timeBonus:0];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        [player runAction:blink];
        //[self spawnPlayer];
        //return;
    }
    else if (count < 90)
        count++;
    
}





// on "init" you need to initialize your instance

-(id) initWithPlayer:(BOOL)player1 timeBonus:(int) timeRemaining powerup1:(Boolean)powerup1Check powerup2:(Boolean)powerup2Check

{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.isTouchEnabled = YES;
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
        
        playerDirection = 1;
        
        //[_tileMap removeChild:powerLivesLayer];
        //powerLivesLayer = NULL;
        
        //playerDirection = 1;
        winScore = 197;
        //winScore = 10;
        totalLives = 2;
        //        totalLives = 1;
        lifeCount = 2;
        levelTimeLimit = 240;
        powerLiveTimeLimit = 45;
        collideTime =0;
        immuneDuration = 2;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];  // Request the current window size
        
        emitter = [CCParticleFire  node]; // initialize the particle system to be a fire system
        
        emitter.texture = [[CCTextureCache sharedTextureCache] addImage:@"fire_particle.png"]; //Set the texture to use our fire_particle.png
        
        emitter.position = ccp (winSize.width/2, winSize.height/3);
        
        [self addChild:emitter];
        
        
        for(CCTMXLayer *child in [_tileMap children])
        {
            [[child texture] setAliasTexParameters];
        }
        
        [self addChild: _tileMap];
        
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
        
        
        monster5 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster5.position = ccp(winSize.width/3+435, winSize.height/2-10);
        [self addChild:monster5];
        
        monster6 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster6.position = ccp(winSize.width/3+185, winSize.height/2-10);
        [self addChild:monster6];
        
        monster7 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster7.position = ccp(winSize.width-45, winSize.height-50);
        [self addChild:monster7];
        
        monster8 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster8.position = ccp(125, 75);
        [self addChild:monster8];
        
        [self performSelectorInBackground:@selector(actionmonster5) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster6) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster7) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster8) withObject:self];

        
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
        
        [self schedule:@selector(checkCollisionWithMonster)];
        
        
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
        /*collideTime = 0;*/
        
        PowerLabel = [CCSprite spriteWithFile:@"powerup12.png"];
        
        PowerLabel.position =ccp(120 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 27);
        PowerLabel.visible = FALSE;
        [self addChild:PowerLabel];
        
        bubble = [CCSprite spriteWithFile:@"bubble4.png"];
        bubble.position = ccp(winSize.width - 420 , winSize.height - 340);
        [self addChild:bubble];
        bubble.visible = FALSE;
        
        bubble2 = [CCSprite spriteWithFile:@"bubble5.png"];
        bubble2.position = ccp(winSize.width/2 , winSize.height/2);
        [self addChild:bubble2];
        //bubble.visible = FALSE;
        
        [self schedule:@selector(removeBubble2) interval:3 repeat:1 delay:5];
        
        bubble3 = [CCSprite spriteWithFile:@"bubble6.png"];
        bubble3.position = ccp(winSize.width - 600 , winSize.height - 180);
        [self addChild:bubble3];
        bubble3.visible = FALSE;
        
        [self addChild:timeLabelBlue];
        
      [self schedule:@selector(LevelTimer:)];
        
    }
    return self;
    
}
-(void) MakeBubbleInvisible
{
    bubble.visible = FALSE;
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
    
    
    CCMenuItemFont *resumeGame = [CCMenuItemFont itemFromString:@"Resume"
                                                         target:self
                                                       selector:@selector(ResumeGame:)];
    [resumeGame setColor:ccBLUE];
    CCMenuItemFont *restartGame = [CCMenuItemFont itemFromString:@"Restart Level"
                                                          target:self
                                                        selector:@selector(RestartGame:)];
    [restartGame setColor:ccBLUE];
    CCMenuItemFont *menuGame = [CCMenuItemFont itemFromString:@"Select Level"
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
    
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES]]];
    [[CCDirector sharedDirector]
    replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:NO timeBonus:0 powerup1:false powerup2:false]]];
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
