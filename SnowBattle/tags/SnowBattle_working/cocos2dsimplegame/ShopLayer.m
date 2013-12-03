//
//  ShopLayer.m
//  cocos2dsimplegame
//
//  Created by Akshay Dani on 11/5/13.
//  Copyright 2013 gpadmin. All rights reserved.
//

#import "ShopLayer.h"
#import "HelloWorldLayer_Level2.h"
#import "LevelSelectLayer.h"
#import "SimpleAudioEngine.h"

@implementation ShopLayer

+(id) scene3:(int)timeBonus{
    CCScene *scene3 = [CCScene node];
    ShopLayer *layer =[[[ShopLayer alloc] initW:timeBonus] autorelease];
    [scene3 addChild: layer];
    return scene3;
}


-(id) initW:(int)timeBonus
{
    if( (self=[super init] )) {
        /*CCSprite *bg =[CCSprite spriteWithFile:@"shop1.png"];
         bg.position=ccp(0,0);
         bg.anchorPoint = ccp(0, 0);
         [self addChild:bg z:0];*/
        
        powerUpXPos=900;
        powerUpYPos=650;
        
        playerSelectXPos=800;
        playerSelectYPos=600;
        
        powerup1=0;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp1"];
        powerup2=0;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp2"];
        playerCount=0;
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Shop_PowerUp3"];
        player1 = false;
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"Shop_PlayerImage"];
        player2=false;
        player3=false;
        int powerup1Cost=10;
        int powerup2Cost=20;
        int powerup3Cost=30;
        int player2cost=500;
        //int player3cost=700;
        
        remainingTimeBonus=timeBonus;
        
        [CCMenuItemFont setFontName:@"Chalkduster"];
        [CCMenuItemFont setFontSize:38];
        CCMenuItemFont *bonusPointsLabel = [CCMenuItemFont itemWithString:@"POINTS EARNED:"];
        bonusPointsLabel.color=ccBLUE;
        CCMenu *menu5 = [CCMenu menuWithItems: bonusPointsLabel, nil];
        menu5.position=ccp(200,700);
        [menu5 alignItemsVerticallyWithPadding:15];
        [self addChild:menu5];
        
        label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", timeBonus]  fontName:@"Chalkduster" fontSize:40];
        label1.color = ccRED;
        //label.color = ccc3(0,0,0);
        label1.position = ccp(200, 600);
        [self addChild:label1];
        
        CCMenuItemFont *powerupLabel = [CCMenuItemFont itemWithString:@"Powerup Select"];
        powerupLabel.color=ccWHITE;
        CCMenu *menu9 = [CCMenu menuWithItems: powerupLabel, nil];
        menu9.position=ccp(200,300);
        [menu9 alignItemsVerticallyWithPadding:15];
        [self addChild:menu9];
        
        menuItem3 = [CCMenuItemImage itemWithNormalImage:@"shop2.png"
                                           selectedImage:@"shop2.png"];
        //menuItem1.position=ccp(300,300);
        CCMenu *menu3 = [CCMenu menuWithItems: menuItem3, nil];
        menu3.position=ccp(500,500);
        [menu3 alignItemsVerticallyWithPadding:15];
        [self addChild:menu3];
        
        
        menuItem1 = [CCMenuItemImage itemWithNormalImage:@"life.png"
                                           selectedImage:@"life.png"
                                            disabledImage:@"locked.png" 
                                                  target:self selector:@selector(addToCartPowerUp:)];
        
        //menuItem1.position=ccp(300,300);
        
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"1"];
        powerupList[1]=[NSString stringWithFormat:@"%d", powerup1Cost];
        if(remainingTimeBonus<powerup1Cost)
        {
            [menuItem1 setIsEnabled:NO];
        }
        powerupList[2]=[NSString stringWithFormat:@"life.png"];
        menuItem1.userData=powerupList;
        CCMenu *menu = [CCMenu menuWithItems: menuItem1, nil];
        menu.position=ccp(150,250);
        
        [menu alignItemsVerticallyWithPadding:15];
        [self addChild:menu];
        
        CCMenuItemFont *lifePower = [CCMenuItemFont itemWithString:[NSString stringWithFormat:@"%d", powerup1Cost] target:self selector:@selector(addToCartPowerUp:)];
        lifePower.userData=powerupList;
        lifePower.color=ccORANGE;
        CCMenu *menu4 = [CCMenu menuWithItems: lifePower, nil];
        menu4.position=ccp(250,250);
        [menu4 alignItemsVerticallyWithPadding:15];
        [self addChild:menu4];
        
        menuItem6 = [CCMenuItemImage itemWithNormalImage:@"powerUp_immuneGhost.png"
                                           selectedImage:@"powerUp_immuneGhost.png"
                                            disabledImage:@"locked.png" 
                                                  target:self selector:@selector(addToCartPowerUp:)];
        //menuItem1.position=ccp(300,300);
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"2"];
        powerupList[1]=[NSString stringWithFormat:@"%d", powerup2Cost];
        if(remainingTimeBonus<powerup2Cost)
        {
            [menuItem6 setIsEnabled:NO];
        }
        powerupList[2]=[NSString stringWithFormat:@"powerUp_immuneGhost.png"];
        menuItem6.userData=powerupList;
        CCMenu *menu15 = [CCMenu menuWithItems: menuItem6, nil];
        menu15.position=ccp(150,200);
        [menu15 alignItemsVerticallyWithPadding:15];
        [self addChild:menu15];
        
        CCMenuItemFont *immunePower = [CCMenuItemFont itemWithString:[NSString stringWithFormat:@"%d", powerup2Cost] target:self selector:@selector(addToCartPowerUp:)];
        immunePower.userData=powerupList;
        immunePower.color=ccORANGE;
        CCMenu *menu14 = [CCMenu menuWithItems: immunePower, nil];
        menu14.position=ccp(250,200);
        [menu14 alignItemsVerticallyWithPadding:15];
        [self addChild:menu14];
        
        
        menuItem2 = [CCMenuItemImage itemWithNormalImage:@"NoMoreGhostPowerUp_45x45.png"
                                           selectedImage:@"NoMoreGhostPowerUp_45x45.png"
                                            disabledImage:@"locked.png" 
                                                  target:self selector:@selector(addToCartPowerUp:)];
        //menuItem2.position=ccp(800,300);
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"3"];
        powerupList[1]=[NSString stringWithFormat:@"%d", powerup3Cost];
        if(remainingTimeBonus<powerup3Cost)
        {
            [menuItem2 setIsEnabled:NO];
        }
        powerupList[2]=[NSString stringWithFormat:@"NoMoreGhostPowerUp_45x45.png"];
        menuItem2.userData=powerupList;
        CCMenu *menu1 = [CCMenu menuWithItems: menuItem2, nil];
        menu1.position=ccp(150,150);
        [menu1 alignItemsVerticallyWithPadding:15];
        [self addChild:menu1];
        
        CCMenuItemFont *bluePower = [CCMenuItemFont itemWithString:[NSString stringWithFormat:@"%d", powerup3Cost] target:self selector:@selector(addToCartPowerUp:)];
        bluePower.userData=powerupList;
        
        bluePower.color=ccORANGE;
        CCMenu *menu6 = [CCMenu menuWithItems: bluePower, nil];
        menu6.position=ccp(250,150);
        [menu6 alignItemsVerticallyWithPadding:15];
        [self addChild:menu6];
        
        CCMenuItemFont *playerSelectLabel = [CCMenuItemFont itemWithString:@"Player Select"];
        playerSelectLabel.color=ccWHITE;
        CCMenu *menu8 = [CCMenu menuWithItems: playerSelectLabel, nil];
        menu8.position=ccp(750,300);
        [menu8 alignItemsVerticallyWithPadding:15];
        [self addChild:menu8];
        
        menuItem4 = [CCMenuItemImage itemWithNormalImage:@"NormalPlayer_150x150.png"
                                           selectedImage:@"NormalPlayer_150x150.png"
                                                  target:self selector:@selector(addToCartPlayer:)];
        //menuItem2.position=ccp(800,300);
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"1"];
        powerupList[1]=[NSString stringWithFormat:@"0"];
        powerupList[2]=[NSString stringWithFormat:@"NormalPlayer_150x150.png"];
        menuItem4.userData=powerupList;
        CCMenu *menu10 = [CCMenu menuWithItems: menuItem4, nil];
        menu10.position=ccp(700,210);
        [menu10 alignItemsVerticallyWithPadding:15];
        [self addChild:menu10];
        
        CCMenuItemFont *player1Points = [CCMenuItemFont itemWithString:@"0"];
        player1Points.color=ccORANGE;
        CCMenu *menu12 = [CCMenu menuWithItems: player1Points, nil];
        menu12.position=ccp(700,110);
        [menu12 alignItemsVerticallyWithPadding:15];
        [self addChild:menu12];
        
        menuItem5 = [CCMenuItemImage itemWithNormalImage:@"player2.png"
                                           selectedImage:@"player2.png"
                                            disabledImage:@"big_lock.png" 
                                                  target:self selector:@selector(addToCartPlayer:)];
        //menuItem2.position=ccp(800,300);
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"2"];
        powerupList[1]=[NSString stringWithFormat:@"%d", player2cost];
        if(remainingTimeBonus<player2cost)
        {
            [menuItem5 setIsEnabled:NO];
        }
        powerupList[2]=[NSString stringWithFormat:@"player2.png"];
        menuItem5.userData=powerupList;
        CCMenu *menu11 = [CCMenu menuWithItems: menuItem5, nil];
        menu11.position=ccp(900,210);
        [menu11 alignItemsVerticallyWithPadding:15];
        [self addChild:menu11];
        
        CCMenuItemFont *player2Points = [CCMenuItemFont itemWithString:[NSString stringWithFormat:@"%d", player2cost]];
        player2Points.color=ccORANGE;
        CCMenu *menu13 = [CCMenu menuWithItems: player2Points, nil];
        menu13.position=ccp(880,110);
        [menu13 alignItemsVerticallyWithPadding:15];
        [self addChild:menu13];
        
        /*menuItem7 = [CCMenuItemImage itemWithNormalImage:@"player3.gif"
                                           selectedImage:@"player3.gif"
                                            disabledImage:@"big_lock.png" 
                                                  target:self selector:@selector(addToCartPlayer:)];
        //menuItem2.position=ccp(800,300);
        powerupList=[[NSMutableArray alloc] initWithCapacity:3];
        powerupList[0]=[NSString stringWithFormat:@"3"];
        powerupList[1]=[NSString stringWithFormat:@"%d", player3cost];
        if(remainingTimeBonus<player3cost)
        {
            [menuItem7 setIsEnabled:NO];
        }
        powerupList[2]=[NSString stringWithFormat:@"player3.gif"];
        menuItem7.userData=powerupList;
        CCMenu *menu17 = [CCMenu menuWithItems: menuItem7, nil];
        menu17.position=ccp(900,210);
        [menu17 alignItemsVerticallyWithPadding:15];
        [self addChild:menu17];
        
        CCMenuItemFont *player3Points = [CCMenuItemFont itemWithString:[NSString stringWithFormat:@"%d", player3cost]];
        player3Points.color=ccORANGE;
        CCMenu *menu18 = [CCMenu menuWithItems: player3Points, nil];
        menu18.position=ccp(900,110);
        [menu18 alignItemsVerticallyWithPadding:15];
        [self addChild:menu18];*/
        
        
        CCMenuItemFont *selectPlayer = [CCMenuItemFont itemWithString:@"Select Level"
                                                               target:self
                                                             selector:@selector(nextLevelStart:)];
        selectPlayer.color=ccBLUE;
        CCMenu *menu2 = [CCMenu menuWithItems: selectPlayer, nil];
        menu2.position=ccp(550,50);
        [menu2 alignItemsVerticallyWithPadding:15];
        [self addChild:menu2];
        
        CCMenuItemFont *shopCart = [CCMenuItemFont itemWithString:@"CART"];
        shopCart.color=ccYELLOW;
        CCMenu *menu7 = [CCMenu menuWithItems: shopCart, nil];
        menu7.position=ccp(850,700);
        [menu7 alignItemsVerticallyWithPadding:15];
        [self addChild:menu7];
        errLabel1.visible=false;
    }
    return self;
}

