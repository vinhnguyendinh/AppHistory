//
//  SettingViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "SettingViewController.h"
#import "ColorChooserViewController.h"
#import "QuestionViewController.h"
#import "ColectionViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.strTitle = @"Cài đặt";
    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
    [self customButton];
}

- (void)customButton
{
    UIButton *button1 = [self.view viewWithTag:101];
    UIView *button2 = [self.view viewWithTag:102];
    UIButton *button3 = [self.view viewWithTag:103];
    button1.layer.cornerRadius = 15.0f;
    button2.layer.cornerRadius = 15.0f;
    button3.layer.cornerRadius = 15.0f;
}

- (IBAction)btnThemeColorClicked:(id)sender {
//    ColorChooserViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ColorChooserViewController"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    ColectionViewCell *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ColectionViewCell"];
        [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)btnSwitchSetTimeLevelClicked:(id)sender {
    BOOL setTimeLevelOn = [StaticData sharedInstance].isTimeLevelOn;
    if (setTimeLevelOn) {
        [[StaticData sharedInstance] setIsTimeLevelOn:NO];
    } else {
        [[StaticData sharedInstance] setIsTimeLevelOn:YES];
    }
}

- (IBAction)btnAboutClicked:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"This is the learning application of history for iOS." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}

@end
