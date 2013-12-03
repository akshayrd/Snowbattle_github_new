#import "HelloWorldLayer_Level2.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "GameOverLayer.h"
#import "GameStartLayer.h"
#import "LevelSelectLayer.h"
#import "Bonus_hud.h"

@interface HelloWorldLayer_Level2 ()
@property (assign) int numCollected;

@end

#pragma mark - HelloWorldLayer_Level2

@implementation HelloWorldLayer_Level2

+(CCScene *) scene2:(BOOL)playerImage1 timeBonus:(int) timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray{
    
    // 'scene' is an autorelease object.
    CCScene *scene2 = [CCScene node];
    
    // 'layer' is an autorelease object.
    HelloWorldLayer_Level2 *layer = [[HelloWorldLayer_Level2 alloc] initWithPlayer:playerImage1 timeBonus:timeRemaining powerups:powerupArray playerSelected:playerSelectArray];
    
    // add layer as a child to scene
    [scene2 addChild: layer];
    
    
    HudLayer *hud = [HudLayer node];
    [scene2 addChild:hud];
    layer->hud = hud;
    
    Bonus_hud *bhud = [Bonus_hud scene:YES];
    [scene2 addChild:bhud];
    layer->b_hud = bhud;
    bhud.visible = NO;
    
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
    
    //ccp(75, winSize.height-150)
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int realX = 75;
    int realY = winSize.height-50;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = 175;
    int realY1 = winSize.height-50;
    
    int realX2 = 175;
    int realY2 = winSize.height-150;
    
    int realX3 = 75;
    int realY3 = winSize.height-150;
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
    int realY = winSize.height/2-10;
    CGPoint realDest = ccp(realX, realY);
    
    int realX1 = winSize.width/2-40;
    int realY1 = winSize.height/2-10;
    
    int realX2 = winSize.width/2-40;
    int realY2 = winSize.height-40;
    
    int realX3 = 125;
    int realY3 = winSize.height-40;
    
    int realX4 = 125;
    int realY4 = winSize.height/2+40;
    
    int realX5 = winSize.width/2-40;
    int realY5 = winSize.height/2+40;
    
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

CGPoint currentposition;

- (void) Ghost1move:(ccTime)dt {
    
    
    monster13 = [CCSprite spriteWithFile:@"monster-hd.png"];
    
    // Determine where to spawn the monster along the Y axis
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int minY = 100;
    int maxY = winSize.height - 100;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    /*
     int minX = 100;
     int maxX = winSize.width - 100;
     int rangeX = maxX - minX;
     int actualX = (arc4random() % rangeX) + minX;
     */
    
    // Create the monster slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    monster13.position = ccp(winSize.width - 100, winSize.height/2);
    if (c==0)
        [self addChild:monster13];
    
    if(myTime > pitTime + 25  && c )
    {
        c = 0;
        ghostpitLayer.visible  = YES;
    }
    
    if((myTime > pitTime + 5) && c)
    {
        ghostpitLayer.visible  = NO;
    }
    
    
    // Determine speed of the monster
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    currentposition = ghost1.position;
    
    // Create the actions
    //CCMoveTo * actionMove = nil;
    
    CCMoveTo * actionMove = [CCMoveTo actionWithDuration:actualDuration*2
                                                position:ccp(-monster13.contentSize.width/2, actualY)];
    
    CCCallBlockN * actionMoveDone = [CCCallBlockN actionWithBlock:^(CCNode *node) {
        [node removeFromParentAndCleanup:YES];
    }];
    
    //if(c==0)
    [monster13 runAction:[CCSequence actions:actionMove,actionMoveDone, nil]];
    
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

- (void) actionghost1
{
    [self schedule:@selector(Ghost1move: ) interval:4 repeat:150 delay:0 ];
}

CCSprite *monster5;
CCSprite *monster6;
CCSprite *monster7;
CCSprite *monster8;

CCSprite *ghost1;
CCSprite *ghost2;
CCSprite *ghost3;



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



- (void) moveSensingMonster   // every 1 sec called
{
    // Get player pos
    // get current pos
    //check diffx > diffy
    // move 1 tile to diffx
    
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    BOOL corner = NO;
    
    CGPoint p_pos = player.position;
    CGPoint m_pos = monster5.position;
    
    int diff_x = m_pos.x - p_pos.x;
    int diff_y = m_pos.y - p_pos.y;
    int new_x = m_pos.x, new_y= m_pos.y;
    if (abs(diff_x) > abs(diff_y))
    {
        if (diff_x > 0) {
            new_x = m_pos.x - 50;
        }
        else
        {
            new_x = m_pos.x + 50;
        }
    }
    else
    {
        if (diff_y > 0) {
            new_y = m_pos.y - 50;
        }
        else
        {
            new_y = m_pos.y + 50;
        }
        
    }
    CGPoint actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    CGPoint realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    CGPoint tileCoord = [self tileCoordForPosition:realDest];
    
    //NSLog(@"%f %f",tileCoord.x,tileCoord.y);
    
    int tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                corner = YES;
                if (abs(diff_x) < abs(diff_y))
                {
                    if (diff_x > 0) {
                        new_x = m_pos.x - 50;
                        new_y = m_pos.y;
                        
                    }
                    else
                    {
                        new_x = m_pos.x + 50;
                        new_y = m_pos.y;
                    }
                }
                else
                {
                    if (diff_y > 0) {
                        new_y = m_pos.y - 50;
                        new_x = m_pos.x;
                    }
                    else
                    {
                        new_y = m_pos.y + 50;
                        new_x = m_pos.x;
                    }
                    
                }
                
                
            }
            
        }
        
    }
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    
    tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                
                if (abs(diff_x) < abs(diff_y))
                {
                    if (diff_x > 0) {
                        new_x = m_pos.x - 50;
                        new_y = m_pos.y;
                        
                    }
                    else
                    {
                        new_x = m_pos.x + 50;
                        new_y = m_pos.y;
                    }
                }
                else
                {
                    if (diff_y > 0) {
                        new_y = m_pos.y - 50;
                        new_x = m_pos.x;
                    }
                    else
                    {
                        new_y = m_pos.y + 50;
                        new_x = m_pos.x;
                    }
                    
                }
                
                
            }
            
        }
        
    }
    
    //tileCoord = [self tileCoordForPosition:position];
    tileGid = [border tileGIDAt:tileCoord];
    if (tileGid) {
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"]) {
                if (corner == YES) {
                    return;
                }
                else
                    corner = NO;
                
                if (abs(diff_x) < abs(diff_y))
                {
                    if (diff_x > 0) {
                        new_x = m_pos.x + 50;
                        new_y = m_pos.y;
                    }
                    else
                    {
                        new_x = m_pos.x - 50;
                        new_y = m_pos.y;
                    }
                }
                else
                {
                    if (diff_y > 0) {
                        new_y = m_pos.y + 50;
                        new_x = m_pos.x;
                    }
                    else
                    {
                        new_y = m_pos.y - 50;
                        new_x = m_pos.x;
                    }
                }
            }
        }
    }
    
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    float realMoveDuration = 1;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    
    [monster5 runAction: [CCSequence actions: actionMove, nil]];
    //monster5.position = realDest;
    
}




