#import "GameStartLayer.h"
#import "HelloWorldLayer.h"
#import "LevelSelectLayer.h"
#import "PlayerSelectLayer.h"
#import "ShopLayer.h"

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
        
        CCParticleSnow * p = [[CCParticleSnow alloc]initWithTotalParticles:4000];
        [p autorelease];
        p.texture=[[CCTextureCache sharedTextureCache] addImage:@"snowImage.png"];
        p.autoRemoveOnFinish = YES;
        p.speed=30.0;
        p.duration = 1000;
        p.position=ccp(200,750);
        p.scaleX=2.0f;
        p.endSize=8.0f;
        [self addChild:p z:1];
        
        [CCMenuItemFont setFontName:@"chalkduster"];
        
        [CCMenuItemFont setFontSize:40];
            
        CCMenuItemFont *newGame = [CCMenuItemFont itemFromString:@"New Game"
                                                          target:self
                                                        selector:@selector(startGame:)];
        [newGame setColor:ccBLUE];
        CCMenuItemFont *shopNow = [CCMenuItemFont itemFromString:@"Go To Shop"
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
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[PlayerSelectLayer selectScene:YES]]];
}

-(void) shopNow: (id) sender {
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[ShopLayer scene3:0]]];
}

@end
