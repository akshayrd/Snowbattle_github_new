#import "GameOverLayer.h"
#import "HelloWorldLayer.h"

@implementation GameOverLayer

+(CCScene *) sceneWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining{
    CCScene *scene = [CCScene node];
    GameOverLayer *layer = [[[GameOverLayer alloc] initWithWon:won withscoreValue:scoreValue
                                                     timeBonus:timeRemaining] autorelease];
    [scene addChild: layer];
    //NSLog(@"score %d", scoreValue);
    return scene;
}

- (id)initWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining {
    if ((self = [super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        NSString * message;
        NSString * timeBonus;
        if (won) {
            message = @"You Won!";
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
        } else {
            message = @"You Lose :[";
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
        }
        
        NSString * yourScore = [NSString stringWithFormat:@"Your Score : %d", scoreValue];


        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCLabelTTF * label = [CCLabelTTF labelWithString:message fontName:@"Arial" fontSize:32];

        label.color = ccc3(0,0,0);
        label.position = ccp(winSize.width/2, winSize.height/2 + 140);
        [self addChild:label];
        
        CCLabelTTF * labelScore = [CCLabelTTF labelWithString:yourScore fontName:@"Arial" fontSize:32];
        
        labelScore.color = ccc3(0,0,0);
        labelScore.position = ccp(winSize.width/2, winSize.height/2 );
        [self addChild:labelScore];
        
        CCLabelTTF * labelTimeBonus = [CCLabelTTF labelWithString:timeBonus fontName:@"Arial" fontSize:32];
        labelTimeBonus.color = ccc3(0,0,0);
        labelTimeBonus.position = ccp(winSize.width/2, winSize.height/2 + 70);
        [self addChild:labelTimeBonus];
        
        
        CCLabelTTF * labelTotal = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Total Score: %d", timeRemaining+scoreValue] fontName:@"Arial" fontSize:32];
        labelTotal.color = ccc3(0,0,0);
        labelTotal.position = ccp(winSize.width/2, winSize.height/2-70);
        [self addChild:labelTotal];
        
        
        label2 = [CCLabelTTF labelWithString:@"Restart" fontName:@"Marker Felt" fontSize:32];
        label2.color = ccc3(0,0,0);
        CCMenuItemLabel *back = [CCMenuItemLabel itemWithLabel:label2  target:self selector:@selector(restart)];
        CCMenu *menu= [CCMenu menuWithItems:back, nil];
        menu.position = ccp(winSize.width/2 , winSize.height/2-140);
        [self addChild: menu];

    }
    return self;
}

-(void) restart {
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

@end