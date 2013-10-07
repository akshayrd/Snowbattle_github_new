#import "GameOverLayer.h"
#import "HelloWorldLayer.h"

@implementation GameOverLayer

+(CCScene *) sceneWithWon:(BOOL)won withscoreValue:(int)scoreValue{
    CCScene *scene = [CCScene node];
    GameOverLayer *layer = [[[GameOverLayer alloc] initWithWon:won withscoreValue:scoreValue] autorelease];
    [scene addChild: layer];
    //NSLog(@"score %d", scoreValue);
    return scene;
}

- (id)initWithWon:(BOOL)won withscoreValue:(int)scoreValue {
    if ((self = [super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        NSString * message;
        if (won) {
            message = @"You Won!";
        } else {
            message = @"You Lose :[";
        }
        
        NSString * yourScore = [NSString stringWithFormat:@"Your Score : %d", scoreValue];


        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCLabelTTF * label = [CCLabelTTF labelWithString:message fontName:@"Arial" fontSize:32];
        
        label.color = ccc3(0,0,0);
        label.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:label];
        
        CCLabelTTF * labelScore = [CCLabelTTF labelWithString:yourScore fontName:@"Arial" fontSize:32];
        
        labelScore.color = ccc3(0,0,0);
        labelScore.position = ccp(winSize.width/2, winSize.height/2 - 70);
        [self addChild:labelScore];
        
        label2 = [CCLabelTTF labelWithString:@"Restart" fontName:@"Marker Felt" fontSize:32];
        label2.color = ccc3(0,0,0);
        CCMenuItemLabel *back = [CCMenuItemLabel itemWithLabel:label2  target:self selector:@selector(restart)];
        CCMenu *menu= [CCMenu menuWithItems:back, nil];
        menu.position = ccp(winSize.width/2 , winSize.height/2-140);
        [self addChild: menu];
//        [self runAction:
//         [CCSequence actions:
//          [CCDelayTime actionWithDuration:5],
//          [CCCallBlockN actionWithBlock:^(CCNode *node) {
//             [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
//         }],
//          nil]];
    }
    return self;
}

-(void) restart {
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

@end