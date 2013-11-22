
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
    
    if((CGRectIntersectsRect([monster9 boundingBox] , [playerB boundingBox]) || CGRectIntersectsRect([monster10 boundingBox], [playerB boundingBox]) || CGRectIntersectsRect([monster11 boundingBox], [playerB boundingBox])||CGRectIntersectsRect([monster12 boundingBox], [playerB boundingBox]))&& inBonusStage == YES )
        
    {
        self.visible = NO;
        self.isTouchEnabled = NO;
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
                    self.isTouchEnabled = NO;
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
    if (self.visible == YES && self.isTouchEnabled == YES) {
        inBonusStage = YES;
    }
}



-(id) initWithPlayer:(BOOL)player1
{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.isTouchEnabled = NO;
        touchEnabled = NO;
        //_tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"BonusMap.tmx"];
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"bonusMap_new.tmx"];
        Coins_layer = [_tileMap layerNamed:@"Coins"];
        border = [_tileMap layerNamed:@"Wall"];
        //building = [_tileMap layerNamed:@"Building"];
        playerDirection = 1;
        inBonusStage = NO;
        
        
        
        
        CCMenuItemFont *powerupLabel = [CCMenuItemFont itemFromString:@"Bonus Stage"];
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
        
        
        monster9 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster9.position = ccp(winSize.width/3+435, winSize.height/2-10);
        monster9.position = ccp(125, 75);
        [self addChild:monster9];
        
        monster10 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster10.position = ccp(winSize.width/3+185, winSize.height/2-10);
        monster10.position = ccp(125, 75);
        [self addChild:monster10];
        
        monster11 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster11.position = ccp(winSize.width-45, winSize.height-50);
        monster11.position = ccp(125, 75);
        [self addChild:monster11];
        
        monster12 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster12.position = ccp(125, 75);
        [self addChild:monster12];
        
        //ghost1 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        //ghost1.position = ccp(winSize.width-45,winSize.height/2);
        //[self addChild:ghost1];
        
        //[self performSelectorInBackground:@selector(actionmonster9) withObject:self];
        //[self performSelectorInBackground:@selector(actionmonster10) withObject:self];
        //[self performSelectorInBackground:@selector(actionmonster11) withObject:self];
        //[self performSelectorInBackground:@selector(actionmonster12) withObject:self];

    }
    return self;
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
    
    [monster9 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,nil]];
}

- (void) monster10move:(ccTime)dt
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
    
    [monster10 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate180,actionMove2,actionRotate270,actionMove3,nil]];
}

- (void) monster11move:(ccTime)dt
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
    
    [monster11 runAction:
     [CCSequence actions: actionRotate360,actionMove,actionRotate90,actionMove1,actionRotate360,actionMove2,actionRotate270,actionMove3,actionRotate180,actionMove4,actionRotate90,actionMove5,actionRotate180,actionMove6,actionRotate270,actionMove7,actionRotate360,nil]];
}

- (void) monster12move:(ccTime)dt
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
    
    [monster12 runAction:
     [CCSequence actions: actionRotate180,actionMove,actionRotate270,actionMove1,actionRotate360,actionMove2,actionRotate90,actionMove3,actionRotate360,actionMove4,actionRotate270,actionMove5,actionRotate360,actionMove6,actionRotate90,actionMove7,actionRotate180,nil]];
    
    
}
- (void) Monster5Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster9 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) monster10Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster9 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) monster12Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster12 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}

- (void) monster11Freeze
{
    
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster11 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) actionmonster9
{
    [self monster10Freeze];
    [self schedule:@selector(Monster5move: ) interval:1.5 repeat:250 delay:0];
}

- (void) actionmonster10
{
    
    [self schedule:@selector(monster10move: ) interval:1.15 repeat:250 delay:0 ];
}

- (void) actionmonster12
{
    [self monster12Freeze];
    [self schedule:@selector(monster12move: ) interval:6 repeat:250 delay:0 ];
}

- (void) actionmonster11
{
    [self monster11Freeze];
    [self schedule:@selector(monster11move: ) interval:13 repeat:250 delay:0 ];
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
    self.isTouchEnabled = YES;
}


@end
