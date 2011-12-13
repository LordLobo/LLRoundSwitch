//
//  LLViewController.h
//  LLRoundSwitchDemo
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLRoundSwitch.h"

@interface LLRoundSwitchDemoViewController : UIViewController
{ 
}

@property (strong, nonatomic) IBOutlet LLRoundSwitch *switch1;
@property (strong, nonatomic) IBOutlet LLRoundSwitch *switch2;
@property (strong, nonatomic) IBOutlet LLRoundSwitch *switch3;
@property (strong, nonatomic) IBOutlet LLRoundSwitch *switch4;

@property (strong, nonatomic) IBOutlet LLRoundSwitch *longSwitch;
@property (strong, nonatomic) IBOutlet LLRoundSwitch *fatSwtich;

@end