-(void) checkForLock:(int) a
{
    
}

-(void) addToCartPowerUp: (CCMenuItemImage *) sender
{
    if(errLabel1!=NULL)
    {
        errLabel1.visible=false;
    }
    NSMutableArray *a=[[NSMutableArray alloc] initWithCapacity:5];
    a=(NSMutableArray *)sender.userData;
    NSLog(@"hereee");
    //NSString *b=a[0];
    NSLog(@"%@",a);
    NSString *b=[a objectAtIndex:0];
    int powerUpCheck = [b integerValue];
    
    NSString *c=[a objectAtIndex:1];
    int powerUpCost = [c integerValue];
    
    NSString *f=[a objectAtIndex:2];
    const char *powerUpImageName = [f UTF8String];
    
    NSLog(@"%d %d %s",powerUpCheck,powerUpCost,powerUpImageName);
    
    if(powerUpCheck==1)
    {
        if(remainingTimeBonus>0)
        {
            powerup1++;
            [[NSUserDefaults standardUserDefaults] setInteger:powerup1 forKey:@"Shop_PowerUp1"];
        }
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Effect.mp3"];
        [menuItem1 setScale:2];
        //menuItem1.position=ccp(300/2+40,300*1.5);
        double dx=(300*2-300);
        double dy=(300*2-300);
        menuItem1.position=ccp(300-dx,300-dy);
        [menuItem2 setScale:1];
        [menuItem6 setScale:1];
    }
    if(powerUpCheck==2)
    {
        if(remainingTimeBonus>0)
        {
            powerup2++;
            [[NSUserDefaults standardUserDefaults] setInteger:powerup2 forKey:@"Shop_PowerUp2"];
        }
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Effect.mp3"];
        [menuItem6 setScale:2];
        //menuItem2.position=ccp(800/2+40,300*1.5);
        double dx=(800*2-800);
        double dy=(300*2-300);
        menuItem6.position=ccp(800-dx,300-dy);
        [menuItem1 setScale:1];
        [menuItem2 setScale:1];
    }
    if(powerUpCheck==3)
    {
        if(remainingTimeBonus>0)
        {
            powerup3++;
            [[NSUserDefaults standardUserDefaults] setInteger:powerup3 forKey:@"Shop_PowerUp3"];
        }
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Effect.mp3"];
        [menuItem2 setScale:2];
        //menuItem2.position=ccp(800/2+40,300*1.5);
        double dx=(800*2-800);
        double dy=(300*2-300);
        menuItem2.position=ccp(800-dx,300-dy);
        [menuItem1 setScale:1];
        [menuItem6 setScale:1];
    }
    
    CCMenuItemImage *menuItem19 = [CCMenuItemImage itemWithNormalImage:[NSString stringWithFormat:@"%s",powerUpImageName]
                                                         selectedImage:[NSString stringWithFormat:@"%s",powerUpImageName]];
    CCMenu *menu8 = [CCMenu menuWithItems: menuItem19, nil];
    menu8.position=ccp(powerUpXPos,powerUpYPos);
    
    [menu8 alignItemsVerticallyWithPadding:15];
    
    //remainingTimeBonus=remainingTimeBonus-40;
    NSLog(@"Powerup1 var: %d",powerup1);
    if(( (powerup1==1 && powerUpCheck==1) || (powerup2==1 && powerUpCheck==2) || (powerup3==1 && powerUpCheck==3)) && remainingTimeBonus>=powerUpCost)
    {
        powerUpYPos=powerUpYPos-50;
        // timeBonus=timeBonus-100;
        remainingTimeBonus=remainingTimeBonus-powerUpCost;
        [self removeChild:label1];
        label1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", remainingTimeBonus]  fontName:@"Chalkduster" fontSize:40];
        label1.color = ccRED;
        //label.color = ccc3(0,0,0);
        label1.position = ccp(200, 600);
        [self addChild:label1];
        [self addChild:menu8];
        powerup1Check=true;
    }
    else{
        if((powerup1>=1 && powerUpCheck==1) || (powerup2>=1 && powerUpCheck==2) || (powerup3>=1 && powerUpCheck==3))
        {
            errLabel1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"Power Up Already in Cart !!"]  fontName:@"Chalkduster" fontSize:50];
            [menuItem1 setScale:1];
            [menuItem2 setScale:1];
            [menuItem6 setScale:1];
        }
        else
        {
            errLabel1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"Can not Buy, not enough Points !!"]  fontName:@"Chalkduster" fontSize:50];
        }
        errLabel1.color = ccRED;
        errLabel1.position = ccp(550, 400);
        [self addChild:errLabel1];
        errLabel1.visible=true;
        //powerup1Check=false;
    }
}

