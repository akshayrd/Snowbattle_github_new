#import "HelloWorldLayer_Level3.h"
#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "GameOverLayer.h"
#import "GameStartLayer.h"
#import "LevelSelectLayer.h"
//#import "BonusStage.h"

@interface HelloWorldLayer_Level3 ()
@property (assign) int numCollected;

@end

#pragma mark - HelloWorldLayer_Level3

@implementation HelloWorldLayer_Level3

+(CCScene *) scene:(BOOL)playerImage1 timeBonus:(int) timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray{
    
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    HelloWorldLayer_Level3 *layer = [[HelloWorldLayer_Level3 alloc] initWithPlayer:playerImage1 timeBonus:timeRemaining powerups:powerupArray playerSelected:playerSelectArray];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    
    HudLayer *hud = [HudLayer node];
    [scene addChild:hud];
    layer->hud = hud;
    
    /*Bonus_hud *bhud = [Bonus_hud scene:YES];
     [scene2 addChild:bhud];
     layer->b_hud = bhud;
     bhud.visible = NO;*/
    
    return scene;
}

- (void) moveSensingMonster1  // every 1 sec called
{
    // Get player pos
    // get current pos
    //check diffx > diffy
    // move 1 tile to diffx
    
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    BOOL corner = NO;
    
    CGPoint p_pos = player.position;
    CGPoint m_pos = planeMonster1.position;
    
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
    
    CGPoint tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    //NSLog(@"%f %f",tileCoord.x,tileCoord.y);
    
    int tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
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
    
    //        }
    //
    //    }
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    tileCoord = [self tileCoordForPosition:realDest];
    tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        return;
        
    }
    
    //        }
    //
    //    }
    
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
    
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [riverLayer tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
    
    float realMoveDuration = 1;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    
    [planeMonster1 runAction: [CCSequence actions: actionMove, nil]];
    //monster5.position = realDest;
    
}

- (void) moveSensingMonster2  // every 1 sec called
{
    // Get player pos
    // get current pos
    //check diffx > diffy
    // move 1 tile to diffx
    
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    BOOL corner = NO;
    
    CGPoint p_pos = player.position;
    CGPoint m_pos = planeMonster2.position;
    
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
        // NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
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
    
    //        }
    //
    //    }
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
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
    
    
    
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [riverLayer tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
    
    float realMoveDuration = 1;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    
    [planeMonster2 runAction: [CCSequence actions: actionMove, nil]];
    //monster5.position = realDest;
    
}

- (void) moveSensingMonster3  // every 1 sec called
{
    // Get player pos
    // get current pos
    //check diffx > diffy
    // move 1 tile to diffx
    
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    BOOL corner = NO;
    
    CGPoint p_pos = player.position;
    CGPoint m_pos = planeMonster3.position;
    
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
        // NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
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
    
    //        }
    //
    //    }
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
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
    
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [riverLayer tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
    
    float realMoveDuration = 1;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    
    [planeMonster3 runAction: [CCSequence actions: actionMove, nil]];
    //monster5.position = realDest;
    
}

- (void) moveSensingMonster4  // every 1 sec called
{
    // Get player pos
    // get current pos
    //check diffx > diffy
    // move 1 tile to diffx
    
    //CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    BOOL corner = NO;
    
    CGPoint p_pos = player.position;
    CGPoint m_pos = planeMonster4.position;
    
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
        // NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
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
    
    //        }
    //
    //    }
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        //
        return;
        
    }
    
    //        }
    //
    //    }
    //
    
    actualPos = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    realDest  = ccp(actualPos.x*_tileMap.tileSize.width + _tileMap.tileSize.width/2, (_tileMap.mapSize.height- actualPos.y-1) *_tileMap.tileSize.height + _tileMap.tileSize.height/2);
    
    tileCoord = [self tileCoordForPosition:ccp(new_x, new_y)];
    
    
    tileGid = [riverLayer tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        
        return;
        
    }
    
    //        }
    //
    //    }
    
    
    float realMoveDuration = 1;
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration position:realDest];
    
    [planeMonster4 runAction: [CCSequence actions: actionMove, nil]];
    //monster5.position = realDest;
    
}

- (void) Monster1move:(ccTime)dt
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

- (void) Monster6Freeze
{
    float realMoveDuration = 6;
    id actionRotate = [CCRotateBy actionWithDuration:realMoveDuration/10 angle:90];
    // id actionRotate1 = [CCRotateTo actionWithDuration:realMoveDuration/10 angle:0];
    [monster5 runAction:
     [CCSequence actions: actionRotate,actionRotate,actionRotate,actionRotate,nil]];
    
}

