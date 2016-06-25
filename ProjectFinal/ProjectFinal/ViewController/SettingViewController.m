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
#import "AboutViewController.h"

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
    NSString *strTimer;
    if ( setTimeLevelOn ) {
        strTimer = @"YES";
    }
    else {
        strTimer = @"NO";
    }
    [[NSUserDefaults standardUserDefaults] setObject:strTimer forKey:kUD_IsLevelOn];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [StaticData sharedInstance].isTimeLevelOn = [strTimer boolValue];
}
- (IBAction)btnAboutClicked:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"This is the learning application of history for iOS." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
    AboutViewController *vc = [[Utils mainStoryboard]instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}

@end
