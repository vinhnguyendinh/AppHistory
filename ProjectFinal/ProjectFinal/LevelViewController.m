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

@property Chapter *chapter;

@end

@implementation LevelViewController

static id instance = nil;
+ (LevelViewController *)sharedInstance
{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Get Level Selected
    _levelSelected = [_chapter.listLevels objectAtIndex:indexPath.row];
    // Push QuestionVC
    QuestionViewController *question = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"QuestionViewController"];
   
    [self.navigationController pushViewController:question animated:YES];
    
    
}@end
