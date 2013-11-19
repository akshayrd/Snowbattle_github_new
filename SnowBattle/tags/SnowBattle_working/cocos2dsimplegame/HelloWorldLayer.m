#import "HelloWorldLayer.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "GameOverLayer.h"
#import "GameStartLayer.h"
#import "LevelSelectLayer.h"




@interface HelloWorldLayer ()
@property (assign) int numCollected;

@end

#pragma mark - HelloWorldLayer
// HelloWorldLayer implementation
@implementation HelloWorldLayer
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene:(BOOL)playerImage1
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    //HelloWorldLayer *layer = [HelloWorldLayer node];
    HelloWorldLayer *layer = [[HelloWorldLayer alloc] initWithPlayer:playerImage1];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    HudLayer *hud = [HudLayer node];
    [scene addChild:hud];
    layer->hud = hud;
    
    return scene;
    
}

-(void)newLocalScore {
    [self PauseGame];
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"Online Access"];
    [dialog setMessage:@"Do you want to connect to the online ranking?"];
    [dialog addButtonWithTitle:@"Ok"];
    [dialog show];
    [dialog release];
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0) {
        [self ResumeGame];
    }
}

- (void) Monster1move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/3+35+260;
    int realY = winSize.height/2+90;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = winSize.width/3+35+260;
    int realY1 = winSize.height/2+90+50;
    
    int realX2 = winSize.width/3+35;
    int realY2 = winSize.height/2+90+50;
    
    int realX3 = winSize.width/3+35;
    int realY3 = winSize.height/2+90;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    float realMoveDuration = 1;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest3];
    
    [monster1 runAction:
     [CCSequence actions: actionRotate90,actionMove,actionRotate360,actionMove1,actionRotate270,actionMove2,actionRotate180,actionMove3,nil]];
}

- (void) Monster2move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/3+35+260;
    int realY = winSize.height/2-65;
    CGPoint realDest = ccp(realX, realY);
    int realX1 = winSize.width/3+35+260;
    int realY1 = winSize.height/2-65-50;
    
    int realX2 = winSize.width/3+35;
    int realY2 = winSize.height/2-65-50;
    
    int realX3 = winSize.width/3+35;
    int realY3 = winSize.height/2-65;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    float realMoveDuration = 1;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest3];
    
    [monster2 runAction:
     [CCSequence actions: actionRotate90,actionMove,actionRotate180,actionMove1,actionRotate270,actionMove2,actionRotate360,actionMove3,nil]];
}

- (void) Monster4move:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 75;
    int realY = winSize.height-50;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = winSize.width/2-85;
    int realY1 = winSize.height-50;
    
    int realX2 = winSize.width/2-85;
    int realY2 = winSize.height-95;
    
    int realX3 = 125;
    int realY3 = winSize.height-95;
    
    int realX4 = 125;
    int realY4 = winSize.height-95-150;
    
    int realX5 = 225;
    int realY5 = winSize.height-95-150;
    
    int realX6 = 225;
    int realY6 = winSize.height-95-200;
    
    int realX7 = 125;
    int realY7 = winSize.height-95-200;
    
    int realX8 = 125;
    int realY8 = winSize.height-95-350;
    
    int realX9 = 225;
    int realY9 = winSize.height-95-350;
    
    int realX10 = 225;
    int realY10 = winSize.height-95-400;
    
    int realX11 = 125;
    int realY11 = winSize.height-95-400;
    
    int realX12 = 125;
    int realY12 = 75;
    
    int realX13 = 75;
    int realY13 = 75;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    CGPoint realDest4 = ccp(realX4, realY4);
    CGPoint realDest5 = ccp(realX5, realY5);
    CGPoint realDest6 = ccp(realX6, realY6);
    CGPoint realDest7 = ccp(realX7, realY7);
    CGPoint realDest8 = ccp(realX8, realY8);
    CGPoint realDest9 = ccp(realX9, realY9);
    CGPoint realDest10 = ccp(realX10, realY10);
    CGPoint realDest11 = ccp(realX11, realY11);
    CGPoint realDest12 = ccp(realX12, realY12);
    CGPoint realDest13 = ccp(realX13, realY13);
    float realMoveDuration = 2;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration*2 position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration/1.5 position:realDest3];
    id actionMove4 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest4];
    id actionMove5 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest5];
    id actionMove6 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest6];
    id actionMove7 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest7];
    id actionMove8 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest8];
    id actionMove9 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest9];
    id actionMove10 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest10];
    id actionMove11 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest11];
    id actionMove12 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest12];
    id actionMove13 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest13];
    [monster4 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,actionRotate180,actionMove4,actionRotate90,actionMove5,actionRotate180,actionMove6,actionRotate270,actionMove7,actionRotate180,actionMove8,actionRotate90,actionMove9,actionRotate180,actionMove10,actionRotate270,actionMove11,actionRotate180,actionMove12,actionRotate270,actionMove13,nil]];
}