//int livePowerEnabled = 0;
CCSprite* PowerLabel;

-(void)setPlayerPosition:(CGPoint)position {
    CGPoint tileCoord = [self tileCoordForPosition:position];
    
    //NSLog(@"%f %f",tileCoord.x,tileCoord.y);
    
    
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
                
                currentLevelScore++;
                [hud numCollectedChanged:currentLevelScore+totalScore];
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                NSLog(@"Current Score:%d",currentLevelScore);
                NSLog(@"winscore Score:%d",winScore);
                
                if (currentLevelScore >= winScore) {
                    
                    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                    
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES
                                                          withscoreValue:currentLevelScore timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
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
                [hud lifeItemsAdd:lifeCount];
                //lifeItem[lifeCount].visible = true;
                
            }
        }
    }
    
    
    
    tileGid = [powerGrenadeLayer tileGIDAt:tileCoord];
    if (tileGid) {
        
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Grenade"];
            if (collision && [collision isEqualToString:@"True"]) {
                [powerGrenadeLayer removeTileAt:tileCoord];
                powerGrenade = 1;
                [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
                //[player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"HyperPlayer_40x40.png"]];
                //bubble.visible = TRUE;
                
                [self schedule:@selector(MakeBubbleInvisible ) interval:3 repeat:1 delay:7];
                //[self newLocalScore];
            }
        }
    }
    
    tileGid = [bonusLayer tileGIDAt:tileCoord];
    if (tileGid) {
        
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        if (properties) {
            NSString *collision = properties[@"Bonus"];
            if (collision && [collision isEqualToString:@"True"] && bonusRoundPlayed == NO && isBonusDisplayed
                && bonusPointsLocation[bonusIndex].x == tileCoord.x && bonusPointsLocation[bonusIndex].y == tileCoord.y)
            {
                [bonusLayer removeTileAt:tileCoord];
                [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
                
                //  visible that lable
                //[self startAnimation:ccp(300, 300)];
                
                
                // animate the label
                // delay of 3 sec
                // then remove the lable
                
                b_hud.visible  = YES;
                b_hud.touchEnabled = YES;
                bonusStageRunning = YES;
                bonusRoundPlayed = YES;
                self.visible = NO;
                
                [self schedule:@selector(checkBonusStageIsReturned) ];
                [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(PauseGameForBonus:) userInfo:nil repeats:NO];
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
                
                currentLevelScore++;
                darkBlueCount++;
                if(darkBlueCount == 42)
                {
                    //[player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"FinalTwo_51x51x.png"]];
                    [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"NormalPlayer_40x40.png"]];
                    powerBlue = 0;
                    PowerLabel.visible=FALSE;
                    timeLabelBlue.visible=FALSE;
                }
                
                [hud numCollectedChanged:currentLevelScore];
                
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                if (currentLevelScore > winScore) {
                    
                    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES withscoreValue:currentLevelScore timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
                    
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                    
                }
                
            }
            
        }
        
    }
    
    tileGid = [grenadeLayer tileGIDAt:tileCoord];
    
    if (tileGid) {
        
        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        
        if (properties) {
            
            NSString *collision = properties[@"Collidable"];
            if (collision && [collision isEqualToString:@"True"] && powerGrenade!=1) {
                return;
            }
            
            if (powerGrenade == 1) {
                //NSLog(@"Inside grenade %f %f",tileCoord.x,tileCoord.y);
                CCParticleFire * p = [[CCParticleFire alloc]initWithTotalParticles:500];
                [p autorelease];
                p.texture=[[CCTextureCache sharedTextureCache] addImage:@"fire.png"];
                p.autoRemoveOnFinish = YES;
                p.duration = 1;
                p.position=ccp(700,350);
                [self addChild:p];
                //[grenadeLayer removeFromParent];
                [grenadeLayer removeTileAt:tileCoord];
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion-01.mp3"];
            }
        }
    }
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    
    //id actionMove = [CCMoveTo actionWithDuration:0.5 position:position];
    
    //    [player runAction:
    //     [CCSequence actions: actionMove,nil]];
    
    player.position = position;
    
    //player.position = position;
}

