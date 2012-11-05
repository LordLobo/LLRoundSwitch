//
//  LLRoundSwitchToggleLayer.h
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//
//  based on DCRoundSwitchToggleLayer.h Created by Patrick Richards on 29/06/11.
//  MIT License.
//  http://github.com/domesticcatsoftware/DCRoundSwitch

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface LLRoundSwitchToggleLayer : CALayer

@property (nonatomic, retain) UIColor *onTintColor;
@property (nonatomic, retain) NSString *onString;
@property (nonatomic, retain) NSString *offString;
@property (nonatomic, retain) NSString *fontFamiliy;

@property (nonatomic) BOOL drawOnTint;
@property (nonatomic) BOOL clip;

-(id) initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor;

@end
