#import "GameStartLayer.h"
#import "HelloWorldLayer.h"
#import "LevelSelectLayer.h"
#import "PlayerSelectLayer.h"
#import "ShopLayer.h"
#import "SimpleAudioEngine.h"

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
            
        CCMenuItemFont *newGame = [CCMenuItemFont itemWithString:@"New Game"
                                                          target:self
                                                        selector:@selector(startGame:)];
        [newGame setColor:ccBLUE];
        CCMenuItemFont *shopNow = [CCMenuItemFont itemWithString:@"Go To Shop"
                                                          target:self
                                                        selector:@selector(shopNow:)];
        [shopNow setColor:ccBLUE];
        CCMenu *menu = [CCMenu menuWithItems: newGame,shopNow, nil];
        //CCMenu *menu = [CCMenu menuWithItems: newGame, nil];
        menu.position=ccp(680,120);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Score"];
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

-(void) shopNow: (id) sender {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp2"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp3"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"Shop_PlayerImage"];
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[ShopLayer scene3:0]]];
}

@end
