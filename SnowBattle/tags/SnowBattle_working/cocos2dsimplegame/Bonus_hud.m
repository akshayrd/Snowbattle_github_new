
#import "Bonus_hud.h"
#import "SimpleAudioEngine.h"


@implementation Bonus_hud

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

CCSprite * Bonusmonster1;
CCSprite * Bonusmonster2;
CCSprite * Bonusmonster3;
CCSprite * Bonusmonster4;
CCSprite * Bonusmonster5;
CCSprite * Bonusmonster6;
CCSprite * Bonusmonster7;
CCSprite * Bonusmonster8;




- (void) Movemonster1:(ccTime)dt
{
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 375;
    int realY = 625;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 375;
    int realY1 = 225;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster1 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster2:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 525;
    int realY = 625;
    CGPoint realDest = ccp(realX, realY);
    

    int realX1 = 525;
    int realY1 = 225;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster2 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster3:(ccTime)dt
{
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 675;
    int realY = 625;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 675;
    int realY1 = 225;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster3 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster4:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 775;
    int realY = 225;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = 275;
    int realY1 = 225;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster4 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}


- (void) Movemonster5:(ccTime)dt
{
   // CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 775;
    int realY = 325;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 275;
    int realY1 = 325;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster5 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster6:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 775;
    int realY = 425;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 275;
    int realY1 = 425;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster6 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster7:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 775;
    int realY = 525;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 275;
    int realY1 = 525;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster7 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

- (void) Movemonster8:(ccTime)dt
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 775;
    int realY = 625;
    CGPoint realDest = ccp(realX, realY);
    
    
    int realX1 = 275;
    int realY1 = 625;
    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    
    float realMoveDuration = 2.5;
    
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    
    [Bonusmonster8 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event

{
    
    CGPoint touchLocation = [touch locationInView:touch.view];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    CGPoint playerPos = playerB.position;
    
    CGPoint diff = ccpSub(touchLocation, playerPos);
    
    if ( abs(diff.x) > abs(diff.y) ) {
        if (diff.x > 0) {
            playerPos.x += _tileMap.tileSize.width;
            //player.flipX = YES;
            if (playerDirection != 2) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 2;
                
            }
            
        } else {
            
            if (playerDirection != 4) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==2)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
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
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==3)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                playerDirection = 1;
                
            }
            
            playerPos.y += _tileMap.tileSize.height;
        } else {
            if (playerDirection != 3) {
                if ( playerDirection==1)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:180];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==2)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
                }
                if ( playerDirection==4)
                {
                    id actionRotate = [CCRotateBy actionWithDuration:1/10 angle:-90];
                    [playerB runAction: [CCSequence actions: actionRotate,nil]];
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
//CCSprite* PowerLabel;

CCSprite *monster9,*monster10, *monster11, *monster12;




- (void) checkCollisionWithMonsterBonus
{
    //NSLog(@"Time %d",myTime - collideTime );
    
    if((CGRectIntersectsRect([Bonusmonster1 boundingBox] , [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster2 boundingBox], [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster3 boundingBox], [playerB boundingBox])||CGRectIntersectsRect([Bonusmonster4 boundingBox], [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster5 boundingBox] , [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster6 boundingBox] , [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster7 boundingBox] , [playerB boundingBox]) || CGRectIntersectsRect([Bonusmonster8 boundingBox] , [playerB boundingBox]) )&& inBonusStage == YES )
        
    {
        self.visible = NO;
        self.touchEnabled = NO;
        NSLog(@"Touch to monster in Bonus Stage");
        inBonusStage = NO;
        [[CCDirector sharedDirector] resume];
        [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
        [[CCDirector sharedDirector] startAnimation];
    }
}


-(void)setPlayerPosition:(CGPoint)position {
    CGPoint tileCoord = [self tileCoordForPosition:position];
 
    
    tileCoord = [self tileCoordForPosition:position];
    int tileGid = [border tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                return;
            }
        }
    }
    tileGid = [Coins_layer tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collectible = properties[@"Collectable"];
            if (collectible && [collectible isEqualToString:@"True"]) {
                [Coins_layer removeTileAt:tileCoord];
                currentLevelScore++;
                //[hud numCollectedChanged:_numCollected];
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                if (currentLevelScore >= winScore) {
                    self.visible = NO;
                    self.touchEnabled = NO;
                    NSLog(@"Won Bonus Stage");
                    [[CCDirector sharedDirector] resume];
                    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
                    [[CCDirector sharedDirector] startAnimation];
                    
                }
            }
        }
    }
    
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    playerB.position = position;
}


