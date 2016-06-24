//
//  QuestionViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuestionLib.h"
#import "MainViewController.h"
#import "LevelViewController.h"

@interface QuestionViewController ()

@property NSInteger numberAns;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingOfBtnContinue;
@property NSInteger start;
@property NSInteger end;
@property Level *level;
@property Question *question;
@property NSMutableArray *listAnswers;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self CustomButton];
    _numberAns = 4;
    
    // Singleton
    _level = [LevelViewController sharedInstance].levelSelected;
    
    // Insert data
    _numberQuesPresent = 0;
    _question = [_level.listQuestions objectAtIndex:_numberQuesPresent];
    _listAnswers = [[NSMutableArray alloc]initWithArray:_question.listAnswers];
    
}

// Custom Button
- (void)CustomButton
{
    _btnContinue.layer.cornerRadius = 15.0f;
    _leadingOfBtnContinue.constant = (self.view.frame.size.width - _btnContinue.frame.size.width) / 2;
}

// Logic next question
- (IBAction)btnContinueClicked:(id)sender {
    _numberQuesPresent++;
    _question = [_level.listQuestions objectAtIndex:_numberQuesPresent];
    _listAnswers = [[NSMutableArray alloc]initWithArray:_question.listAnswers];
    // Update Data tableView
    [self.tableView beginUpdates];
    
    NSIndexPath *indexPath;
    
    [self.tableView endUpdates];
   
}

#pragma mark - tableView Datasources

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _numberAns + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    UILabel *lblContent = [cell.contentView viewWithTag:101];
    
    
    if(indexPath.row == 0) {
        lblContent.text = _question.contentQuestion;
    } else {
        Answers *ans = [_listAnswers objectAtIndex:indexPath.row - 1];
        lblContent.text = ans.contentAnswer;
    }
    return cell;
}


@end
