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
#import "ResultLevelViewController.h"

@interface QuestionViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingOfBtnContinue;
@property NSString *strTitleBtn;
@property NSInteger numberAns;
@property NSInteger indexAnsSelected;
@property Level *level;
@property Question *question;
@property NSMutableArray *listAnswers;
@property NSMutableArray *listAnswersSelected;


@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.toolbar setHidden: NO];
    
    // Init
    [self CustomButton];
    _numberAns = 4;
    _listAnswersSelected = [[NSMutableArray alloc]init];
    
    // Singleton
    _level = [LevelViewController sharedInstance].levelSelected;
    instance = self;
    
    // Insert data
    _numberQuesPresent = 0;
    _question = [_level.listQuestions objectAtIndex:_numberQuesPresent];
    _listAnswers = [[NSMutableArray alloc]initWithArray:_question.listAnswers];
    
}

//Singleton
static id instance = nil;
+ (QuestionViewController *)sharedInstance
{
    return instance;
}

// Custom Button
- (void)CustomButton
{
    _strTitleBtn = @"Tiếp tục";
    [_btnContinue setTitle:_strTitleBtn forState:UIControlStateNormal];
    _btnContinue.alpha = 0.5f;
    _btnContinue.enabled = NO;
    _btnContinue.layer.cornerRadius = 15.0f;
    _leadingOfBtnContinue.constant = (self.view.frame.size.width - _btnContinue.frame.size.width) / 2;
}

// Logic next question

static bool check = true;
- (IBAction)btnContinueClicked:(id)sender {
    // Update data
    if ( _numberQuesPresent < 10 ) {
        if(check) {
            check = false;
            _numberQuesPresent++;
        }
        [self updateDataCell];
        [self insertListAnsSelected];
    } else if ( _numberQuesPresent == 10) {
            // Set Title of Button
            _strTitleBtn = @"Kiểm tra";
            [_btnContinue setTitle:_strTitleBtn forState:UIControlStateNormal];
            // Push VC 
            ResultLevelViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ResultLevelViewController"];
            [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)updateDataCell
{
    _question = [_level.listQuestions objectAtIndex:_numberQuesPresent];
    _listAnswers = [[NSMutableArray alloc]initWithArray:_question.listAnswers];
    
    // Reload Data tableView
    
    [self.tableView beginUpdates];
    
    NSMutableArray *arrIndexPath = [[NSMutableArray alloc]init];
    for ( int i = 0; i <= 4; i++ ) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        UILabel *lblContentAns = [cell.contentView viewWithTag:101];
        lblContentAns.textColor = [UIColor blackColor];
        [arrIndexPath addObject:indexPath];
    }
    [self.tableView reloadRowsAtIndexPaths:arrIndexPath withRowAnimation:UITableViewRowAnimationLeft];
    
    [self.tableView endUpdates];

    _numberQuesPresent++;
    
    // Setting Button
    _btnContinue.alpha = 0.5f;
    _btnContinue.enabled = NO;
    
}

- (void)insertListAnsSelected
{
    NSString *ansSelected;
    if ( _indexAnsSelected == 1 ) {
        ansSelected = @"A";
    } else if ( _indexAnsSelected == 2 ) {
        ansSelected = @"B";
    } else if ( _indexAnsSelected == 3 ) {
        ansSelected = @"C";
    } else if ( _indexAnsSelected == 4 ) {
        ansSelected = @"D";
    }
    [_listAnswersSelected addObject:ansSelected];
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
        NSMutableString *titleQues = [NSMutableString stringWithFormat:@"Câu %ld. ", (long)_numberQuesPresent + 1];
        [titleQues insertString:_question.contentQuestion atIndex:titleQues.length];
        
        lblContent.text = titleQues;
    } else {
        Answers *ans = [_listAnswers objectAtIndex:indexPath.row - 1];
        lblContent.text = ans.contentAnswer;
    }
    return cell;
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        _btnContinue.enabled = NO;
        _btnContinue.alpha = 0.5f;
    } else {
        NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        UILabel *lblContentAns = [cell.contentView viewWithTag:101];
        lblContentAns.textColor = [UIColor blueColor];
        for(int i = 1; i <= 4; i++) {
            NSIndexPath *indexPathForRow = [NSIndexPath indexPathForRow:i inSection:0];
            if( indexPathForRow != selectedIndexPath ) {
                cell = [tableView cellForRowAtIndexPath:indexPathForRow];
                lblContentAns = [cell.contentView viewWithTag:101];
                lblContentAns.textColor = [UIColor blackColor];
            }
            
        }
        _btnContinue.enabled = YES;
        _btnContinue.alpha = 1.0f;
        _indexAnsSelected = indexPath.row;
    }
}


@end