- (void) actionmonster1
{
    [self Monster6Freeze];
    [self schedule:@selector(Monster1move:) interval:1.5 repeat:250 delay:0];
}

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
                //down=false;
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
                //down=false;
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
                CGPoint tileCoord = [self tileCoordForPosition:playerPos];
                
                
                int tileGid = [riverLayer tileGIDAt:tileCoord];
                if (tileGid)
                {
                    NSLog(@"down True");
                    down=true;
                }
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
    [self setViewPointCenter:player.position];
}

//int livePowerEnabled = 0;
CCSprite* PowerLabel;

-(void)setPlayerPosition:(CGPoint)position {
    CGPoint tileCoord = [self tileCoordForPosition:position];
    
    
    int tileGid = [building tileGIDAt:tileCoord];
    if (tileGid) {
        //NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
        //        if (properties) {
        //            NSString *collision = properties[@"Collidable"];
        //            if (collision && [collision isEqualToString:@"True"]) {
        return;
    }
    //
    //        }
    //
    //    }
    
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
            if (collectible && [collectible isEqualToString:@"True"] && [snow tileAt:tileCoord].visible == YES) {
                //[snow removeTileAt:tileCoord];
                
                [snow tileAt:tileCoord].visible = NO;
                currentLevelScore++;
                [hud numCollectedChanged:currentLevelScore+totalScore];
                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
                
                //NSLog(@"Current Score:%d",currentLevelScore);
                //NSLog(@"winscore Score:%d",winScore);
                
                if (currentLevelScore >= winScore) {
                    
                    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                    
                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES
                                                          withscoreValue:currentLevelScore timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
                    
                }
            }
        }
    }
    
    //    tileGid = [darkBlue tileGIDAt:tileCoord];
    //
    //    if (tileGid) {
    //
    //        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
    //
    //        if (properties) {
    //
    //            NSString *collectible = properties[@"collectible2x"];
    //
    //            if(powerBlue!=1)
    //            {
    //                bubble3.visible=TRUE;
    //                [self schedule:@selector(removeBubble3) interval:3 repeat:1 delay:5];
    //            }
    //
    //            if (collectible && [collectible isEqualToString:@"True"] && powerBlue == 1) {
    //
    //                [darkBlue removeTileAt:tileCoord];
    //
    //                currentLevelScore++;
    //                darkBlueCount++;
    //                if(darkBlueCount == 42)
    //                {
    //                    //[player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"FinalTwo_51x51x.png"]];
    //                    [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"NormalPlayer_40x40.png"]];
    //                    powerBlue = 0;
    //                    PowerLabel.visible=FALSE;
    //                    timeLabelBlue.visible=FALSE;
    //                }
    //
    //                [hud numCollectedChanged:currentLevelScore];
    //
    //                [[SimpleAudioEngine sharedEngine] playEffect:@"shoveling.mp3"];
    //
    //                if (currentLevelScore > winScore) {
    //
    //                    [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
    //                    CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES withscoreValue:currentLevelScore timeBonus:levelTimeLimit-myTime playerImage:_playerimage];
    //
    //                    [[CCDirector sharedDirector] replaceScene:gameOverScene];
    //
    //                }
    //
    //            }
    //
    //        }
    //
    //    }
    
    tileGid = [riverLayer tileGIDAt:tileCoord];
    if (tileGid) {
        NSLog(@"Heree000 (%f,%f)",tileCoord.x,tileCoord.y);
        /*NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
         if (properties) {
         NSLog(@"Heree111");
         NSString *collision = properties[@"River"];
         if (collision && [collision isEqualToString:@"True"]) {*/
        // boat 1
        if( (tileCoord.x==17 && tileCoord.y==5) && !(boat_1.position.x >= boat1_InitialX  && boat_1.position.x<=boat1_InitialX+50) && nextBoatToGo == 1)//&& player.visible==true)
        {
            // NSLog(@"000Initial X,Y: (%f,%f)",boat_1.position.x,boat_1.position.y);
            //NSLog(@"111Initial X,Y: (%d,%d)",boat1_InitialX,boat1_InitialY);
            [hud lifeItemsDelete:lifeCount];
            lifeCount--;
            nextBoatToGo = 1;
            if (lifeCount < 0) {
                lifeCount = 2;
                [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
                
                
            }
            //player.visible = TRUE;
            //player.position = ccp(boat1_InitialX - 50,boat1_InitialY + 200);
            
            
            player.visible = TRUE;
            
            player.position =  position;
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"jumpFailed.mp3"];
            
            [self schedule:@selector(JumpFailed) interval:1 repeat:1 delay:1];
            
            return;
        }
        else if((tileCoord.x==17 && tileCoord.y==5) && (boat_1.position.x >= boat1_InitialX  && boat_1.position.x<=boat1_InitialX+50) && nextBoatToGo == 1) {
            
            player.visible=false;
            
            NSLog(@"Hereee");
            player.position=ccp(1025,boat1_InitialY);
            
            
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"GreenPlayerOnWoodenLog_50x50.jpg"]];
            //NSLog(@"DONEEE");
            nextBoatToGo = 2;
            [[SimpleAudioEngine sharedEngine] playEffect:@"JumpMusicMp3.mp3"];
            return;
            
        }
        
        if(nextBoatToGo == 2 && (down!=true || (!(boat_2.position.y <= boat2_InitialY  && boat_2.position.y>=boat2_InitialY-50))))
        {
            // NSLog(@"000Initial X,Y: (%f,%f)",boat_1.position.x,boat_1.position.y);
            //NSLog(@"111Initial X,Y: (%d,%d)",boat1_InitialX,boat1_InitialY);
            [hud lifeItemsDelete:lifeCount];
            lifeCount--;
            nextBoatToGo = 1;
            if (lifeCount < 0) {
                lifeCount = 2;
                [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
                
            }
            player.visible = TRUE;
            
            player.position =  position;
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"jumpFailed.mp3"];
            
            [self schedule:@selector(JumpFailed) interval:1 repeat:1 delay:1];
            
            
            //player.position = ccp(boat1_InitialX - 50,boat1_InitialY + 200);
            
            
            
            
            return;
        }
        else if(down==true && (tileCoord.x==20 && tileCoord.y==6) && (boat_2.position.y <= boat2_InitialY  && boat_2.position.y >=boat2_InitialY-50) && nextBoatToGo == 2){
            player.visible=false;
            player.position=ccp(player.position.x,boat3_InitialY+50);
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"GreenPlayerOnWoodenLog_50x50(2).jpg"]];
            
            NSLog(@"DONE");
            [[SimpleAudioEngine sharedEngine] playEffect:@"JumpMusicMp3.mp3"];
            nextBoatToGo = 3;
            return;
        }
        //boat 3
        if((tileCoord.x==20 && tileCoord.y==10) && !(boat_3.position.x >= boat3_InitialX  && boat_2.position.x<=boat3_InitialX+50) && nextBoatToGo == 3)
        {
            // NSLog(@"000Initial X,Y: (%f,%f)",boat_1.position.x,boat_1.position.y);
            //NSLog(@"111Initial X,Y: (%d,%d)",boat1_InitialX,boat1_InitialY);
            [hud lifeItemsDelete:lifeCount];
            lifeCount--;
            nextBoatToGo = 1;
            if (lifeCount < 0) {
                lifeCount = 2;
                [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
                
            }
            
            player.visible = TRUE;
            
            player.position =  position;
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"jumpFailed.mp3"];
            
            [self schedule:@selector(JumpFailed) interval:1 repeat:1 delay:1];
            return;
        }
        else if( (tileCoord.x==20 && tileCoord.y==10) && (boat_3.position.x >= boat3_InitialX  && boat_2.position.x<=boat3_InitialX+50) && nextBoatToGo == 3){
            player.visible=false;
            player.position=ccp(boat3_InitialX+100,player.position.y);
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"GreenPlayerOnWoodenLog_50x50.jpg"]];
            nextBoatToGo = 4;
            NSLog(@"DONEEE");
            player.position = ccp(boat3_InitialX + 100, boat3_InitialY);
            //player.visible = TRUE;
            [[SimpleAudioEngine sharedEngine] playEffect:@"JumpMusicMp3.mp3"];
            
            
            return;
        }
        
        if (nextBoatToGo == 4 && boat_3.position.x >= boat3_InitialX +100 && boat_2.position.x <= boat3_InitialX+150)
        {
            player.position = ccp(boat3_InitialX + 200, boat3_InitialY);
            [[SimpleAudioEngine sharedEngine] playEffect:@"JumpMusicMp3.mp3"];
            player.visible=TRUE;
            [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
            
            nextBoatToGo = -1;
            return;
        }
        
        [hud lifeItemsDelete:lifeCount];
        lifeCount--;
        if (lifeCount < 0) {
            lifeCount = 2;
            [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
            CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
            
        }
        [boat_1 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
        [boat_2 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
        [boat_3 setTexture:[[CCTextureCache sharedTextureCache] addImage:@"boat1.jpg"]];
        
        if (nextBoatToGo == -1) {
            
            player.position = ccp(player.position.x - 50, player.position.y);
            
        }
        else
        {
            
            player.position = ccp(player.position.x + 50, player.position.y);
        }
        player.visible = TRUE;
        nextBoatToGo = 1;
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"jumpFailed.mp3"];
        
        [self schedule:@selector(JumpFailed) interval:1 repeat:1 delay:1];
        return;
        
    }
    
    
    //    tileGid = [grenadeLayer tileGIDAt:tileCoord];
    //
    //    if (tileGid) {
    //
    //        NSDictionary *properties = [_tileMap propertiesForGID:tileGid];
    //
    //        if (properties) {
    //
    //            NSString *collision = properties[@"Collidable"];
    //            if (collision && [collision isEqualToString:@"True"] && powerGrenade!=1) {
    //                return;
    //            }
    //
    //            if (powerGrenade == 1) {
    //                //NSLog(@"Inside grenade %f %f",tileCoord.x,tileCoord.y);
    //                CCParticleFire * p = [[CCParticleFire alloc]initWithTotalParticles:500];
    //                [p autorelease];
    //                p.texture=[[CCTextureCache sharedTextureCache] addImage:@"fire.png"];
    //                p.autoRemoveOnFinish = YES;
    //                p.duration = 1;
    //                p.position=ccp(700,350);
    //                [self addChild:p];
    //                //[grenadeLayer removeFromParent];
    //                [grenadeLayer removeTileAt:tileCoord];
    //                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion-01.mp3"];
    //
    //            }
    //
    //        }
    //
    //    }
    
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"move.caf"];
    
    // tileGid = [riverLayer tileGIDAt:tileCoord];
    // if (!tileGid) {
    player.position = position;
    // }
}
- (void) JumpFailed
{
    player.position = ccp(boat1_InitialX - 50, boat1_InitialY + 200);
    player.visible = TRUE;
    
}

