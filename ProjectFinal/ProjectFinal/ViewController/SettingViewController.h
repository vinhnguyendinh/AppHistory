//
//  SettingViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface SettingViewController : BasedTableViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
@property (weak, nonatomic) IBOutlet UIButton *btnThemeColor;

@property (weak, nonatomic) IBOutlet UISwitch *btnSwitchSetTimeLevel;
- (IBAction)btnThemeColorClicked:(id)sender;
- (IBAction)btnSwitchSetTimeLevelClicked:(id)sender;

- (IBAction)btnAboutClicked:(id)sender;




@end
