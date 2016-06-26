//
//  LevelViewController.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/23/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "LevelViewController.h"
#import "CellLevel.h"
#import "QuestionViewController.h"
#import "MainViewController.h"

@interface LevelViewController ()


@end

@implementation LevelViewController

static id instance = nil;
+ (LevelViewController *)sharedInstance
{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.strTitle = @"Level";
    
    instance = self;
    _chapter = [MainViewController sharedInstance].chapterSelected;
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView Datasources

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
    CellLevel *cellLevel = [tableView dequeueReusableCellWithIdentifier:@"CellLevel" forIndexPath:indexPath];
    
    if ( cellLevel == nil ) {
        cellLevel = [[CellLevel alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellLevel"];
    }
    
    cellLevel.indexPathRow = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
    
    if(cellLevel.indexPathRow.row != 0) {
        cellLevel.userInteractionEnabled = NO;
        cellLevel.lblThemeLevel.alpha = 0.5f;
    }
    
    if(cellLevel.indexPathRow.row == 0){
        cellLevel.lblThemeLevel.text = @"Level 1";
    }
    if(cellLevel.indexPathRow.row == 1){
        cellLevel.lblThemeLevel.text = @"Level 2";
    }
    if(cellLevel.indexPathRow.row == 2){
        cellLevel.lblThemeLevel.text = @"Level 3";
    }
    
    return cellLevel;
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Get Level Selected
    _levelSelected = [_chapter.listLevels objectAtIndex:indexPath.row];
    _indexLevelSelected = indexPath.row;
    
    // Push QuestionVC
    QuestionViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"QuestionViewController"];
   
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
