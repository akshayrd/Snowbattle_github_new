#import "GameOverLayer.h"
#import "HelloWorldLayer.h"

@implementation GameOverLayer

+(CCScene *) sceneWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining{
    CCScene *scene = [CCScene node];
    
    GameOverLayer *layer = [[[GameOverLayer alloc] initWithWon:won withscoreValue:scoreValue
                                                     timeBonus:timeRemaining] autorelease];
  //  layer.color = ccGRAY;
    [scene addChild: layer];
    //NSLog(@"score %d", scoreValue);
    return scene;
}

- (id)initWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining {
    if ((self = [super initWithColor:ccc4(255, 255, 255, 255)])) {
        
        CCSprite *bg =[CCSprite spriteWithFile:@"levelscreen_final.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        //[self addChild:bg z:0];
        
        NSString * message;
        NSString * timeBonus;
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        if (won) {
            message = @"Level Completed!";
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
            CCSprite *bg =[CCSprite spriteWithFile:@"GameWonPng.png"];
            bg.position=ccp(winSize.width/2,winSize.height/2-300);
            bg.anchorPoint = ccp(0, 0);
            [self addChild:bg z:0];
        } else {
            message = @"Game Over!";
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
            CCSprite *bg =[CCSprite spriteWithFile:@"GameLostPng.png"];
            bg.position=ccp(winSize.width/2,0);
            bg.anchorPoint = ccp(0, 0);
            [self addChild:bg z:0];
        }
        
        NSString * yourScore = [NSString stringWithFormat:@"Your Score : %d", scoreValue];


        //[self setColor:ccRED];
        CCLabelTTF * label = [CCLabelTTF labelWithString:message fontName:@"Chalkduster" fontSize:40];

        label.color = ccRED;
        //label.color = ccc3(0,0,0);
        label.position = ccp(winSize.width/2-200, winSize.height/2 + 140);
        [self addChild:label];
        
        CCLabelTTF * labelScore = [CCLabelTTF labelWithString:yourScore fontName:@"Arial" fontSize:32];
        
        labelScore.color = ccc3(0,0,0);
        labelScore.position = ccp(winSize.width/2-200, winSize.height/2 );
        [self addChild:labelScore];
        
        CCLabelTTF * labelTimeBonus = [CCLabelTTF labelWithString:timeBonus fontName:@"Arial" fontSize:32];
        labelTimeBonus.color = ccc3(0,0,0);
        labelTimeBonus.position = ccp(winSize.width/2-200, winSize.height/2 + 70);
        [self addChild:labelTimeBonus];
        
        
        CCLabelTTF * labelTotal = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Total Score: %d", timeRemaining+scoreValue] fontName:@"Arial" fontSize:32];
        labelTotal.color = ccc3(0,0,0);
        labelTotal.position = ccp(winSize.width/2-200, winSize.height/2-70);
        [self addChild:labelTotal];
        
        
        label2 = [CCLabelTTF labelWithString:@"Restart" fontName:@"Marker Felt" fontSize:32];
        label2.color = ccc3(0,0,0);
        CCMenuItemLabel *back = [CCMenuItemLabel itemWithLabel:label2  target:self selector:@selector(restart)];
        
        
        CCMenu *menu= [CCMenu menuWithItems:back, nil];
        menu.position = ccp(winSize.width/2-200 , winSize.height/2-240);
        [self addChild: menu];

    }
    return self;
}

-(void) restart {
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

@end