/*- (void) checkBonusStageIsReturned
 {
 if (b_hud.visible == NO && self.touchEnabled == NO) {
 bonusStageRunning = NO;
 [self ResumeGameAfterBonus];
 [self unschedule:@selector(checkBonusStageIsReturned)];
 }
 //NSLog(@"Checkbonus");
 
 
 }*/

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
    
    if( ( (CGRectIntersectsRect([monster5 boundingBox], [player boundingBox] ) || (CGRectIntersectsRect([planeMonster1 boundingBox], [player boundingBox]) && planeMonster1.visible==TRUE ) ||  (CGRectIntersectsRect([planeMonster2 boundingBox], [player boundingBox]) && planeMonster2.visible==TRUE ) || (CGRectIntersectsRect([planeMonster3 boundingBox], [player boundingBox]) && planeMonster3.visible==TRUE ) || (CGRectIntersectsRect([planeMonster4 boundingBox], [player boundingBox]) && planeMonster4.visible==TRUE ))&& totalTime - collideTime >= immuneDuration ))
        
    {
        if( immunePowerUp < 1)
        {
            
            collideTime = totalTime;
            CCBlink* blink = [CCBlink actionWithDuration:immuneDuration blinks:20];
            //lifeItem[lifeCount].visible = false;
            [hud lifeItemsDelete:lifeCount];
            lifeCount--;
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
            count = 0;
            if (lifeCount < 0) {
                lifeCount = 2;
                [[NSUserDefaults standardUserDefaults] setInteger:currentLevelScore+totalScore forKey:@"Score"];
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO withscoreValue:currentLevelScore timeBonus:0 playerImage:_playerimage];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
            }
            [player runAction:blink];
        }
    }
    
}

