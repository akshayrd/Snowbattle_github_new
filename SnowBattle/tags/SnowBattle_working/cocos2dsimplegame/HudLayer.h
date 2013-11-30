//
//  HudLayerClass.h
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 11/13/13.
//  Copyright 2013 gpadmin. All rights reserved.
//
#pragma once
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HudLayer : CCLayer
{
    CCMenuItem *lifeItem[5];
    CCMenu *life;
    //int lifeCount;
}

- (void)numCollectedChanged:(int)numCollected;
-(void) lifeItemsAdd:(int)lifeCount;
-(void) lifeItemsDelete:(int)lifeCount;

@end

