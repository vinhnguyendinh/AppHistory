//
//  MainViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@class SWRevealViewController;

@interface MainViewController ()


@end

@implementation MainViewController

#pragma mark - Singleton

static id instance = nil;
+ (MainViewController *)sharedInstance
{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSLog(@"%@", [APPDELEGATE databasePath]);
    
    _tbvHeight.constant = (self.view.frame.size.height - 65);
    
    instance = self;
    
    self.strTitle = @"Ôn tập";
    
    [self loadDataToListQuestion];
    _numberChapter = 8;
    
    // Init MutableArray
    _listLevels = [[NSMutableArray alloc]init];
    _listChapters = [[NSMutableArray alloc]init];
    
    // Insert to Lists
    [self insertLevelToListLevel];
    [self insertChapterToListChapter];
    
    NSLog(@"%lu", (unsigned long)self.listLevels.count);
   // NSLog(@"%lu", (unsigned long)self.listChapters.count);
    
    // SWRevealContrller
    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
    
    //Number Of Row - TableView
    _numberChapter = 8;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Btn Back
- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}


#pragma mark - Insert Data To List

- (void)loadDataToListQuestion
{
    [Question loadQuestionsFromDBCompletionBlock:^(NSArray *questions) {
        
        self.listQuestions = [[NSMutableArray alloc]initWithArray:questions];
        
    }];
    
}

- (Level *)insertListQuestionsToLevelFrom:(NSInteger)start to:(NSInteger)end
{
    Level *level = [[Level alloc]initWithNumbQues:10 andMinScoreToPass:6 andStartId:start andEndId:end];
    
    for(long i = start; i < end; i++) {
        Question *ques = [_listQuestions objectAtIndex:i];
        [level.listQuestions addObject:ques];
    }
    
    return level;
}

- (void)insertLevelToListLevel
{
    for(int i = 0; i < _listQuestions.count; i+=10) {
        Level *level = [self insertListQuestionsToLevelFrom:i to:i+10];
        [_listLevels addObject:level];
    }
    
}

- (Chapter *)insertListLevelsToChapterFrom:(NSInteger)start to:(NSInteger)end
{
    Chapter *chapter = [[Chapter alloc]initWithNumbLevel:3];
    
    for(long i = start; i < end; i++) {
        Level *level = [_listLevels objectAtIndex:i];
        [chapter.listLevels addObject:level];
    }
    
    return chapter;
}

- (void)insertChapterToListChapter
{
    for(int i = 0; i < _listLevels.count; i+=3) {
        Chapter *chapter = [self insertListLevelsToChapterFrom:i to:i+3];
        [_listChapters addObject:chapter];
    }
}

#pragma mark - TableView Datasources


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 8;
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.indexPathRow = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
    
    if(indexPath.row == 0){
        cell.lblThemeChapter.text = @"Chương 1. Sự hình thành trật tự thế giới mới sau chiến tranh thế giới thứ hai";
    }
    else if(indexPath.row == 1){
        cell.lblThemeChapter.text = @"Chương 2. Liên Xô và các nước Đông Âu (1945 - 1991). Liên bang Nga";
    }
    else if(indexPath.row == 2){
        cell.lblThemeChapter.text = @"Chương 3. Các nước Á, Phi, Mĩ Latinh (1945 - 2000)";
    }
    else if(indexPath.row == 3){
        cell.lblThemeChapter.text = @"Chương 4. Mĩ, Tây Âu, Nhật Bản (1945 - 2000)";
    }
    else if(indexPath.row == 4){
        cell.lblThemeChapter.text = @"Chương 5. Quan hệ quốc tế (1945 - 2000)";
    }
    else if(indexPath.row == 5){
        cell.lblThemeChapter.text = @"Chương 6. Cách mạng khao học - công nghệ và xu thế toàn cầu hóa";
    }
    else if(indexPath.row == 6){
        cell.lblThemeChapter.text = @"Chương 7. Việt Nam từ năm 1919 đến năm 1930";
    }
    else if(indexPath.row == 7){
        cell.lblThemeChapter.text = @"Chương 8. Việt Nam từ năm 1930 đến năm 1945";
    }

    
//    if(indexPath.row != 0 && indexPath.row == cell.indexPathRow.row)
//    {
//        cell.userInteractionEnabled = NO;
//        cell.lblThemeChapter.alpha = 0.5f;
//    }

    //[self updateCell:cell];
    return cell;
}

- (CGFloat)updateCell : (CusCell *)cell
{
    cell.lblThemeChapter.frame = CGRectMake(cell.lblThemeChapter.frame.origin.x, cell.lblThemeChapter.frame.origin.y, cell.frame.size.width*2/3, 20);

    [cell.lblThemeChapter sizeToFit];
    return (cell.lblThemeChapter.frame.size.height + 20);
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Get Chapter at row
    _chapterSelected = [_listChapters objectAtIndex:indexPath.row];
    
    // Push Level VC
    LevelViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"LevelViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end