- (void)setViewPointCenter:(CGPoint) position {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    int x = MAX(position.x, winSize.width/2);
    int y = MAX(position.y, winSize.height/2);
    x = MIN(x, (_tileMap.mapSize.width * _tileMap.tileSize.width) - winSize.width / 2);
    y = MIN(y, (_tileMap.mapSize.height * _tileMap.tileSize.height) - winSize.height/2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}

// on "init" you need to initialize your instance
-(id) initWithPlayer:(BOOL)player1 timeBonus:(int) timeRemaining powerups:(int [])powerupArray playerSelected:(int [])playerSelectArray
{
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        self.touchEnabled = YES;
        isBonusDisplayed =  NO;
        _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"tileMap4-Level3.tmx"];
        
        snow = [_tileMap layerNamed:@"Snow"];
        _playerimage = player1;
        bonusStageRunning = NO;
        bonusRoundPlayed = NO;
        currentLevelScore = 0;
        randomPos = 0;
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
        riverLayer = [_tileMap layerNamed:@"River"];
        powerLivesLayer.visible = FALSE;
        
        
        //        CCWaves3D *try=[CCWaves3D actionWithWaves:5 amplitude:25.0
        //                                              grid:ccg(15,10) duration:5];
        //
        //        [player runAction:[CCRepeatForever actionWithAction: try]];
        
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
        
        //NSLog(@"powerup %d",[[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp1"]);
        /* Life Power Up */
        if(powerupArray[0]>=1 || ([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp1"] >=1))
        {
            // NSLog(@"life");
            //lifeItem[3].visible = true;
            [self schedule:@selector(shopPowerUpIncreaseLife) interval:0 repeat:0 delay:0];
            
        }
        
        CCRipple3D* ripple = [CCRipple3D  actionWithPosition: riverLayer.position radius:
                              riverLayer.contentSize.width  waves:15 amplitude:15 grid: ccg(40,40) duration:8.0];
        
        CCRepeatForever* repeat = [CCRepeatForever actionWithAction: ripple];
        [riverLayer runAction: repeat];
        
        CCParticleRain *p = [[CCParticleRain alloc]initWithTotalParticles:10000];
        [p autorelease];
        p.texture=[[CCTextureCache sharedTextureCache] addImage:@"snowImage.png"];
        p.autoRemoveOnFinish = YES;
        p.speed=100.0;
        p.duration = 1000;
        p.position=ccp(200,750);
        p.scaleX=2.0f;
        p.endSize=10.0f;
        p.startSize = 8.0f;
        [self addChild:p z:1];
        
        planeInitialX=220;
        planeShadowInitialX=planeInitialX+5;
        
        boat1_InitialX=875;
        boat1_InitialY=525;
        
        boat2_InitialX=1025;
        boat2_InitialY=475;
        
        boat3_InitialX=boat2_InitialX;
        boat3_InitialY=275;
        
        boat_1 = [CCSprite spriteWithFile:@"boat1.jpg"];
        boat_1.position = ccp(boat1_InitialX, boat1_InitialY);
        [self addChild:boat_1];
        //boat_1.visible=false;
        
        [self schedule:@selector(moveBoat1) interval:4 repeat:250 delay:0];
        
        boat_2 = [CCSprite spriteWithFile:@"boat1.jpg"];
        boat_2.position = ccp(boat2_InitialX, boat2_InitialY);
        [self addChild:boat_2];
        //boat_2.visible=false;
        
        [self schedule:@selector(moveBoat2) interval:4 repeat:250 delay:2];
        
        boat_3 = [CCSprite spriteWithFile:@"boat1.jpg"];
        boat_3.position = ccp(boat3_InitialX, boat3_InitialY);
        [self addChild:boat_3];
        //boat_3.visible=false;
        
        [self schedule:@selector(moveBoat3) interval:4 repeat:250 delay:0];
        
        planePointsLocation[2] = 1475;
        planePointsLocation[0] = planeInitialX+100;
        planePointsLocation[3] = 1725;
        planePointsLocation[1] = planeInitialX+100+100+100;
        
        planeMonster1 = [CCSprite spriteWithFile:@"ghosts.png"];
        planeMonster1.position = ccp(planePointsLocation[0], 475);
        [self addChild:planeMonster1];
        planeMonster1.visible=false;
        
        planeMonster2 = [CCSprite spriteWithFile:@"ghosts.png"];
        planeMonster2.position = ccp(planePointsLocation[1], winSize.height-400);
        [self addChild:planeMonster2];
        planeMonster2.visible=false;
        
        planeMonster3 = [CCSprite spriteWithFile:@"ghosts.png"];
        planeMonster3.position = ccp(planePointsLocation[2], 375);
        [self addChild:planeMonster3];
        planeMonster3.visible=false;
        
        planeMonster4 = [CCSprite spriteWithFile:@"ghosts.png"];
        planeMonster4.position = ccp(planePointsLocation[3], winSize.height-200);
        [self addChild:planeMonster4];
        planeMonster4.visible=false;
        
        plane = [CCSprite spriteWithFile:@"plane.png"];
        plane.scale = 1.0;
        plane.zOrder = 2;
        plane.position = ccp(planeInitialX , 745+5);
        [self addChild:plane];
        plane.visible=false;
        
        _planeShadow = [CCSprite spriteWithFile:@"plane_shadow.png"];
        _planeShadow.scale = 1.0;
        _planeShadow.zOrder = 1;
        _planeShadow.position = ccp(planeShadowInitialX,745);
        [self addChild:_planeShadow];
        _planeShadow.visible=false;
        
        [self schedule:@selector(movePlaneInitial) interval:40 repeat:100 delay:20];
        [self schedule:@selector(movePlaneShadowInitial) interval:40 repeat:100 delay:20];
        [self schedule:@selector(randomPlaneXPos) interval:39 repeat:100 delay:20];
        [self schedule:@selector(planeGetContPosition) interval:0];
        
        //player = [CCSprite spriteWithFile:@"FinalTwo_51x51x.png"] ;
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 1)
        {
            [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"NormalPlayer_40x40.png"]];
        }
        else if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 2){
            [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"HyperPlayer_40x40.png"]];
        }
        
        [self spawnPlayer];
        if(player == nil)
        {
            printf("this is an error");
        }
        [self addChild:player];
        [self setViewPointCenter:player.position];
        
        monster5 = [CCSprite spriteWithFile:@"bug_51x51.png"];
        monster5.position = ccp(winSize.width/3+435, winSize.height/2-10);
        [self addChild:monster5];
        // nemy = [CCSprite spriteWithFile:@"Icon-72.png"];
        screenSize2 = [CCDirector sharedDirector].winSize;
        
        // Standard method to pause the game
        /* starMenuItem = [CCMenuItemImage itemWithNormalImage:@"player_pause40x40.png" selectedImage:@"player_pause40x40.png" target:self selector:@selector(PauseResumeGame:)];
         
         //starMenuItem.position = ccp(870, 25);
         starMenuItem.position = ccp(22, 680);
         CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
         starMenu.position = CGPointZero;
         [self addChild:starMenu];*/
        
        /* Ghost Immune PowerUp */
        if(powerupArray[1]>=1 || ([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PowerUp2"] >=1))
        {
            
            shopPowerUp2 = [CCMenuItemImage itemWithNormalImage:@"powerUp_immuneGhost.png" selectedImage:@"powerUp_immuneGhost.png" target:self selector:@selector(GhostImmunePower:)];
            shopPowerUp2.position = ccp(22, 600-9*40);
            shopPowerUp2.visible = true;
            // [self addChild:shopPowerUp2];
            CCMenu *menu8 = [CCMenu menuWithItems: shopPowerUp2, nil];
            menu8.position=ccp(22, 600-9*40);
            [menu8 alignItemsVerticallyWithPadding:15];
            [self addChild:menu8];
        }
        
        /*for (int i=0; i<5; i++) {
         lifeItem[i] = [CCMenuItemImage itemWithNormalImage:@"life.png" selectedImage:@"life.png" ];
         //lifeItem[i].position = ccp(22, 600-i*40);
         lifeItem[i].position = ccp(winSize.width - 500, winSize.height/2-200i*40);
         lifeItem[i].visible = true;
         }
         lifeItem[3].visible = false;
         lifeItem[4].visible = false;*/
        
        //life = [CCMenu menuWithItems:lifeItem[0],lifeItem[1],lifeItem[2],lifeItem[3],lifeItem[4], nil];
        
        //life.position = CGPointZero;
        //[self addChild:life];
        
        [self schedule:@selector(checkCollisionWithMonster)];
        //[self schedule:@selector(moveSensingMonster) interval:1 ];
        // [self schedule:@selector(ShowBonuStageImage) ];
        
        myTime = 0;
        nextBoatToGo  = 1;
        
        c = 0;
        
        timeLabel = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:30];
        timeLabel.position = CGPointMake(winSize.width / 2+200, winSize.height);
        // Adjust the label's anchorPoint's y position to make it align with the top.
        timeLabel.anchorPoint = CGPointMake(0.5f, 1.0f);
        // Add the time label
        timeLabel.color=ccBLACK;
        [self addChild:timeLabel];
        
        //update
        
        // timeLabelBlue = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:40];
        // timeLabelBlue.position =ccp(200 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 46);
        // Adjust the label's anchorPoint's y position to make it align with the top.
        // timeLabelBlue.anchorPoint = CGPointMake(0.5f, 1.0f);
        
        //timeLabelBlue.color = ccBLACK;
        
        // Add the time label
        //timeLabelBlue.visible = FALSE;
        /*collideTime = 0;*/
        // PowerLabel = [CCSprite spriteWithFile:@"powerup12.png"];
        
        //  PowerLabel.position =ccp(120 + timeLabelBlue.contentSize.width, timeLabelBlue.contentSize.height/2 + 27);
        // PowerLabel.visible = FALSE;
        // [self addChild:PowerLabel];
        
        bubble = [CCSprite spriteWithFile:@"bubble4.png"];
        bubble.position = ccp(winSize.width - 420 , winSize.height - 340);
        [self addChild:bubble];
        bubble.visible = FALSE;
        
        bubble2 = [CCSprite spriteWithFile:@"bubble5.png"];
        bubble2.position = ccp(winSize.width/2 , winSize.height/2);
        [self addChild:bubble2];
        bubble.visible = FALSE;
        
        [self schedule:@selector(removeBubble2) interval:3 repeat:1 delay:5];
        
        bubble3 = [CCSprite spriteWithFile:@"bubble6.png"];
        bubble3.position = ccp(winSize.width - 550 , winSize.height - 530);
        [self addChild:bubble3];
        bubble3.visible = FALSE;
        
        //  [self addChild:timeLabelBlue];
        
        [self schedule:@selector(LevelTimer:)];
        
    }
    return self;
}

