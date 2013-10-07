#import "HelloWorldLayer.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "GameOverLayer.h"

@implementation HudLayer
{
    CCLabelTTF *_label;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        _label = [CCLabelTTF labelWithString:@"Score : 0" fontName:@"Verdana-Bold" fontSize:18.0];
        _label.color = ccc3(0,0,0);
        int margin = 10;
        _label.position = ccp(winSize.width - (_label.contentSize.width/2) - 30, _label.contentSize.height/2 + margin);
        [self addChild:_label];
    }
    return self;
}

-(void)numCollectedChanged:(int)numCollected
{
    _label.string = [NSString stringWithFormat:@"Score : %d", numCollected];
}
@end

@interface HelloWorldLayer ()
@property (assign) int numCollected;

@end



#pragma mark - HelloWorldLayer
// HelloWorldLayer implementation
@implementation HelloWorldLayer
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
    
    HudLayer *hud = [HudLayer node];
    [scene addChild:hud];
    layer->hud = hud;
	
	// return the scene
	return scene;
}
- (void) Monster1move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/1.5;
    int realY = 40;
    CGPoint realDest = ccp(realX, realY);
    
    
   // winSize.width/1.5, winSize.height-28
    
    int realX1 = winSize.width-20;
    int realY1 = 40;
    
    int realX2 = winSize.width-20;
    int realY2 = winSize.height-40;
    
    int realX3 = winSize.width-20;
    int realY3 = 40;
    
    
    
    int realX4 = winSize.width/1.5;
    int realY4 = 40;
    
        
    int realX5 = winSize.width/1.5;
    int realY5 = winSize.height-28;
    
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    CGPoint realDest4 = ccp(realX4, realY4);
    CGPoint realDest5 = ccp(realX5, realY5);
    
    float realMoveDuration = 1;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest];
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest3];
    id actionMove4 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest4];
    id actionMove5 = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest5];
    
    //id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishedMoving:)];
    
    [monster1 runAction:
     [CCSequence actions: actionRotate180,actionMove,actionRotate90,actionMove1,actionRotate360,actionMove2,actionRotate180,actionMove3,actionRotate,actionMove4,actionRotate,actionMove5,nil]];
        
}

- (void) Monster2move:(ccTime)dt
{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = winSize.width/3+50;
    int realY = winSize.height/6-30;
    CGPoint realDest = ccp(realX, realY);
    
    //(winSize.width/6-20, winSize.height/6-30
    
    // winSize.width/1.5, winSize.height-28
    
    int realX1 = winSize.width/3+50;
    int realY1 = winSize.height/1.5+50;
    
    int realX2 = 20;
    int realY2 = winSize.height/1.5+50;
    
    int realX3 = 20;
    int realY3 = winSize.height/6-30;

    
    
    CGPoint realDest1 = ccp(realX1, realY1);
    CGPoint realDest2 = ccp(realX2, realY2);
    CGPoint realDest3 = ccp(realX3, realY3);
    
    float realMoveDuration = 1;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
   
    id actionRotate90 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:90];
    id actionRotate360 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:360];
    id actionRotate270 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:270];
    id actionRotate180 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:180];
    id actionMove1 = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest1];
    id actionMove2 = [CCMoveTo actionWithDuration:realMoveDuration position:realDest2];
    id actionMove3 = [CCMoveTo actionWithDuration:realMoveDuration*1.5 position:realDest3];
    
    //id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishedMoving:)];
    
    [monster2 runAction:
     [CCSequence actions: actionRotate90,actionMove,actionRotate360,actionMove1,actionRotate270,actionMove2,actionRotate180,actionMove3,actionRotate90,nil]];
    
   
    
}
- (void) Monster1Freeze
{
    float realMoveDuration = 10;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    
    [monster1 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
}
- (void) Monster2Freeze
{
    float realMoveDuration = 10;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    
    [monster2 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
    
}
- (void) Monster3Freeze:(ccTime)dt
{
    float realMoveDuration = 10;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    [monster3 runAction:
     [CCSequence actions: actionRotate,nil]];
}
- (void) Monster4Freeze:(ccTime)dt
{
    float realMoveDuration = 10;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    [monster4 runAction:
     [CCSequence actions: actionRotate,nil]];
    
}
- (void) actionmonster1
{
    
    [self Monster1Freeze];
        
    [self schedule:@selector(Monster1move: ) interval:9.5 repeat:250 delay:0];
}
- (void) actionmonster2
{
    [self Monster2Freeze];
    [self schedule:@selector(Monster2move: ) interval:6 repeat:250 delay:0 ];
}
- (void) actionmonster3
{
    [self schedule:@selector(Monster3Freeze: ) interval:1];
}
- (void) actionmonster4
{
    [self schedule:@selector(Monster4Freeze: ) interval:1 ];
    
    
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
    
    //CCLOG(@"playerPos %@",CGPointCreateDictionaryRepresentation(playerPos));
    
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
    
    tileCoord = [self tileCoordForPosition:position];
    tileGid = [border tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Power_blue"];
            if (collision && [collision isEqualToString:@"True"]) {
                powerBlue = 1;
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
                [[SimpleAudioEngine sharedEngine] playEffect:@"pickup.caf"];
                if (_numCollected > winScore) {
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
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
                // Start timer
            }
            
        }
    }
    tileGid = [darkBlue tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collectible = properties[@"collectible2x"];
            if (collectible && [collectible isEqualToString:@"True"] && powerBlue == 1) {
                [darkBlue removeTileAt:tileCoord];
                _numCollected++;
                
                [hud numCollectedChanged:_numCollected];
                [[SimpleAudioEngine sharedEngine] playEffect:@"pickup.caf"];
                if (_numCollected > winScore) {
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                }
                

            }
        }
    }
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    player.position = position;
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

- (void) PauseGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    [[CCDirector sharedDirector] pause];
}

- (void)ResumeGame:(id)sender

{
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] startAnimation];
}


