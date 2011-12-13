//
//  LLRoundSwitchToggleLayer.m
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//
//  based on DCRoundSwitchToggleLayer.m Created by Patrick Richards on 29/06/11.
//  MIT License.
//  http://github.com/domesticcatsoftware/DCRoundSwitch

#import "LLRoundSwitchToggleLayer.h"

@implementation LLRoundSwitchToggleLayer

@synthesize onString, offString, onTintColor;
@synthesize drawOnTint;
@synthesize clip;

-(id) initWithOnString:(NSString *)anOnString 
             offString:(NSString *)anOffString
           onTintColor:(UIColor *)anOnTintColor
{
    if (self=[super init])
    {
        self.onString = anOnString;
        self.offString = anOffString;
        self.onTintColor = anOnTintColor;
    }
    return self;
}

-(void) drawInContext:(CGContextRef)context
{
    CGFloat knobRadius = self.bounds.size.height - 2.0;
    CGFloat knobCenter = self.bounds.size.width / 2.0;
    CGRect knobRect = CGRectMake(knobCenter - knobRadius / 2.0, 1.0, knobRadius, knobRadius);
    
    if (self.clip)
    {
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-self.frame.origin.x + 0.5,
                                                                                      0, 
                                                                                      self.bounds.size.width / 2.0 + 
                                                                                      self.bounds.size.height / 2.0 - 1.5, 
                                                                                      self.bounds.size.height)
                                                              cornerRadius:self.bounds.size.height / 2.0];
        CGContextAddPath(context, bezierPath.CGPath);
        CGContextClip(context);
    }
    
    // on tint color
    if (self.drawOnTint)
    {
        CGContextSetFillColorWithColor(context, self.onTintColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, knobCenter, self.bounds.size.height));
    }
    
    // off tint color (white)
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.963 alpha:1.0].CGColor);
    CGContextFillRect(context, CGRectMake(knobCenter, 0, self.bounds.size.width - knobCenter, self.bounds.size.height));
    
    // knob shadow
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 1.5, [UIColor colorWithWhite:0.2 alpha:1.0].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.42 alpha:1.0].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeEllipseInRect(context, knobRect);
    CGContextSetShadowWithColor(context, CGSizeMake(0,0), 0, NULL);
    
    // strings
    UIFont *font = [UIFont boldSystemFontOfSize:ceilf(self.bounds.size.height * .6)];
    CGFloat textSpaceWidth = (self.bounds.size.width / 2) - (knobRadius / 2);
    
    UIGraphicsPushContext(context);
    
    // 'ON' state label (self.onString)
    CGSize onTextSize = [self.onString sizeWithFont:font];
    CGPoint onTextPoint = CGPointMake((textSpaceWidth - onTextSize.width) / 2.0 + knobRadius * .15, 
                                      floorf((self.bounds.size.height - onTextSize.height) / 2.0) + 1.0);
    [[UIColor colorWithWhite:0.45 alpha:1.0] set]; // .2 & .4
    [self.onString drawAtPoint:CGPointMake(onTextPoint.x, onTextPoint.y - 1.0)
                      withFont:font];
    [[UIColor whiteColor] set];
    [self.onString drawAtPoint:onTextPoint
                      withFont:font];
    
    // off state label (self.offstring)
    CGSize offTextSize = [self.offString sizeWithFont:font];
	CGPoint offTextPoint = CGPointMake(textSpaceWidth + (textSpaceWidth - offTextSize.width) / 2.0 + knobRadius * .86, 
                                       floorf((self.bounds.size.height - offTextSize.height) / 2.0) + 1.0);
	[[UIColor whiteColor] set];
	[self.offString drawAtPoint:CGPointMake(offTextPoint.x, offTextPoint.y + 1.0) 
                       withFont:font];
	[[UIColor colorWithWhite:0.52 alpha:1.0] set];
	[self.offString drawAtPoint:offTextPoint 
                       withFont:font];
    
	UIGraphicsPopContext();
}

@end
