//
//  ColorChooserViewController.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/24/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "ColorChooserViewController.h"
#import "LeftMenuViewController.h"
//#import "StartViewController.h"

@interface ColorChooserViewController ()

@end

@implementation ColorChooserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    self.title = LocalizedString(@"Color Theme Chooser");
    self.arrColorName = @[@"Red",
                          @"Pink",
                          @"Purple",
                          @"Deep Purple",
                          @"Indigo",
                          @"Blue",
                          @"Light Blue",
                          @"Cyan",
                          @"Teal",
                          @"Green",
                          @"Light Green",
                          @"Lime",
                          @"Amber",
                          @"Orange",
                          @"Deep Orange",
                          @"Blue Grey",
                          @"Brown",
                          @"Black"];
    self.arrColorValue = @[@"#F44336",
                           @"#EC407A",
                           @"#9C27B0",
                           @"#673AB7",
                           @"#3F51B5",
                           @"#2196F3",
                           @"#03A9F4",
                           @"#00BCD4",
                           @"#009688",
                           @"#4CAF50",
                           @"#8BC34A",
                           @"#CDDC39",
                           @"#FFC107",
                           @"#FF9800",
                           @"#FF5722",
                           @"#795548",
                           @"#607DBB",
                           @"#000000"];
    
    self.numberRowInSection = @{@(0): @(self.arrColorName.count)};
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    //UIView *viewColor = (UIView *)[cell.contentView viewWithTag:101];
    UILabel *lblText = (UILabel *)[cell.contentView viewWithTag:102];
    
    lblText.text = self.arrColorName[indexPath.row];
    cell.backgroundColor = [Utils colorFromHex:self.arrColorValue[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strColor = self.arrColorValue[indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:strColor forKey:kUD_MainColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [StaticData sharedInstance].mainColor = [Utils colorFromHex:self.arrColorValue[indexPath.row]];
    
    
    [[LeftMenuViewController shareInstance] refreshColor];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
