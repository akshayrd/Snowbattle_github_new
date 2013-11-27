#import "BonusStage.h"
#include "HelloWorldLayer_Level2.h"


@implementation BonusStage



+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    //HelloWorldLayer *layer = [HelloWorldLayer node];
    BonusStage *layer = [[BonusStage alloc] init];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    //HudLayer *hud = [HudLayer node];
    //[scene addChild:hud];
    //layer->hud = hud;
    
    
    
    return scene;
    
}

-(id) init
{
        
    
    if( (self=[super init]) ) {
        //[self setTouchEnabled:YES];
        //self.isTouchEnabled = YES;
        [CCMenuItemFont setFontName:@"Chalkduster"];
        [CCMenuItemFont setFontSize:38];
        
        CCMenuItemFont *selectPlayer = [CCMenuItemFont itemWithString:@"Go back to Level 2"
                                                               target:self
                                                             selector:@selector(startGameLevel2:)];
        selectPlayer.color=ccBLUE;
        CCMenu *menu2 = [CCMenu menuWithItems: selectPlayer, nil];
        menu2.position=ccp(550,200);
        [menu2 alignItemsVerticallyWithPadding:15];
        [self addChild:menu2];
        
        NSUserDefaults *userDafs = [NSUserDefaults standardUserDefaults];
        int test = [userDafs integerForKey:@"player"];
        NSLog(@"Bonus: %d", test);
        [userDafs removeObjectForKey:@"player"];
        

    }
    return self;
}


-(void) startGameLevel2:(id) sender{
    NSLog(@"222Heree");
    int powerupArray[3];
    powerupArray[0]=0;
    powerupArray[1]=0;
    powerupArray[2]=0;
    
    int playerSelectArray[3];
    playerSelectArray[0]=1;
    playerSelectArray[1]=0;
    playerSelectArray[2]=0;
    
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:YES timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
    
}
@end

