//
//  TipViewController.m
//  TipCalculator
//
//  Created by Stephanie Szeto on 2/18/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billText;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    self.tipControl.selectedSegmentIndex = intValue;
    
    [self updateValues];
    NSLog(@"calculator will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"calculator did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"calculator will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"calculator did disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float bill = [self.billText.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tip = bill * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float total = tip + bill;
    
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", total];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