-(void)shopPowerUpIncreaseLife
{
    lifeCount++;
    [hud lifeItemsAdd:lifeCount];
}

-(void)randomPlaneXPos
{
    
    planeInitialX = planePointsLocation[randomPos];
    planeShadowInitialX = planePointsLocation[randomPos]+5;
    _planeShadow.position=ccp(planePointsLocation[randomPos]+5,745);
    plane.position=ccp(planePointsLocation[randomPos],745+5);
    _planeShadow.visible=false;
    plane.visible=false;
    randomPos++;
}

-(void) planeGetContPosition
{
    if(planeMoveFlag==true && plane.position.y>=40)
    {
        
        if( (CGRectIntersectsRect([planeMonster1 boundingBox], [plane boundingBox])) ||
           (CGRectIntersectsRect([planeMonster2 boundingBox], [plane boundingBox])) ||
           (CGRectIntersectsRect([planeMonster3 boundingBox], [plane boundingBox])) ||
           (CGRectIntersectsRect([planeMonster4 boundingBox], [plane boundingBox])) ||
           (CGRectIntersectsRect([planeMonster5 boundingBox], [plane boundingBox])) )
        {
            if((CGRectIntersectsRect([planeMonster1 boundingBox], [plane boundingBox])))
            {
                planeMonster1.visible=true;
                temp = planeMonster1;
                [self schedule:@selector(moveSensingMonster1) interval:1];
            }
            else if((CGRectIntersectsRect([planeMonster2 boundingBox], [plane boundingBox])))
            {
                planeMonster2.visible=true;
                temp = planeMonster2;
                [self schedule:@selector(moveSensingMonster2) interval:1];
            }
            else if((CGRectIntersectsRect([planeMonster3 boundingBox], [plane boundingBox])))
            {
                planeMonster3.visible=true;
                temp = planeMonster3;
                [self schedule:@selector(moveSensingMonster3) interval:1];
            }
            else if((CGRectIntersectsRect([planeMonster4 boundingBox], [plane boundingBox])))
            {
                planeMonster4.visible=true;
                temp = planeMonster4;
                [self schedule:@selector(moveSensingMonster4) interval:1];
            }
        }
        
        
        // NSLog(@"Plane pos: (%f,%f)",plane.position.x,plane.position.y);
    }
}

