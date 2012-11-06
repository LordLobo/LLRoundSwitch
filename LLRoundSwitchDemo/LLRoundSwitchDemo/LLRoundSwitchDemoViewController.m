//
//  LLViewController.m
//  LLRoundSwitchDemo
//
//  Created by Daniel Giralte on 12/5/11.
//  Copyright (c) 2011 none. All rights reserved.
//

#import "LLRoundSwitchDemoViewController.h"

@implementation LLRoundSwitchDemoViewController

@synthesize switch1, switch2, switch3, switch4;
@synthesize fatSwtich, longSwitch;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Let's turn switch1 on
    switch1.on = YES;
    
    // Let's make switch1 do something when toggled
    [switch1 addTarget:self 
                action:@selector(switch1Toggled:) 
      forControlEvents:UIControlEventValueChanged];
    
    // How about a little red and a turn-on for switch2
    switch2.onTintColor = [UIColor redColor];
    switch2.on = YES;
    switch2.fontFamiliy = @"Futura";
    
    // switch3 wants to be black and on
    switch3.onTintColor = [UIColor blackColor];
    switch3.on = YES;
    // and give switch3 an event too
    [switch3 addTarget:self 
                action:@selector(switch3Toggled:)
      forControlEvents:UIControlEventValueChanged];
    
    // switch4 event - toggle switch1 visibility
    [switch4 addTarget:self 
                action:@selector(switch4Toggled:)
      forControlEvents:UIControlEventValueChanged];
    
    // fatswitch doesn't have time for words
    fatSwtich.OnText = @"1";
    fatSwtich.offText = @"0";
    
    // longswitch is more verbose
    longSwitch.onText = @"LONG ON TEXT";
    longSwitch.offText = @"LONG OFF TEXT";
    longSwitch.on = YES;
}

- (void)switch1Toggled:(id)sender
{
    [switch2 setOn:!switch2.isOn animated:YES];
}

- (void)switch3Toggled:(id)sender
{
    [fatSwtich setOn:!fatSwtich.isOn animated:YES];
}

- (void)switch4Toggled:(id)sender
{
    // toggle switch1 visibilty to try to get re-renders to induce a leak
    [switch1 setHidden:!switch1.hidden];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