- (void) Monster3move:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width-45;
    int realY = 75;
    CGPoint realDest = ccp(realX, realY);
    int realX1 = winSize.width/2+65;
    int realY1 = 75;
    int realX2 = winSize.width/2+65;
    int realY2 = 125;
    int realX3 = winSize.width-145;
    int realY3 = 125;
    int realX4 = winSize.width-145;
    int realY4 = 275;
    int realX5 = winSize.width-145-100;
    int realY5 = 275;
    int realX6 = winSize.width-145-100;
    int realY6 = 325;
    int realX7 = winSize.width-150;
    int realY7 = 325;
    int realX8 = winSize.width-150;
    int realY8 = 475;
    int realX9 = winSize.width-150-100;
    int realY9 = 475;
    int realX10 = winSize.width-150-100;
    int realY10 = 525;
    int realX11 = winSize.width-150;
    int realY11 = 525;
    int realX12 = winSize.width-150;
    int realY12 = winSize.height-50;
    int realX13 = winSize.width-45;
    int realY13 = winSize.height-50;
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    CGPoint realDest4 = ccp(realX4, realY4);
    CGPoint realDest5 = ccp(realX5, realY5);
    CGPoint realDest6 = ccp(realX6, realY6);
    CGPoint realDest7 = ccp(realX7, realY7);
    CGPoint realDest8 = ccp(realX8, realY8);
    CGPoint realDest9 = ccp(realX9, realY9);
    CGPoint realDest10 = ccp(realX10, realY10);
    CGPoint realDest11 = ccp(realX11, realY11);
    CGPoint realDest12 = ccp(realX12, realY12);
    CGPoint realDest13 = ccp(realX13, realY13);
    
    float realMoveDuration = 2;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration*2 position:realDest];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration/1.5 position:realDest3];
    id actionMove4 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest4];
    id actionMove5 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest5];
    id actionMove6 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest6];
    id actionMove7 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest7];
    id actionMove8 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest8];
    id actionMove9 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest9];
    id actionMove10 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest10];
    id actionMove11 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest11];
    id actionMove12 = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest12];
    id actionMove13 = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest13];
    [monster3 runAction:
     [CCSequence actions: actionRotate180,actionMove,actionRotate270,actionMove1,actionRotate360,actionMove2,actionRotate90,actionMove3,actionRotate360,actionMove4,actionRotate270,actionMove5,actionRotate360,actionMove6,actionRotate90,actionMove7,actionRotate360,actionMove8,actionRotate270,actionMove9,actionRotate360,actionMove10,actionRotate90,actionMove11,actionRotate360,actionMove12,actionRotate90,actionMove13,nil]];
    
    //[monster3 runAction:
    
    //[CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,actionRotate180,actionMove4,actionRotate90,actionMove5,actionRotate180,actionMove6,actionRotate270,actionMove7,actionRotate180,actionMove8,actionRotate90,actionMove9,actionRotate180,actionMove10,actionRotate270,actionMove11,actionRotate180,actionMove12,actionRotate270,actionMove13,nil]];
    
}
- (void) Monster1Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster1 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) Monster2Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster2 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) Monster3Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster3 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) Monster4Freeze
{
    
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster4 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) actionmonster1
{
    
    [self Monster1Freeze];
    [self schedule:@selector(Monster1move: ) interval:3 repeat:250 delay:0];
}

- (void) actionmonster2
{
    [self Monster2Freeze];
    [self schedule:@selector(Monster2move: ) interval:3 repeat:250 delay:0 ];
}

- (void) actionmonster3
{
    [self Monster3Freeze];
    [self schedule:@selector(Monster3move: ) interval:16.15 repeat:250 delay:0 ];
}

- (void) actionmonster4
{
    [self Monster4Freeze];
    [self schedule:@selector(Monster4move: ) interval:16 repeat:250 delay:0 ];
}

CCSprite *monster1;
CCSprite *monster2;
CCSprite *monster3;
CCSprite *monster4;

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


int playerDirection = 1;



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
                                                          withscoreValue:_numCollected timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
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
    if (tileGid && livePowerEnabled == 1) {
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
                if(darkBlueCount == 12)
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
                    
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES withscoreValue:_numCollected timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
                    
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                    
                }
                
            }
            
        }
        
    }
    
    
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    
    player.position = position;
}

