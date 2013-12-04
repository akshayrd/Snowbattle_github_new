#import "GameStartLayer.h"
#import "HelloWorldLayer.h"
#import "LevelSelectLayer.h"
#import "PlayerSelectLayer.h"
#import "ShopLayer.h"
#import "SimpleAudioEngine.h"
#import "StoryLineLayer.h"

@implementation GameStartLayer

+(id) firstScene:(BOOL)start{
    CCScene *firstScene = [CCScene node];
    GameStartLayer *layer =[[[GameStartLayer alloc] initW:start] autorelease];
    [firstScene addChild: layer];
    return firstScene;
}

-(id) initW:(BOOL)start
{
    if( (self=[super init] )) {
        CCSprite *bg =[CCSprite spriteWithFile:@"POSTER_1.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"GameSound.mp3"];
        
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
        
        [CCMenuItemFont setFontName:@"chalkduster"];
        
        [CCMenuItemFont setFontSize:40];
        
        CCMenuItemImage *newGame = [CCMenuItemImage itemWithNormalImage:@"PLAY1.png"
                                           selectedImage:@"PLAY1.png" target:self
                                                selector:@selector(startGame:)];
        /*CCMenuItemFont *newGame = [CCMenuItemFont itemWithString:@"New Game"
                                                          target:self
                                                        selector:@selector(startGame:)];*/
        //[newGame setColor:ccBLUE];
        
        NSString *labelString = @"•";
        CCMenuItemFont *bulletLabel = [CCMenuItemFont itemWithString:labelString];
        //CCLabelTTF *bulletLabel = [CCLabelTTF labelWithString:labelString];
        bulletLabel.color=ccBLUE;
        //[bulletLabel setString:labelString];
        //[self addChild:bulletLabel];
        
        CCMenuItemImage *instructions = [CCMenuItemImage itemWithNormalImage:@"Instructions.png"
                                                               selectedImage:@"Instructions.png" target:self
                                                                    selector:@selector(instructions:)];
        /*CCMenuItemFont *instructions = [CCMenuItemFont itemWithString:@"Instructions"
                                                          target:self
                                                        selector:@selector(instructions:)];*/
        //[instructions setColor:ccBLUE];
        CCMenuItemFont *bulletLabel2 = [CCMenuItemFont itemWithString:labelString];
        //CCLabelTTF *bulletLabel = [CCLabelTTF labelWithString:labelString];
        bulletLabel2.color=ccBLUE;
        //[bulletLabel setString:labelString];
        //[self addChild:bulletLabel2];
        
        CCMenuItemImage *shopNow = [CCMenuItemImage itemWithNormalImage:@"Shop.png"
                                                               selectedImage:@"Shop.png" target:self
                                                                    selector:@selector(shopNow:)];
        
        /*CCMenuItemFont *shopNow = [CCMenuItemFont itemWithString:@"Shop Now"
                                                          target:self
                                                        selector:@selector(shopNow:)];*/
        //[shopNow setColor:ccBLUE];
        CCMenuItemFont *bulletLabel3 = [CCMenuItemFont itemWithString:labelString];
        //CCLabelTTF *bulletLabel = [CCLabelTTF labelWithString:labelString];
        bulletLabel3.color=ccBLUE;
        //[bulletLabel setString:labelString];
        //[self addChild:bulletLabel3];
        
        /*CCMenu *menu1 = [CCMenu menuWithItems: bulletLabel,bulletLabel2,bulletLabel3, nil];
        //CCMenu *menu = [CCMenu menuWithItems: newGame, nil];
        menu1.position=ccp(520,120);
        [menu1 alignItemsVerticallyWithPadding:15];
        [self addChild:menu1];*/
        
        CCMenu *menu = [CCMenu menuWithItems: newGame,instructions,shopNow, nil];
        //CCMenu *menu = [CCMenu menuWithItems: newGame, nil];
        menu.position=ccp(680,100);
        [menu alignItemsVerticallyWithPadding:-20];
        [self addChild:menu];
        [[NSUserDefaults standardUserDefaults] setInteger:60 forKey:@"Score"];
    }
    return self;
}

-(void) startGame: (id) sender {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp2"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp3"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"Shop_PlayerImage"];
    
//    [[CCDirector sharedDirector]
//     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[PlayerSelectLayer selectScene:YES]]];

    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:NO ]]];
    
    
}

-(void) instructions: (id) sender {
    CCSprite *bg =[CCSprite spriteWithFile:@"Instructions_1024x768.png"];
    bg.position=ccp(0,0);
    bg.anchorPoint = ccp(0, 0);
    [self addChild:bg z:0];
    
    CCMenuItemImage *selectLevel = [CCMenuItemImage itemWithNormalImage:@"GreenArrow_100x200.png"
                                       selectedImage:@"GreenArrow_100x200.png"
                                          target:self
                                        selector:@selector(goBack:)];
    //selectLevel.color=ccBLUE;
    //selectLevel.visible=false;
    CCMenu *menu2 = [CCMenu menuWithItems: selectLevel, nil];
    menu2.position=ccp(450,90);
    [menu2 alignItemsVerticallyWithPadding:15];
    [self addChild:menu2 z:1];
}

-(void) shopNow: (id) sender {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp2"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp3"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"Shop_PlayerImage"];
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[ShopLayer scene3:0]]];
}

-(void) goBack: (id) sender {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES] ]];
}

-(void) storyLine: (id) sender {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StoryLineLayer scene] ]];
}

@end
