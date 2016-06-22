//
//  LevelViewController.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/23/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "LevelViewController.h"
#import "CellLevel.h"

@interface LevelViewController ()

@end

@implementation LevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UIBarButtonItem* barbutton= [[UIBarButtonItem alloc] initWithCustomView:moveLeft];
    
    //self.navigationItem.rightBarButtonItem = barbutton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    CellLevel *cellLevel = [tableView dequeueReusableCellWithIdentifier:@"CellLevel" forIndexPath:indexPath];
    
    if(cellLevel == nil){
        cellLevel = [[CellLevel alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellLevel"];
    }
    
    if(indexPath.row % 3 == 0){
        UILabel *lblTheme = [cellLevel.contentView viewWithTag:102];
        lblTheme.text = @"Level 1";
    }
    if(indexPath.row % 3 == 1){
        UILabel *lblTheme = [cellLevel.contentView viewWithTag:102];
        lblTheme.text = @"Level 2";
    }
    if(indexPath.row % 3 == 2){
        UILabel *lblTheme = [cellLevel.contentView viewWithTag:102];
        lblTheme.text = @"Level 3";
    }
    
    return cellLevel;
}

@end
