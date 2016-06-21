//
//  LeftMenuViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "LeftMenuViewController.h"


@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *img = (UIImageView *)[cell.contentView viewWithTag:101];
    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:102];
    UILabel *lblNum = (UILabel *)[cell.contentView viewWithTag:103];
    lblNum.layer.cornerRadius = 1.0f;
    lblNum.hidden = YES;
    
    if (indexPath.row == 0) {
        img.image = [UIImage imageNamed:@"ic_translate.png"];
        lblTitle.text = @"Ôn Tập";
    } else if (indexPath.row == 1) {
        img.image = [UIImage imageNamed:@"ic_add.png"];
        lblTitle.text = @"Luyện Đề Thi";
    } else if (indexPath.row == 2) {
        img.image = [UIImage imageNamed:@"ic_setting.png"];
        lblTitle.text = LocalizedString(@"Setting");
    } else if (indexPath.row == 3) {
        img.image = [UIImage imageNamed:@"ic_about.png"];
        lblTitle.text = LocalizedString(@"About");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.previousRow == indexPath.row) {
        [[SWRevealViewController sharedInstance] revealToggle:nil];
        return;
    }
    if (indexPath.row == 0) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"PracticeNav"];
        [[SWRevealViewController sharedInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ExamNav"];
        [[SWRevealViewController sharedInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 2) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"SettingNav"];
        [[SWRevealViewController sharedInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"AboutNav"];
        [[SWRevealViewController sharedInstance] pushFrontViewController:vc animated:YES];
    }
    
    self.previousRow = indexPath.row;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

@end
