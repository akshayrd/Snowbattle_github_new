#import "HudLayer.h"
#import "SimpleAudioEngine.h"
#import "LevelSelectLayer.h"
#import "HelloWorldLayer_Level3.h"

@implementation HudLayer
{
    CCLabelTTF *_label;
    CCLabelTTF *_livesLabel;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        NSString *score = [NSString stringWithFormat:@"Score : %d", [[NSUserDefaults standardUserDefaults] integerForKey:@"Score"]];
        _label = [CCLabelTTF labelWithString:score fontName:@"Verdana-Bold" fontSize:18.0];
        _label.color = ccc3(0,0,0);
        int margin = 10;
        _label.position = ccp(winSize.width/2 - (_label.contentSize.width/2) + 30, _label.contentSize.height/2 + margin);
        [self addChild:_label];
        
        
        // Standard method to pause the game
        starMenuItem = [CCMenuItemImage itemWithNormalImage:@"pause_2.png" selectedImage:@"pause_2.png" target:self selector:@selector(PauseResumeGame:)];
        
        //starMenuItem.position = ccp(870, 25);
        starMenuItem.position = ccp(800, 740);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        for (int i=0; i<5; i++) {
            lifeItem[i] = [CCMenuItemImage itemWithNormalImage:@"life.png" selectedImage:@"life.png" ];
            //lifeItem[i].position = ccp(22, 600-i*40);
            lifeItem[i].position = ccp(500 + i*40, 740);
            lifeItem[i].visible = true;
        }
        lifeItem[3].visible = false;
        lifeItem[4].visible = false;
        
        life = [CCMenu menuWithItems:lifeItem[0],lifeItem[1],lifeItem[2],lifeItem[3],lifeItem[4], nil];
        
        life.position = CGPointZero;
        [self addChild:life];
        //[self addChild:_livesLabel];
    }
    return self;
    
}

-(void) lifeItemsDelete:(int)lifeCount
{
    //NSLog(@"Life delete: ");
    lifeItem[lifeCount].visible=false;
}

-(void) lifeItemsAdd:(int)lifeCount
{
    //  NSLog(@"COUNtsss %d ",lifeCount);
    lifeItem[lifeCount].visible=true;
}

-(void)numCollectedChanged:(int)numCollected
{
    totalScore=numCollected;
    _label.string = [NSString stringWithFormat:@"Score : %d", numCollected];
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
