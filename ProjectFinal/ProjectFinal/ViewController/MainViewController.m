//
//  MainViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionLib.h"


@class SWRevealViewController;

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
    
    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
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
@end
