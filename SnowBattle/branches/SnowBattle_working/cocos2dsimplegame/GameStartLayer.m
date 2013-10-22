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
        CCSprite *bg =[CCSprite spriteWithFile:@"POSTER_1.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        
        [CCMenuItemFont setFontName:@"chalkduster"];
        
        [CCMenuItemFont setFontSize:50];
        
        
        CCMenuItemFont *newGame = [CCMenuItemFont itemFromString:@"New Game"
                                                          target:self
                                                        selector:@selector(startGame:)];
        [newGame setColor:ccBLUE];
        CCMenu *menu = [CCMenu menuWithItems: newGame, nil];
        menu.position=ccp(680,170);
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
    }
    return self;
}

-(void) startGame: (id) sender {
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:YES]]];
}

@end
