//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Stephanie Szeto on 2/19/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercentage;

- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    self.defaultPercentage.selectedSegmentIndex = intValue;
    
    NSLog(@"settings will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"settings did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"settings will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"settings did disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultPercentage.selectedSegmentIndex forKey:@"defaultTipIndex"];
    [defaults synchronize];
}
@end