-(void) addToCartPlayer: (CCMenuItemImage *) sender
{
    if(errLabel1!=NULL)
    {
        errLabel1.visible=false;
    }
    NSMutableArray *a=[[NSMutableArray alloc] initWithCapacity:5];
    a=(NSMutableArray *)sender.userData;
    NSLog(@"hereee");
    //NSString *b=a[0];
    NSLog(@"%@",a);
    NSString *b=[a objectAtIndex:0];
    int playerSelectCheck = [b integerValue];
    
    NSString *c=[a objectAtIndex:1];
    int playerSelectCost = [c integerValue];
    
    NSString *f=[a objectAtIndex:2];
    const char *playerSelectImageName = [f UTF8String];
    
    NSLog(@"%d %d %s",playerSelectCheck,playerSelectCost,playerSelectImageName);
    
    if(playerSelectCheck==1)
    {
        playerCount++;
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Effect.mp3"];
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"Shop_PlayerImage"];
        player1=true;
        player2=false;
        player3=false;
        [menuItem4 setScale:2];
        //menuItem1.position=ccp(300/2+40,300*1.5);
        double dx=(800*2-800);
        double dy=(300*2-300);
        menuItem4.position=ccp(800-dx,300-dy);
        [menuItem5 setScale:1];
        [menuItem7 setScale:1];
    }
    else if(playerSelectCheck==2)
    {
        if(remainingTimeBonus>0)
        {
            playerCount++;
        }
        player2=true;
        [[SimpleAudioEngine sharedEngine] playEffect:@"Coin_Effect.mp3"];
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"Shop_PlayerImage"];
        player1=false;
        player3=false;
        [menuItem5 setScale:2];
        //menuItem2.position=ccp(800/2+40,300*1.5);
        double dx=(800*2-800);
        double dy=(300*2-300);
        menuItem5.position=ccp(800-dx,300-dy);
        [menuItem4 setScale:1];
        [menuItem7 setScale:1];
    }
    
    CCMenuItemImage *menuItem9 = [CCMenuItemImage itemWithNormalImage:[NSString stringWithFormat:@"%s",playerSelectImageName]
                                                        selectedImage:[NSString stringWithFormat:@"%s",playerSelectImageName]];
    CCMenu *menu8 = [CCMenu menuWithItems: menuItem9, nil];
    menu8.position=ccp(playerSelectXPos,playerSelectYPos);
    
    [menu8 alignItemsVerticallyWithPadding:15];
    
    //remainingTimeBonus=remainingTimeBonus-40;
    if(playerCount==1 && remainingTimeBonus>=playerSelectCost)
    {
        // timeBonus=timeBonus-100;
        remainingTimeBonus=remainingTimeBonus-playerSelectCost;
        [self removeChild:label1];
        label1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", remainingTimeBonus]  fontName:@"Chalkduster" fontSize:40];
        label1.color = ccRED;
        //label.color = ccc3(0,0,0);
        label1.position = ccp(200, 600);
        [self addChild:label1];
        [self addChild:menu8];
        powerup1Check=true;
    }
    else{
        if(playerCount>=1)
        {
            errLabel1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"Player Already Selected !!"]  fontName:@"Chalkduster" fontSize:50];
        }
        else
        {errLabel1 =[CCLabelTTF labelWithString:[NSString stringWithFormat:@"Can not Choose, not enough Points !!"]  fontName:@"Chalkduster" fontSize:50];
        }
        errLabel1.color = ccRED;
        errLabel1.position = ccp(550, 400);
        [self addChild:errLabel1];
        errLabel1.visible=true;
        //powerup1Check=false;
    }
    
}

-(void)nextLevelStart:(id) sender
{
    /*int powerUpArray[3];
    powerUpArray[0]=powerup1;
    powerUpArray[1]=powerup2;
    powerUpArray[2]=powerup3;
    
    int playerSelectArray[3];
    playerSelectArray[0]=player1;
    playerSelectArray[1]=player2;
    playerSelectArray[2]=player3;
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelloWorldLayer_Level2 scene2:YES timeBonus:remainingTimeBonus powerups:powerUpArray playerSelected:playerSelectArray]]];*/
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[LevelSelectLayer firstScene:0]]];
}

@end
