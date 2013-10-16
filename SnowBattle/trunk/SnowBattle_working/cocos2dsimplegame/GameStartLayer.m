#import "GameStartLayer.h"
#import "HelloWorldLayer.h"
#import "LevelSelectLayer.h"

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
        CCSprite *bg =[CCSprite spriteWithFile:@"POSTER.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        
        [CCMenuItemFont setFontName:@"Courier New"];
        [CCMenuItemFont setFontSize:28];
        
        CCMenuItemFont *newGame = [CCMenuItemFont itemFromString:@"New Game"
                                                          target:self
                                                        selector:@selector(startGame:)];
        [newGame setColor:ccBLUE];
        CCMenu *menu = [CCMenu menuWithItems: newGame, nil];
        menu.position=ccp(440,300);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
    }
    return self;
}

-(void) startGame: (id) sender {
<<<<<<< HEAD
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer scene]]];
=======
[[CCDirector sharedDirector]
 replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:YES]]];
>>>>>>> d6c7a5e57a7a7ab26f916787d637a167283988a7
}

@end