-(void) movePlaneInitial
{
    planeMoveFlag=true;
    [self schedule:@selector(movePlane) interval:0 repeat:1 delay:0];
    [self schedule:@selector(planeMovementFalse) interval:5 repeat:1 delay:0];
    //planeMoveFlag=false;
}

-(void)moveBoat1
{
    int realX = boat2_InitialX;
    CGPoint realDest = ccp(realX, boat1_InitialY);
    
    float realMoveDuration = 4;
    
    
    int realX_Initial = boat1_InitialX;
    CGPoint realDest1 = ccp(realX_Initial, boat1_InitialY);
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest];
    id actionMove1=[CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest1];
    //NSLog(@"Start Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
    //[[SimpleAudioEngine sharedEngine] playEffect:@"plane_sound.mp3"];
    [boat_1 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
    // NSLog(@"Last Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
}

-(void)moveBoat2
{
    int realY = boat3_InitialY+50;
    CGPoint realDest = ccp(boat2_InitialX, realY);
    
    float realMoveDuration = 4;
    
    int realY_Initial = boat2_InitialY;
    CGPoint realDest1 = ccp(boat2_InitialX, realY_Initial);
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest];
    id actionMove1=[CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest1];
    //NSLog(@"Start Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
    //[[SimpleAudioEngine sharedEngine] playEffect:@"plane_sound.mp3"];
    [boat_2 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
    // NSLog(@"Last Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
}