-(void) MakeBubbleInvisible
{
    bubble.visible = FALSE;
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



- (void) PauseGame
{
    
    [[CCDirector sharedDirector] stopAnimation];
    
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    
    [[CCDirector sharedDirector] pause];
    self.isTouchEnabled = NO;
    
}


- (void) PauseResumeGame:(id) sender
{
    NSLog(@"helloo");
    [CCMenuItemFont setFontName:@"chalkduster"];
    
    [CCMenuItemFont setFontSize:50];
    
    CCMenuItemFont *resumeGame = [CCMenuItemFont itemFromString:@"Resume"
                                                         target:self
                                                       selector:@selector(ResumeGame)];
    [resumeGame setColor:ccBLUE];
    CCMenuItemFont *restartGame = [CCMenuItemFont itemFromString:@"Restart Level"
                                                          target:self
                                                        selector:@selector(RestartGame)];
    [restartGame setColor:ccBLUE];
    CCMenuItemFont *menuGame = [CCMenuItemFont itemFromString:@"Select Level"
                                                       target:self
                                                     selector:@selector(MenuGame:)];
    [menuGame setColor:ccBLUE];
    
    pauseResumeMenu = [CCMenu menuWithItems: resumeGame,restartGame,menuGame, nil];
    pauseResumeMenu.position=ccp(500,300);
    [pauseResumeMenu alignItemsVerticallyWithPadding:15];
    [self addChild:pauseResumeMenu];

    //[self PauseGame:self];
    
    
    [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(PauseGame) userInfo:nil repeats:NO];
}


- (void)ResumeGame
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    [self removeChild:pauseResumeMenu];
    self.isTouchEnabled = YES;
    
}


- (void)RestartGame
{
    [[CCDirector sharedDirector] stopAnimation];
    
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES]]];
    
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer scene:NO]]];
    //[[CCDirector sharedDirector]
//replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:player1Select timeBonus:0 powerup1:false powerup2:false]]];
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

// on "init" you need to initialize your instance
-(id) initWithPlayer:(BOOL)player1