// on "init" you need to initialize your instance
-(id) init
{
	
    if( (self=[super init]) ) {
                
        
        //[self setTouchEnabled:YES];
        
        self.isTouchEnabled = YES;
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Raycast.m4a"];
        
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"tileMap2.tmx"];
        snow = [_tileMap layerNamed:@"Snow"];
        border = [_tileMap layerNamed:@"Border"];
        street  = [_tileMap layerNamed:@"Street"];
        building = [_tileMap layerNamed:@"Building"];
        darkBlue = [_tileMap layerNamed:@"DarkBlueTiles"];
        powerBlueLayer = [_tileMap layerNamed:@"power_blue"];
        
        playerDirection = 1;
        winScore = 188;
        totalLives = 2;
        
        
        for(CCTMXLayer *child in [_tileMap children])
        {
            [[child texture] setAliasTexParameters];
        }
        [self addChild: _tileMap];
        
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        [self spawnPlayer];
        if(player == nil)
        {
            printf("this is an error");
        }
        [self addChild:player];
    
        monster1 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster1.position = ccp(winSize.width/1.5, winSize.height-28);
        [self addChild:monster1];
        
               
        monster2 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster2.position = ccp(20, winSize.height/6-30);
        [self addChild:monster2];
        
        monster3 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster3.position = ccp(winSize.width-50, winSize.height-40);
        [self addChild:monster3];
        
        monster4 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster4.position = ccp(winSize.width-20, winSize.height/3);
        [self addChild:monster4];
        
        int realX = winSize.width/2;
        int realY = 720;
        CGPoint realDest = ccp(realX, realY);
        
        int realX1 = winSize.width/2;
        int realY1 = winSize.height/2;
        CGPoint realDest1 = ccp(realX1, realY1);
        
        float realMoveDuration = 10;
      
        [self performSelectorInBackground:@selector(actionmonster1) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster2) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster3) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster4) withObject:self];
        
//        [player runAction:
//         [CCSequence actions: actionRotate,actionMove,actionRotate,actionMove1,nil]];
//        
        
        // Standard method to pause the game
        CCMenuItem *starMenuItem = [CCMenuItemImage itemFromNormalImage:@"pause.png" selectedImage:@"pause.png" target:self selector:@selector(PauseGame:)];
        starMenuItem.position = ccp(870, 25);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        // Standard method to resume the game
        CCMenuItem *resumeMenuItem = [CCMenuItemImage itemFromNormalImage:@"resume.jpg" selectedImage:@"resume.jpg" target:self selector:@selector(ResumeGame:)];
        resumeMenuItem.position = ccp(820, 25);
        CCMenu *resumeMenu = [CCMenu menuWithItems:resumeMenuItem, nil];
        resumeMenu.position = CGPointZero;
        [self addChild:resumeMenu];
        
        [self schedule:@selector(checkCollisionWithMonster)];
        
        
	}
    
    return self;
}

- (void) checkCollisionWithMonster
{
    if(CGRectIntersectsRect([monster1 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster2 boundingBox], [player boundingBox]) || CGRectIntersectsRect([monster3 boundingBox], [player boundingBox])||CGRectIntersectsRect([monster4 boundingBox], [player boundingBox]))
    {
        lifeCount++;
        if (lifeCount > totalLives) {
            lifeCount = 0;
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        [self spawnPlayer];
        return;
    }
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