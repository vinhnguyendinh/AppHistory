//
//  MainViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionLib.h"
#import "CusCell.h"
#import "LevelViewController.h"


@class SWRevealViewController;
//@class UITableViewCell;

@interface MainViewController ()

@property(nonatomic, strong)    NSMutableArray *listQuestions;
@property(nonatomic, strong)    NSMutableArray *listLevels;
@property(nonatomic, strong)    NSMutableArray *listChapters;
@property       NSInteger numberChapter;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.strTitle = @"Ôn tập";
    
    [self loadDataToListQuestion];
    _numberChapter = 8;
    
    // Init MutableArray
    _listLevels = [[NSMutableArray alloc]init];
    _listChapters = [[NSMutableArray alloc]init];
    
    // Insert to Lists
    [self insertLevelToListLevel];
   // [self insertChapterToListChapter];
    
    NSLog(@"%lu", (unsigned long)self.listLevels.count);
   // NSLog(@"%lu", (unsigned long)self.listChapters.count);

    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}


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

- (Chapter *)insertListLevelsToChaterFrom:(NSInteger)start to:(NSInteger)end
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
        Chapter *chapter = [self insertListLevelsToChaterFrom:i to:i+3];
        [_listChapters addObject:chapter];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 8;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //NSArray *arr = self.dictData[@"transcript"];
//    //NSDictionary *dictDisplay = arr[indexPath.row];
//    
//    UITableViewCell *cell;
//    
//    //if( cell == nil ) {
//        // chat cua toi...
//        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    //cell.alpha = 0.5;
//    //cell.backgroundColor = [UIColor clearColor];
//    //cell.backgroundColor = [UIColor colorWithRed: 68.0/255.0 green: 125.0/255.0 blue: 190.0/255.0 alpha: 0.8];
//    
//    float height = [self updateCell:cell];
//    
//    return height;
//    
//}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[CusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if(indexPath.row % 8 == 0){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Sự hình thành trật tự thế giới mới sau chiến tranh thế giới thứ hai";
    }
    if(indexPath.row % 8 == 1){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Liên Xô và các nước Đông Âu (1945 - 1991). Liên bang Nga";
    }
    if(indexPath.row % 8 == 2){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Các nước Á, Phi, Mĩ Latinh (1945 - 2000)";
    }
    if(indexPath.row % 8 == 3){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Mĩ, Tây Âu, Nhật Bản (1945 - 2000)";
    }
    if(indexPath.row % 8 == 4){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Quan hệ quốc tế (1945 - 2000)";
    }
    if(indexPath.row % 8 == 5){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Cách mạng khao học - công nghệ và xu thế toàn cầu hóa";
    }
    if(indexPath.row % 8 == 6){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Việt Nam từ năm 1919 đến năm 1930";
    }
    if(indexPath.row % 8 == 7){
        UILabel *lblTheme = [cell.contentView viewWithTag:101];
        lblTheme.text = @"Việt Nam từ năm 1930 đến năm 1945";
    }

    return cell;
}

- (float)updateCell : (UITableViewCell *)cell
{
    UILabel *lbl = [cell.contentView viewWithTag:101];
    
    //lbl.frame = CGRectMake(lbl.frame.origin.x, lbl.frame.origin.y, cell.frame.size.width*2/3, 20);

    //[lbl sizeToFit];
    
    lbl.frame = CGRectMake(self.tableView.frame.size.width - lbl.frame.size.width -50,
                           lbl.frame.origin.y,
                           lbl.frame.size.width,
                           lbl.frame.size.height);
    
    return lbl.frame.size.height + 20;
}
    
//push vao cua so level..
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    //NSDictionary *dictData = self.jsonArr[indexPath.row];
    LevelViewController *level = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"LevelViewController"];
    
    //vcChat.dictData = dictData;
    [self.navigationController pushViewController:level animated:YES];
    
}

    
    
@end


