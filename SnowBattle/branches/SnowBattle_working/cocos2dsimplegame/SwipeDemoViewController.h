//
//  SwipeDemoViewController.h
//  cocos2dsimplegame
//
//  Created by Student on 10/16/13.
//  Copyright (c) 2013 gpadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
# import <UIkit/UIkit.h>

@interface SwipeDemoViewController : UIViewController<UIGestureRecognizer>
{
    UIlabel *lblswipe;
}

@property(nonatomic,retain) IBOutlet UIlabel *lblswipe;
-(void)screenWasSwiped;

@end
