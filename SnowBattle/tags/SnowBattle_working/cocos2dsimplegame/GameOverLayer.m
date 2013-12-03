#import "GameOverLayer.h"
#import "HelloWorldLayer.h"
#import "HelloWorldLayer_Level2.h"
#import "ShopLayer.h"
#import "LevelSelectLayer.h"
#import "FacebookScorer.h"
#import "SimpleAudioEngine.h"

@implementation GameOverLayer
+(CCScene *) sceneWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining playerImage:(BOOL)playerimage{
    CCScene *scene = [CCScene node];
    
    GameOverLayer *layer = [[[GameOverLayer alloc] initWithWon:won withscoreValue:scoreValue
                                                     timeBonus:timeRemaining playerImage: playerimage] autorelease];
  //  layer.color = ccGRAY;
    [scene addChild: layer];
    //NSLog(@"score %d", scoreValue);
    return scene;
}

- (id)initWithWon:(BOOL)won withscoreValue:(int)scoreValue timeBonus:(int) timeRemaining playerImage:(BOOL)playerimage {
    if ((self = [super initWithColor:ccc4(255, 255, 255, 255)])) {
        CCSprite *bg =[CCSprite spriteWithFile:@"levelscreen_final.jpg"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        //[self addChild:bg z:0];
        
        _playerimage = playerimage;
        NSString * message;
        NSString * timeBonus;
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        shareOnFacebook = [CCMenuItemImage itemWithNormalImage:@"facebook_share.gif"
                                                 selectedImage:@"facebook_share.gif" target:self selector:@selector(shareOnFacebook:)];
        shareOnFacebook.tag=timeRemaining+scoreValue;
        CCMenu *menu20 = [CCMenu menuWithItems: shareOnFacebook, nil];
        menu20.position=ccp(winSize.width/2-200,60);
        [menu20 alignItemsVerticallyWithPadding:15];
        [self addChild:menu20];
        
        if (won) {
            message = @"Level Completed!";
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
            [[SimpleAudioEngine sharedEngine] playEffect:@"CoolWinningSound.mp3"];
            CCSprite *bg =[CCSprite spriteWithFile:@"GameWonPng.png"];
            bg.position=ccp(winSize.width/2,winSize.height/2-300);
            bg.anchorPoint = ccp(0, 0);
            [self addChild:bg z:0];
            
        } else {
            message = @"Game Over!";
            [[SimpleAudioEngine sharedEngine] playEffect:@"GameLstSound_Clipped.mp3"];
            timeBonus = [NSString stringWithFormat:@"Time Bonus: %d", timeRemaining];
            CCSprite *bg =[CCSprite spriteWithFile:@"GameLostPng.png"];
            bg.position=ccp(winSize.width/2,0);
            bg.anchorPoint = ccp(0, 0);
            [self addChild:bg z:0];
            
        }
        label4 = [CCLabelTTF labelWithString:@"Shop Now" fontName:@"Marker Felt" fontSize:32];
        label4.color = ccBLUE;
        CCMenuItemLabel *next_level = [CCMenuItemLabel itemWithLabel:label4  target:self selector:@selector(shopNow)];
        CCMenu *menu2= [CCMenu menuWithItems:next_level, nil];
        menu2.position = ccp(winSize.width/2-200 , winSize.height/2-250);
        [self addChild: menu2];
        
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
        
        
        label2 = [CCLabelTTF labelWithString:@"Select Level" fontName:@"Marker Felt" fontSize:32];
        label2.color = ccc3(0,0,0);
        CCMenuItemLabel *back = [CCMenuItemLabel itemWithLabel:label2  target:self selector:@selector(LevelSelector)];
        
        if (won){
            //label3 = [CCLabelTTF labelWithString:@"Go to Next Level" fontName:@"Marker Felt" fontSize:32];
            //label3.color = ccBLUE;
            //CCMenuItemLabel *next_level = [CCMenuItemLabel itemWithLabel:label3  target:self selector:@selector(nextLevel)];
            //CCMenu *menu1= [CCMenu menuWithItems:next_level, nil];
            //menu1.position = ccp(winSize.width/2-200 , winSize.height/2-250);
            //[self addChild: menu1];
        }
        CCMenu *menu= [CCMenu menuWithItems:back, nil];
        menu.position = ccp(winSize.width/2-200 , winSize.height/2-180);
        [self addChild: menu];
        timeBonus1=timeRemaining+scoreValue;

    }
    return self;
}

-(void) shareOnFacebook:(CCMenuItemImage *) sender
{
    [[[FacebookScorer sharedInstance] facebook] logout];
    [[FacebookScorer sharedInstance] postToWallWithDialogNewHighscore:(int)sender.tag];
    [[[FacebookScorer sharedInstance] facebook] logout];
    
}

-(void) LevelSelector {
    
    //[[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene:_playerimage]];
    [[CCDirector sharedDirector] replaceScene:[LevelSelectLayer firstScene:_playerimage ]];
}

-(void) nextLevel {
    int powerupArray[3];
    powerupArray[0]=0;
    powerupArray[1]=0;
    powerupArray[2]=0;
    
    int playerSelectArray[3];
    playerSelectArray[0]=1;
    playerSelectArray[1]=0;
    playerSelectArray[2]=0;
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:_playerimage timeBonus:0 powerups:powerupArray playerSelected:playerSelectArray]]];
}

-(void) shopNow {
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[ShopLayer scene3:timeBonus1]]];
}
@end