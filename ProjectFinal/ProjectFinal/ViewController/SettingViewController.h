//
//  SettingViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface SettingViewController : BasedTableViewController <UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UIButton *btnThemeColor;
- (IBAction)btnThemeColorClicked:(id)sender;

//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnResetData;
//- (IBAction)btnResetDataClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
- (IBAction)btnAboutClicked:(id)sender;



@end
