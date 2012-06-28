//
//  LLRoundSwitchKnobLayer.m
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//
//  based on DCRoundSwitchKnobLayer.m Created by Patrick Richards on 29/06/11.
//  MIT License.
//  http://github.com/domesticcatsoftware/DCRoundSwitch

#import "LLRoundSwitchKnobLayer.h"

CGGradientRef GradientCreateWithColors(CGColorSpaceRef colorSpace, CGColorRef startColor, CGColorRef endColor);

@implementation LLRoundSwitchKnobLayer

@synthesize gripped;

- (void)drawInContext:(CGContextRef)context
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGRect knobRect = CGRectInset(self.bounds, 2, 2);
	CGFloat knobRadius = self.bounds.size.height - 2;
    
	// knob outline (shadow is drawn in the toggle layer)
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.62 alpha:1.0].CGColor);
	CGContextSetLineWidth(context, 1.5);
	CGContextStrokeEllipseInRect(context, knobRect);
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);
    
	// knob inner gradient
	CGContextAddEllipseInRect(context, knobRect);
	CGContextClip(context);
    
    // using .CGColor triggers an ARC auto-release bug which causes the UIColor object to me immediately released
    // and causes the CGColorRefs to disappear before we can use them- so we're going to use UIColor here, then extract the CGColorRef
    // when we actually create the gratient.  There are several ways to fix this, but we'll se the most straight-forward: CGColorRetain/Release
    
    // For kmore info on this bug, see http://weblog.bignerdranch.com/296-arc-gotcha-unexpectedly-short-lifetimes
    CGColorRef knobStartColor = CGColorRetain([UIColor colorWithWhite:0.82 alpha:1.0].CGColor);
	CGColorRef knobEndColor = CGColorRetain((self.gripped) ? [UIColor colorWithWhite:0.894 alpha:1.0].CGColor : [UIColor colorWithWhite:0.996 alpha:1.0].CGColor);
    
	CGPoint topPoint = CGPointMake(0, 0);	
	CGPoint bottomPoint = CGPointMake(0, knobRadius + 2);
    
	CGGradientRef knobGradient = GradientCreateWithColors(colorSpace, knobStartColor, knobEndColor);
	CGContextDrawLinearGradient(context, knobGradient, topPoint, bottomPoint, 0);
    
	// knob inner highlight
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 0.5, 0.5));
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 1.5, 1.5));
    
	CGContextEOClip(context);
    
	CGGradientRef knobHighlightGradient = GradientCreateWithColors(colorSpace, [UIColor whiteColor].CGColor, 
                                                                   [UIColor colorWithWhite:1.0 alpha:0.5].CGColor);
	CGContextDrawLinearGradient(context, knobHighlightGradient, topPoint, bottomPoint, 0);
    
    CFRelease(knobGradient);
    CFRelease(knobHighlightGradient);
	CGColorSpaceRelease(colorSpace);
    CGColorRelease(knobStartColor);
    CGColorRelease(knobEndColor);
}

CGGradientRef GradientCreateWithColors(CGColorSpaceRef colorSpace, CGColorRef startColor, CGColorRef endColor)
{
    CGFloat colorStops[2] = {0.0, 1.0};
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, 
                                                (__bridge id)endColor, 
                                                nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                        (__bridge CFArrayRef)colors, 
                                                        colorStops);
    
    return gradient;
}

- (void)setGripped:(BOOL)newGripped
{
	gripped = newGripped;
	[self setNeedsDisplay];
}

@end
