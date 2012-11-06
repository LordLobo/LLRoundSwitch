//
//  LLRoundSwitch.h
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//
//  based on DCRoundSwitch.h Created by Patrick Richards on 28/06/11.
//  MIT License.
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class LLRoundSwitchToggleLayer;
@class LLRoundSwitchOutlineLayer;
@class LLRoundSwitchKnobLayer;

@interface LLRoundSwitch : UIControl
{
    @private
        LLRoundSwitchOutlineLayer *outlineLayer;
        LLRoundSwitchToggleLayer *toggleLayer;
        LLRoundSwitchKnobLayer *knobLayer;
        CAShapeLayer *clipLayer;
        BOOL ignoreTap;
}

-(void) setup;
-(void) useLayerMasking;
-(void) removeLayerMask;
-(void) positionLayersAndMask;

@property (nonatomic, retain) UIColor *onTintColor;		// default: blue (matches normal UISwitch)
@property (nonatomic, getter=isOn) BOOL on;				// default: NO
@property (nonatomic, copy) NSString *onText;			// default: 'ON' - not automatically localized!
@property (nonatomic, copy) NSString *offText;			// default: 'OFF' - not automatically localized!
@property (nonatomic, copy) UIFont *font;               // default: boldSystemFont, size is calculated automatically

- (void)setOn:(BOOL)newOn animated:(BOOL)animated;

@end
