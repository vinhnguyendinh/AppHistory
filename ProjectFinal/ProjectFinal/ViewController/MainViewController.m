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
    return _numberChapter;
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[CusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    UILabel *lblTheme = [cell.contentView viewWithTag:101];
    
    if(indexPath.row % _numberChapter == 0){
        lblTheme.text = @"Sự hình thành trật tự thế giới mới sau chiến tranh thế giới thứ hai";
    }
    else if(indexPath.row % _numberChapter == 1){
        lblTheme.text = @"Liên Xô và các nước Đông Âu (1945 - 1991). Liên bang Nga";
    }
    else if(indexPath.row % _numberChapter == 2){
        lblTheme.text = @"Các nước Á, Phi, Mĩ Latinh (1945 - 2000)";
    }
    else if(indexPath.row % _numberChapter == 3){
        lblTheme.text = @"Mĩ, Tây Âu, Nhật Bản (1945 - 2000)";
    }
    else if(indexPath.row % _numberChapter == 4){
        lblTheme.text = @"Quan hệ quốc tế (1945 - 2000)";
    }
    else if(indexPath.row % _numberChapter == 5){
        lblTheme.text = @"Cách mạng khao học - công nghệ và xu thế toàn cầu hóa";
    }
    else if(indexPath.row % _numberChapter == 6){
        lblTheme.text = @"Việt Nam từ năm 1919 đến năm 1930";
    }
    else if(indexPath.row % _numberChapter == 7){
        lblTheme.text = @"Việt Nam từ năm 1930 đến năm 1945";
    }

    [self updateCell:cell];
    return cell;
}

- (float)updateCell : (UITableViewCell *)cell
{
    UILabel *lbl = [cell.contentView viewWithTag:101];
    
    lbl.frame = CGRectMake(lbl.frame.origin.x, lbl.frame.origin.y, cell.frame.size.width*2/3, 20);

    [lbl sizeToFit];
    return lbl.frame.size.height + 20;
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


