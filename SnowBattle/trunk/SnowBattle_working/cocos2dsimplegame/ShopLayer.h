//
//  ShopLayer.h
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 11/5/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ShopLayer : CCLayerColor {
    Boolean player1;
    CCMenuItemImage *menuItem1;
    CCMenuItemImage *menuItem2;
    CCMenuItemImage *menuItem3;
    int remainingTimeBonus;
}

+(id) scene3:(int)timeBonus;
- (id)initW:(int)start;

@end
