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
        //_livesLabel = [CCLabelTTF labelWithString:@"Lives" fontName:@"Verdana-Bold" fontSize:18.0];
        //_livesLabel.color = ccc3(0,0,0);
        //_livesLabel.position = ccp(winSize.width - (_livesLabel.contentSize.width/2) - 480, _livesLabel.contentSize.height/2 + margin);
        //_livesLabel.position = ccp(winSize.width/2 - 2, winSize.height/2 - 20);
        [self addChild:_label];
        
        for (int i=0; i<5; i++) {
            lifeItem[i] = [CCMenuItemImage itemWithNormalImage:@"life.png" selectedImage:@"life.png" ];
            //lifeItem[i].position = ccp(22, 600-i*40);
            lifeItem[i].position = ccp(500 + i*40, 740);
            lifeItem[i].visible = true;
        }
        lifeItem[3].visible = false;
        lifeItem[4].visible = false;
        
        life = [CCMenu menuWithItems:lifeItem[0],lifeItem[1],lifeItem[2],lifeItem[3],lifeItem[4], nil];
        
        life.position = CGPointZero;
        [self addChild:life];
        //[self addChild:_livesLabel];
    }
    return self;
    
}

-(void) lifeItemsAdd:(int)lifeCount
{
    lifeItem[lifeCount].visible=true;
}

-(void) lifeItemsDelete:(int)lifeCount
{
    lifeItem[lifeCount].visible=false;
}

-(void)numCollectedChanged:(int)numCollected
{
    _label.string = [NSString stringWithFormat:@"Score : %d", numCollected];
}
@end
