//
//  ResultLevelViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/24/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "ResultLevelViewController.h"

@implementation ResultLevelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // insert code right here
    [self customButton];
}

- (void)customButton
{
    // Setting Button
    _btnContinue.alpha = 0.5f;
    _btnContinue.enabled = NO;
}

- (IBAction)btnContinueClicked:(id)sender {
    // Pop VC Present
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