-(void)moveBoat3
{
    int realX = boat3_InitialX+150;
    CGPoint realDest = ccp(realX, boat3_InitialY);
    
    float realMoveDuration = 4;
    
    int realX_Initial = boat3_InitialX;
    CGPoint realDest1 = ccp(realX_Initial, boat3_InitialY);
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest];
    id actionMove1=[CCMoveTo actionWithDuration:realMoveDuration/2 position:realDest1];
    [boat_3 runAction:
     [CCSequence actions: actionMove,actionMove1,nil]];
    // NSLog(@"Last Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
}

-(void) planeMovementFalse
{
    planeMoveFlag=false;
}

-(void)movePlane{
    // CGSize winSize = [CCDirector sharedDirector].winSize;
    //int realX = winSize.width/3+435;
    int realY = 40;
    CGPoint realDest = ccp(planeInitialX, realY);
    
    float realMoveDuration = 30;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest];
    
    //NSLog(@"Start Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
    [[SimpleAudioEngine sharedEngine] playEffect:@"plane_sound.mp3"];
    plane.visible=true;
    [plane runAction:
     [CCSequence actions: actionMove,nil]];
    // NSLog(@"Last Plane Pos: (%f,%f)",plane.position.x,plane.position.y);
}

-(void) movePlaneShadowInitial
{
    planeMoveFlag=true;
    [self schedule:@selector(movePlaneShadow) interval:0 repeat:1 delay:0];
    //planeMoveFlag=false;
}