+(Bonus_hud *) scene:(BOOL)playerImage1
{
    // 'scene' is an autorelease object.
    //CCScene *scene2 = [CCScene node];
    
    // 'layer' is an autorelease object.
    Bonus_hud *layer = [[Bonus_hud alloc] initWithPlayer:playerImage1];
    
    // add layer as a child to scene
    //[scene2 addChild: layer];
    
    
//    HudLayer *hud = [HudLayer node];
//    [scene2 addChild:hud];
//    layer->hud = hud;
    
    //return scene2;
    return layer;
}

- (void) checkBonusStage
{
    if (self.visible == YES && self.touchEnabled == YES) {
        inBonusStage = YES;
    }
}



-(id) initWithPlayer:(BOOL)player1
{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.touchEnabled = NO;
        touchEnabled = NO;
        //_tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"BonusMap.tmx"];
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"bonusMap_new.tmx"];
        Coins_layer = [_tileMap layerNamed:@"Coins"];
        border = [_tileMap layerNamed:@"Wall"];
        //building = [_tileMap layerNamed:@"Building"];
        playerDirection = 1;
        inBonusStage = NO;
        
        
        
        
        CCMenuItemFont *powerupLabel = [CCMenuItemFont itemWithString:@"Bonus Stage"];
        powerupLabel.color=ccWHITE;
        CCMenu *menu9 = [CCMenu menuWithItems: powerupLabel, nil];
        menu9.position=ccp(550,750);
        [menu9 alignItemsVerticallyWithPadding:15];
        
        
        _playerimage = player1;
        [self schedule:@selector(checkCollisionWithMonsterBonus)];
        
        playerB = [CCSprite spriteWithFile:@"NormalPlayer_40x40.png"];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        for(CCTMXLayer *child in [_tileMap children])
        {
            [[child texture] setAliasTexParameters];
        }

        _tileMap.visible = YES;
        [self addChild: _tileMap];
        
        [self addChild:menu9];

        playerB.visible = YES;
        [self addChild:playerB];

        [self spawnPlayer];
        winScore = 66;
        [self schedule:@selector(checkBonusStage) interval:1];
        
        
        Bonusmonster1 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster1.position = ccp(375, 225);
        [self addChild:Bonusmonster1];
        
        
        Bonusmonster2 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster2.position = ccp( 525, 225);
        [self addChild:Bonusmonster2];
        
        
        Bonusmonster3 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster3.position = ccp(675, 225);
        [self addChild:Bonusmonster3];
        
        
        Bonusmonster4 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster4.position = ccp(275, 225);
        [self addChild:Bonusmonster4    ];
        
        Bonusmonster5 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster5.position = ccp(275, 325);
        [self addChild:Bonusmonster5];
        
        
        Bonusmonster6 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster6.position = ccp(275, 425);
        [self addChild:Bonusmonster6];
        
        
        Bonusmonster7 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster7.position = ccp(275, 525);
        [self addChild:Bonusmonster7];
        
        
        Bonusmonster8 = [CCSprite spriteWithFile:@"ghosts.png"];
        Bonusmonster8.position = ccp(275, 625);
        [self addChild:Bonusmonster8    ];
        
        [self schedule:@selector(Movemonster1:) interval:5 repeat:250 delay:0.3];
        [self schedule:@selector(Movemonster2:) interval:5 repeat:250 delay:0.2];
        [self schedule:@selector(Movemonster3:) interval:5 repeat:250 delay:0.4];
        [self schedule:@selector(Movemonster4:) interval:5 repeat:250 delay:0.2];
        [self schedule:@selector(Movemonster5:) interval:5 repeat:250 delay:0.1];
        [self schedule:@selector(Movemonster6:) interval:5 repeat:250 delay:0.3];
        [self schedule:@selector(Movemonster7:) interval:5 repeat:250 delay:0.4];
        [self schedule:@selector(Movemonster8:) interval:5 repeat:250 delay:0.5];
        
    
    }
    return self;
}


-(void) spawnPlayer
{
    CCTMXObjectGroup *objectGroup = [_tileMap objectGroupNamed:@"Objects"];
    
    NSAssert(objectGroup != nil, @"tile map has no objects object layer");
    
    NSDictionary *spawnPoint = [objectGroup objectNamed:@"SpawnPoint"];
    int x_spawn = [spawnPoint[@"x"] integerValue];
    int y_spawn = [spawnPoint[@"y"] integerValue];
    
    CGPoint actualPos = [self tileCoordForPosition:ccp(x_spawn, y_spawn)];
    
    playerB.position = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
}
- (CGPoint)tileCoordForPosition:(CGPoint)position {
    int x = position.x / _tileMap.tileSize.width;
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / _tileMap.tileSize.height;
    return ccp(x, y);
}

-(void) setTouch
{
    self.touchEnabled = YES;
}


@end
