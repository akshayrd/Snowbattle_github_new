#import "StoryLineLayer.h"
#import "LevelSelectLayer.h"
#import "GameStartLayer.h"
#import "SimpleAudioEngine.h"

@implementation StoryLineLayer

+(id) scene{
    CCScene *scene = [CCScene node];
    StoryLineLayer *layer =[[[StoryLineLayer alloc] init] autorelease];
    [scene addChild: layer];
    return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"GameSound.mp3"];
        CCSprite *bg =[CCSprite spriteWithFile:@"StoryBackground.png"];
        bg.position=ccp(0,0);
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"GameSound.mp3"];
        
        NSString *story = @"After global glaciation, Earth has now become a gloomy world, despaired and deprived of resources. Mighty extraterrestrial powers have captured the earth & so called 'intelligent' sapiens are totally under their control!\n\nBut yes, there's someone, a TROJAN! A savior who is believed to be the most intrepid, courageous and skillful among all. The same trojan who destroyed the tyranny of Bruins is now on mission to liberate earth! The battle is strenuous, soldiery of enemies are brutal but…..\n\nThe ambitious trojan, is taught just one thing…\n\nFIGHT ON!!!";
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCLabelTTF *label = [[CCLabelTTF alloc] initWithString:story dimensions:CGSizeMake(500,1000) alignment:UITextAlignmentCenter fontName:@"verdana-bold" fontSize:30.0f];
        
        label.position=ccp(3*winSize.width/4-30,-winSize.height/2);
        
        label.color = ccc3(0,0,0);        
        
        [self addChild:label];
        
        int rangeDuration = 30;
        //int rangeDuration = 3;
        
        id actionMove = [CCMoveTo actionWithDuration:rangeDuration position:ccp(3*winSize.width/4-30,winSize.height*2)];
        
        
        
        [label runAction:[CCSequence actions:actionMove, nil]];
        
        [self schedule:@selector(gameScreen) interval:23];
        //[self schedule:@selector(gameScreen) interval:2];
    }
    return self;
}

-(void) gameScreen
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameStartLayer firstScene:YES] ]];
}
@end
