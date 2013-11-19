#import "HudLayer.h"

@implementation HudLayer
{
    CCLabelTTF *_label;
    CCLabelTTF *_livesLabel;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        NSString *score = [NSString stringWithFormat:@"Score : %d", [[NSUserDefaults standardUserDefaults] integerForKey:@"Score"]];
        _label = [CCLabelTTF labelWithString:score fontName:@"Verdana-Bold" fontSize:18.0];
        _label.color = ccc3(0,0,0);
        int margin = 10;
        _label.position = ccp(winSize.width/2 - (_label.contentSize.width/2) + 30, _label.contentSize.height/2 + margin);
        _livesLabel = [CCLabelTTF labelWithString:@"Lives" fontName:@"Verdana-Bold" fontSize:18.0];
        _livesLabel.color = ccc3(0,0,0);
        //_livesLabel.position = ccp(winSize.width - (_livesLabel.contentSize.width/2) - 480, _livesLabel.contentSize.height/2 + margin);
        _livesLabel.position = ccp(20, winSize.height/2 - 20);
        [self addChild:_label];
        //[self addChild:_livesLabel];
    }
    return self;
    
}

-(void)numCollectedChanged:(int)numCollected
{
    _label.string = [NSString stringWithFormat:@"Score : %d", numCollected];
}
@end