- (void) checkBonusStageIsReturned
{
    if (b_hud.visible == NO && self.touchEnabled == NO) {
        bonusStageRunning = NO;
        [self ResumeGameAfterBonus];
        [self unschedule:@selector(checkBonusStageIsReturned)];
    }
    //NSLog(@"Checkbonus");
    
    
}

-(void)moveEnemyRandom:(CCSprite *) enemy1{
    
    
    int x = rand()%(int)screenSize2.width;
    int y = rand()%(int)screenSize2.height;
    [enemy1 runAction:[CCSequence actions:[CCMoveTo actionWithDuration:1 position:ccp(x, y)],[CCCallBlock actionWithBlock:^{
        [self moveEnemyRandom:enemy1];
    }], nil]];
    
}


- (void) checkCollisionWithMonster
{
    //NSLog(@"Time %d",myTime - collideTime );
    
    if(((CGRectIntersectsRect([monster13 boundingBox], [player boundingBox]) && c==0) ||  CGRectIntersectsRect([monster7 boundingBox], [player boundingBox])||CGRectIntersectsRect([monster8 boundingBox], [player boundingBox])) && totalTime - collideTime >= immuneDuration && bonusStageRunning == NO)
        
    {
        collideTime = totalTime;
        CCBlink* blink = [CCBlink actionWithDuration:immuneDuration blinks:20];
        //lifeItem[lifeCount].visible = false;
        [hud lifeItemsDelete:lifeCount];
        lifeCount--;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
        count = 0;
        if (lifeCount < 0)
        {
            lifeCount = 2;
            [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        [player runAction:blink];
    }
    
}

// on "init" you need to initialize your instance
-(id) initWithPlayer:(BOOL)player1 timeBonus:(int) timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray
{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.touchEnabled = YES;
        isBonusDisplayed =  NO;
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"tileMap3.tmx"];
        
        snow = [_tileMap layerNamed:@"Snow"];
        _playerimage = player1;
        bonusStageRunning = NO;
        bonusRoundPlayed = NO;
        currentLevelScore = 0;
        
        count = 90;
        darkBlueCount = 0;
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"funk.mp3"];
        totalScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Score"];
        
        border = [_tileMap layerNamed:@"Border"];
        building = [_tileMap layerNamed:@"Building"];
        darkBlue = [_tileMap layerNamed:@"DarkBlueTiles"];
        powerBlueLayer = [_tileMap layerNamed:@"power_blue"];
        powerGrenadeLayer = [_tileMap layerNamed:@"Grenade"];
        powerLivesLayer = [_tileMap layerNamed:@"Power_lives"];
        grenadeLayer = [_tileMap layerNamed:@"GrenadeWall"];
        bonusLayer = [_tileMap layerNamed:@"Bonus"];
        ghostpitLayer = [_tileMap layerNamed:@"ghostPit"];
        
        powerLivesLayer.visible = FALSE;
        
        playerDirection = 1;
        bonusPointsLocation[0] = ccp(6, 14);
        bonusPointsLocation[1] = ccp(12, 1);
        bonusPointsLocation[2] = ccp(17, 10);
        bonusPointsLocation[3] = ccp(6, 9);
        bonusPointsLocation[4] = ccp(17, 13);
        totalScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Score"];
        
        
        for (int i = 0; i<5; i++)
        {
            [bonusLayer tileAt:bonusPointsLocation[i]].visible = NO;
        }
        
        winScore = 195 ;
        //winScore = 10;
        totalLives = 2;
        //        totalLives = 1;
        lifeCount = 2;
        levelTimeLimit = 240;
        powerLiveTimeLimit = 45;
        collideTime =0;
        immuneDuration = 2;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];  // Request the current window size
        
        for(CCTMXLayer *child in [_tileMap children])
        {
            [[child texture] setAliasTexParameters];
        }
        
        [self addChild: _tileMap];
        
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
        
        //player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        //player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 1)
        {
            player = [CCSprite spriteWithFile:@"NormalPlayer_40x40.png"] ;
        }
        else if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 2){
            player = [CCSprite spriteWithFile:@"HyperPlayer_40x40.png"] ;
        }

        [self spawnPlayer];
        if(player == nil)
        {
            printf("this is an error");
        }
        [self addChild:player];
        
        
        monster5 = [CCSprite spriteWithFile:@"ghosts.png"];
        
        CGPoint actualPos = [self tileCoordForPosition:ccp(300, winSize.height/2-10)];
        
        monster5.position = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
        
        
        
        //[self addChild:monster5];
        screenSize2 = [CCDirector sharedDirector].winSize;
        
        
        monster7 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster7.position = ccp(winSize.width-45, winSize.height-50);
        [self addChild:monster7];
        
        monster8 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster8.position = ccp(125, 75);
        [self addChild:monster8];
        
        //ghost1 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        //ghost1.position = ccp(winSize.width-45,winSize.height/2);
        //[self addChild:ghost1];
        
        //[self performSelectorInBackground:@selector(actionmonster5) withObject:self];
        //[self performSelectorInBackground:@selector(actionmonster6) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster7) withObject:self];
        [self performSelectorInBackground:@selector(actionmonster8) withObject:self];
        
        [self performSelectorInBackground:@selector(actionghost1) withObject:self];
        
        
        // Standard method to pause the game
        /*starMenuItem = [CCMenuItemImage itemWithNormalImage:@"player_pause40x40.png" selectedImage:@"player_pause40x40.png" target:self selector:@selector(PauseResumeGame:)];
         
         //starMenuItem.position = ccp(870, 25);
         starMenuItem.position = ccp(22, 680);
         CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
         starMenu.position = CGPointZero;
         [self addChild:starMenu];*/
        
        /* Ghost Immune PowerUp */
        if(powerupArray[1]>=1 || ([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp2"] >=1))
        {
            
            shopPowerUp2 = [CCMenuItemImage itemWithNormalImage:@"powerUp_immuneGhost.png" selectedImage:@"powerUp_immuneGhost.png" target:self selector:Nil];
            shopPowerUp2.position = ccp(22, 600-9*40);
            shopPowerUp2.visible = true;
            [self addChild:shopPowerUp2];
        }
        /* Ghost Pit Close PowerUp */
        if(powerupArray[2]>=1 || ([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp3"] >=1))
        {
            shopPowerUp2 = [CCMenuItemImage itemWithNormalImage:@"NoMoreGhostPowerUp_45x45.png" selectedImage:@"NoMoreGhostPowerUp_45x45.png" target:self selector:@selector(Closepit:)];
            shopPowerUp2.visible = true;
            CCMenu *menu8 = [CCMenu menuWithItems: shopPowerUp2, nil];
            menu8.position=ccp(22, 600-10*40);
            [menu8 alignItemsVerticallyWithPadding:15];
            [self addChild:menu8];
        }
        
        /*for (int i=0; i<5; i++) {
         lifeItem[i] = [CCMenuItemImage itemWithNormalImage:@"life.png" selectedImage:@"life.png" ];
         lifeItem[i].position = ccp(22, 600-i*40);
         lifeItem[i].visible = true;
         }
         lifeItem[3].visible = false;
         lifeItem[4].visible = false;*/
        /* Life Power Up */
        if(powerupArray[0]>=1 || ([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp1"] >=1))
        {
            //lifeItem[3].visible = true;
            [self schedule:@selector(shopPowerUpIncreaseLife) interval:0 repeat:0 delay:0];
        }
        /*life = [CCMenu menuWithItems:lifeItem[0],lifeItem[1],lifeItem[2],lifeItem[3],lifeItem[4], nil];
         
         life.position = CGPointZero;
         [self addChild:life];*/
        
        [self schedule:@selector(checkCollisionWithMonster)];
        [self schedule:@selector(ShowBonuStageImage) ];
        //[self schedule:@selector(moveSensingMonster) interval:1];
        
        myTime = 0;
        
        c = 0;
        
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
        bubble3.position = ccp(winSize.width - 550 , winSize.height - 530);
        [self addChild:bubble3];
        bubble3.visible = FALSE;
        
        [self addChild:timeLabelBlue];
        
        [self schedule:@selector(LevelTimer:)];
        
        
    }
    return self;
}

-(void)shopPowerUpIncreaseLife
{
    lifeCount++;
    [hud lifeItemsAdd:lifeCount];
}

- (void) ShowBonuStageImage
{
    if (bonusRoundPlayed == NO)
    {
        
        if (myTime%20 == 0 && myTime !=0 && isBonusDisplayed == NO)
        {
            isBonusDisplayed = YES;
            NSLog(@"Player pos:%f %f", player.position.x, player.position.y);
            CGPoint tileCoord = [self tileCoordForPosition:player.position];
            NSLog(@"Player pos1:%f %f", tileCoord.x, tileCoord.y);
            do {
                bonusIndex = rand() %5;
            } while (bonusPointsLocation[bonusIndex].x == tileCoord.x && bonusPointsLocation[bonusIndex].y == tileCoord.y);
            
            [bonusLayer tileAt:bonusPointsLocation[bonusIndex]].visible = YES;
            
        }
        else if ((myTime+11)%20 == 0) {
            [bonusLayer tileAt:bonusPointsLocation[bonusIndex]].visible = NO;
            isBonusDisplayed = NO;
        }
        
    }
}
-(void) MakeBubbleInvisible
{
    bubble.visible = FALSE;
}

int livePowerEnabled1 = 0;

-(void)LevelTimer:(ccTime)dt
{
    totalTime += dt;
    currentTime = (int)totalTime;
    if (myTime < currentTime)
    {
        myTime = currentTime;
        [timeLabel setString:[NSString stringWithFormat:@"%02d:%02d", (levelTimeLimit - myTime)/60, (levelTimeLimit-myTime)%60]];
    }
    
    if (myTime == 25 && livePowerEnabled1 == 0) {
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
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
        [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+ totalScore forKey:@"Score"];
        
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

-(CGPoint)tileCoordForPosition:(CGPoint)position
{
    int x = position.x / _tileMap.tileSize.width;
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / _tileMap.tileSize.height;
    return ccp(x, y);
}

-(void) PauseGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    [[CCDirector sharedDirector] pause];
    self.touchEnabled = NO;
    starMenuItem.visible = NO;
    
}

-(void) Closepit:(id) sender
{
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp3"];
    shopPowerUp2.visible = false;
    //NSLog(@"helloo");
    c = 1;
    pitTime = myTime;
    Powerupmenu2.visible = false;
    CCParticleSmoke * p1 = [[CCParticleSmoke alloc]initWithTotalParticles:5];
    [p1 autorelease];
    p1.texture=[[CCTextureCache sharedTextureCache] addImage:@"smoke.png"];
    p1.autoRemoveOnFinish = YES;
    p1.duration = 5;
    //p1.life=1.0;
    p1.position=ccp(980,370);
    [self addChild:p1];
    
    //int tileGid = [ghostpitLayer tileGIDAt:tileCoord];
    self.touchEnabled = YES;
}

-(void) PauseGameForBonus:(id)sender
{
    //[[CCDirector sharedDirector] stopAnimation];
    //[[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    //[[CCDirector sharedDirector] pause];
    self.touchEnabled = NO;
    
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
    [CCMenuItemFont setFontName:@"chalkduster"];
    
    [CCMenuItemFont setFontSize:50];
    
    
    CCMenuItemFont *resumeGame = [CCMenuItemFont itemWithString:@"Resume"
                                                         target:self
                                                       selector:@selector(ResumeGame:)];
    [resumeGame setColor:ccBLUE];
    CCMenuItemFont *restartGame = [CCMenuItemFont itemWithString:@"Restart Level"
                                                          target:self
                                                        selector:@selector(RestartGame:)];
    [restartGame setColor:ccBLUE];
    CCMenuItemFont *menuGame = [CCMenuItemFont itemWithString:@"Select Level"
                                                       target:self
                                                     selector:@selector(MenuGame:)];
    [menuGame setColor:ccBLUE];
    
    pauseResumeMenu = [CCMenu menuWithItems: resumeGame,restartGame,menuGame, nil];
    pauseResumeMenu.position=ccp(500,300);
    [pauseResumeMenu alignItemsVerticallyWithPadding:15];
    [self addChild:pauseResumeMenu];
    
    [NSTimer scheduledTimerWithTimeInterval:.06 target:self selector:@selector(PauseGame:) userInfo:nil repeats:NO];
}


-(void)ResumeGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] startAnimation];
    [self removeChild:pauseResumeMenu];
    self.touchEnabled = YES;
    starMenuItem.visible = YES;
    
}

-(void)ResumeGameAfterBonus
{
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    [[CCDirector sharedDirector] startAnimation];
    self.touchEnabled = YES;
    self.visible = YES;
    
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
    
    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+ totalScore forKey:@"Score"];
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:NO timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
}


-(void)MenuGame:(id)sender
{
    [[CCDirector sharedDirector] stopAnimation];
    [[CCDirector sharedDirector] resume];
    
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    [[CCDirector sharedDirector] startAnimation];
    
    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+ totalScore forKey:@"Score"];
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
