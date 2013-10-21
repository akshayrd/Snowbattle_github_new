#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameOverLayer : CCLayerColor {
    CCLabelTTF *label2;
}

+(CCScene *) sceneWithWon:(BOOL)won withscoreValue:(int)scoreValue;
- (id)initWithWon:(BOOL)won withscoreValue:(int)scoreValue;

@end