-(void)movePlaneShadow{
    //NSLog(@"one second");
    // CGSize winSize = [CCDirector sharedDirector].winSize;
    //int realX = winSize.width/3+435;
    
    int realY = 40;
    CGPoint realDest = ccp(planeShadowInitialX, realY);
    
    float realMoveDuration = 30;
    
    id actionMove = [CCMoveTo actionWithDuration:realMoveDuration/5 position:realDest];
    
    _planeShadow.visible=true;
    [_planeShadow runAction:
     [CCSequence actions: actionMove,nil]];
}

-(void) GhostImmunePower:(id)sender
{
    shopPowerUp2.visible=false;
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp2"];
    [self schedule:@selector(GhostImmunePowerTimer:) interval:1 repeat:1 delay:0];
    
    [self schedule:@selector(GhostImmunePowerTimerUp:) interval:11 repeat:1 delay:0];
}

-(void)GhostImmunePowerTimerUp:(ccTime)dt
{
    
    totalTimeImmune += dt;
    currentTimeImmune = (int)totalTimeImmune;
    NSLog(@"Time: %d %d",currentTimeImmune,myTimeImmune);
    
    immunePowerUp=0;
    CCFadeTo *fadeIn = [CCFadeTo actionWithDuration:0.25 opacity:0];
    CCFadeTo *fadeOut = [CCFadeTo actionWithDuration:0.75 opacity:255];
    
    CCSequence *pulseSequence = [CCSequence actionOne:fadeIn two:fadeOut];
    // CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
    [player runAction:pulseSequence];
    //CCBlink* blink = [CCBlink actionWithDuration:3 blinks:10];
    //[player runAction:blink];
    
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 1)
    {
        [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"NormalPlayer_40x40.png"]];
    }
    else if([[NSUserDefaults standardUserDefaults] integerForKey:@"Shop_PlayerImage"] == 2){
        [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"HyperPlayer_40x40.png"]];
    }
    
    if( (CGRectIntersectsRect([monster5 boundingBox], [player boundingBox]) && totalTime - collideTime >= immuneDuration ))
    {
        /*immunePowerUp = 1;
         [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
         [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"playerImmune.png"]];*/
    }
    
}
-(void)GhostImmunePowerTimer:(ccTime)dt
{
    
    totalTimeImmune += dt;
    currentTimeImmune = (int)totalTimeImmune;
    NSLog(@"Time: %d %d",currentTimeImmune,myTimeImmune);
    if (myTimeImmune < currentTimeImmune)
    {
        myTimeImmune = currentTimeImmune;
        
        //[timeLabelBlue setString:[NSString stringWithFormat:@" %02d:%02d", (powerLiveTimeLimit - myTimeImmune)/60, (powerLiveTimeLimit-myTimeImmune)%60]];
        immunePowerUp = 1;
        [[SimpleAudioEngine sharedEngine] playEffect:@"PowerUpMusic.mp3"];
        [player setTexture:[[CCTextureCache sharedTextureCache] addImage:@"playerImmune.png"]];
        CCBlink* blink = [CCBlink actionWithDuration:10 blinks:20];
        [player runAction:blink];
    }
}
/*
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
 }*/
-(void) MakeBubbleInvisible
{
    bubble.visible = FALSE;
}

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

/*
 -(void)ResumeGameAfterBonus
 {
 [[CCDirector sharedDirector] stopAnimation];
 [[CCDirector sharedDirector] resume];
 [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
 [[CCDirector sharedDirector] startAnimation];
 self.touchEnabled = YES;
 self.visible = YES;
 
 }
 */

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
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level3 scene:NO timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
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