{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.isTouchEnabled = YES;
        _playerimage = player1;
        count = 90;
        darkBlueCount = 0;
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"funk.mp3"];
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"tileMap2.tmx"];
        snow = [_tileMap layerNamed:@"Snow"];
        border = [_tileMap layerNamed:@"Border"];
        street  = [_tileMap layerNamed:@"Street"];
        building = [_tileMap layerNamed:@"Building"];
        darkBlue = [_tileMap layerNamed:@"DarkBlueTiles"];
        powerBlueLayer = [_tileMap layerNamed:@"power_blue"];
        powerLivesLayer = [_tileMap layerNamed:@"Power_lives"];
        powerLivesLayer.visible = FALSE;
        //[_tileMap removeChild:powerLivesLayer];
        //powerLivesLayer = NULL;
        
        playerDirection = 1;
        //winScore = 188;
        winScore = 20;
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
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        //player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 1)
        {
            player = [CCSprite spriteWithFile:@"HyperPlayer_40x40.png"];
        }
        else if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 2){
            player = [CCSprite spriteWithFile:@"NormalPlayer_40x40.png"];
        }
        else if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 3)
        {
            player = [CCSprite spriteWithFile:@"NormalPlayer_40x40.png"];
        }
        [self spawnPlayer];
        if(player == nil)
        {
            printf("this is an error");
        }
        [self addChild:player];
        
        /* Ghost Immune PowerUp */
        if(([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp2"] >=1))
        {
            //NSLog(@"Powerup1 %d: ",powerup1Check);
            shopPowerUp2 = [CCMenuItemImage itemFromNormalImage:@"powerUp_immuneGhost.png" selectedImage:@"powerUp_immuneGhost.png" target:self selector:Nil];
            shopPowerUp2.position = ccp(22, 600-9*40);
            shopPowerUp2.visible = true;
            [self addChild:shopPowerUp2];
        }
        /* Ghost Pit Close PowerUp */
        if(([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp3"] >=1))
        {
            shopPowerUp3 = [CCMenuItemImage itemFromNormalImage:@"powerUp_ghostPitClose.png" selectedImage:@"powerUp_ghostPitClose.png" target:self selector:Nil];
            shopPowerUp3.position = ccp(22, 600-10*40);
            shopPowerUp3.visible = true;
            [self addChild:shopPowerUp3];
        }
        
        monster1 = [CCSprite spriteWithFile:@"bug_51x51.png"];
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
        [self performSelectorInBackground:@selector(actionmonster4) withObject:self];
        
        // Standard method to pause the game
        CCMenuItem *starMenuItem = [CCMenuItemImage itemFromNormalImage:@"player_pause40x40.png" selectedImage:@"player_pause40x40.png" target:self selector:@selector(PauseResumeGame:)];
        
        //starMenuItem.position = ccp(870, 25);
        starMenuItem.position = ccp(22, 680);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        for (int i=0; i<5; i++) {
            lifeItem[i] = [CCMenuItemImage itemFromNormalImage:@"life.png" selectedImage:@"life.png" target:self selector:Nil];
            lifeItem[i].position = ccp(22, 600-i*40);
            lifeItem[i].visible = true;
        }
        lifeItem[3].visible = false;
        lifeItem[4].visible = false;
        /* Life Power Up */
        if(([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp1"] >=1))
        {
            lifeItem[3].visible = true;
            lifeCount++;
        }
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
        collideTime = 0;
        
        PowerLabel = [CCSprite spriteWithFile:@"powerup12.png"];
        
        
        PowerLabel.position =ccp(120 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 27);
        PowerLabel.visible = FALSE;
        [self addChild:PowerLabel];
        
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
        [self schedule:@selector(BluePowerupTimer:)];
        
    }
    return self;
    
}

-(void) removeBubble2
{
    bubble2.visible = FALSE;
}

-(void) removeBubble3
{
    bubble3.visible = FALSE;
}

CCSprite* PowerLabel;


-(void)BluePowerupTimer:(ccTime)dt{
    
    if (powerBlue == 1) {
        
        
        PowerLabel.visible =  TRUE;
        timeLabelBlue.visible = TRUE ;
        totalTimePowerBlue += dt;
        currentTimeBlue = (int)totalTimePowerBlue;
        if (myTimeBlue < currentTimeBlue)
        {
            myTimeBlue = currentTimeBlue;
            
            [timeLabelBlue setString:[NSString stringWithFormat:@" %02d:%02d", (powerLiveTimeLimit - myTimeBlue)/60, (powerLiveTimeLimit-myTimeBlue)%60]];
            
        }
        if(myTimeBlue==powerLiveTimeLimit-10)
        {
            //CCBlink* blink2 = [CCBlink actionWithDuration:5 blinks:20];
            
            //[self setOpacity:1.0];
            CCFadeTo *fadeIn = [CCFadeTo actionWithDuration:0.25 opacity:0];
            CCFadeTo *fadeOut = [CCFadeTo actionWithDuration:0.75 opacity:255];
            
            CCSequence *pulseSequence = [CCSequence actionOne:fadeIn two:fadeOut];
            CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
            [timeLabelBlue runAction:repeat];
            timeLabelBlue.color=ccBLUE;
            
        }
        if ( myTimeBlue > powerLiveTimeLimit && darkBlueCount < 12)
        {
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:_numCollected timeBonus:0 playerImage:_playerimage];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
    }
    
 }
int livePowerEnabled = 0;

-(void)LevelTimer:(ccTime)dt{
    totalTime += dt;
    currentTime = (int)totalTime;
    if (myTime < currentTime)
    {
        myTime = currentTime;
        [timeLabel setString:[NSString stringWithFormat:@"%02d:%02d", (levelTimeLimit - myTime)/60, (levelTimeLimit-myTime)%60]];
    }
    
    if (myTime == 15 && livePowerEnabled == 0) {
        livePowerEnabled = 1;
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
        livePowerEnabled = 0;
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
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:_numCollected timeBonus:0 playerImage:_playerimage];
        
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
    }
    
}
int collideTime =0;
int immuneDuration = 2;
- (void) checkCollisionWithMonster
{
    //NSLog(@"Time %d",myTime - collideTime );
    
    if((CGRectIntersectsRect([monster1 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster2 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster3 boundingBox], [player boundingBox])||CGRectIntersectsRect([monster4 boundingBox], [player boundingBox])) && totalTime - collideTime >= immuneDuration)
        
    {
        collideTime = totalTime;
        CCBlink* blink = [CCBlink actionWithDuration:immuneDuration blinks:20];
        lifeItem[lifeCount].visible = false;
        
        lifeCount--;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];

        count = 0;
        if (lifeCount < 0) {
            
            lifeCount = 2;
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:_numCollected timeBonus:0 playerImage:_playerimage];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        [player runAction:blink];
        //[self spawnPlayer];
        //return;
    }
    else if (count < 90)
        count++;
    
}
// on "dealloc" you need to release all your retained objects

- (void) dealloc
{
    // in case you have something to dealloc, do it in this method
    // in this particular example nothing needs to be released.
    // cocos2d will automatically release all the children (Label)
    // don't forget to call "super dealloc"
    [super dealloc];
}

- (CGPoint)tileCoordForPosition:(CGPoint)position {
    int x = position.x / _tileMap.tileSize.width;
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / _tileMap.tileSize.height;
    return ccp(x, y);
}
@end
