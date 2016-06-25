//
//  QuestionViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "QuestionViewController.h"
#import "Soundmanager.h"
#import "MusicViewController.h"


@interface QuestionViewController ()

@property NSString *strTitleMessageAlertView;
@property NSString *strMessageAlertView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingOfBtnContinue;
@property (weak, nonatomic) IBOutlet UILabel *lblMinuteTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondTimer;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _listAnsChoose = [[NSArray alloc]init];
    
    self.strTitle = @"Bài làm";
    
    [self.navigationController.toolbar setHidden: NO];
    
    // Init
    [self CustomButton];
    _numberAns = 4;
    _listAnswersSelected = [[NSMutableArray alloc]init];
    _minute = 10;
    _second = 0;
    
    // Singleton
    _level = [LevelViewController sharedInstance].levelSelected;
    instance = self;
    
    // Insert data
    _numberQuesPresent = 0;
    _question = [_level.listQuestions objectAtIndex:_numberQuesPresent];
    _listAnswers = [[NSMutableArray alloc]initWithArray:_question.listAnswers];
    
    //delete lines between UITableViewCells in UITableView
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Display Timer
    [self displayTimer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _lblMinuteTimer.text = @"10 : ";    _lblSecondTimer.text = @"00";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Control Timer
    NSLog(@"View Will Appear");
    [self.viewTimer drawCircleWithPercent:100
                                 duration:600
                                lineWidth:10
                                clockwise:YES
                                  lineCap:kCALineCapRound
                                fillColor:[UIColor clearColor]
                              strokeColor:[UIColor orangeColor]
                           animatedColors:nil];
    [self.viewTimer startAnimation];
}

- (void)displayTimer
{
    // Label
    dispatch_queue_t q_background = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(q_background, ^{
        while (_minute >= 0) {
            [NSThread sleepForTimeInterval:1.0f];
            dispatch_async(dispatch_get_main_queue(), ^{
                if ( _second == 0 ) {
                    _minute--;
                    _second = 60;
                }
                _second--;
                NSString *strMinute;
                NSString *strSecond;
                if ( _minute >= 10 ) {
                    strMinute = [NSString stringWithFormat:@"%ld : ", (long)_minute];
                } else if ( _minute >= 0 ){
                    strMinute = [NSString stringWithFormat:@"0%ld : ", (long)_minute];
                }
                
                if ( _second >= 10 ) {
                    strSecond = [NSString stringWithFormat:@"%ld", (long)_second];
                } else if ( _second >= 0 ) {
                    strSecond = [NSString stringWithFormat:@"0%ld", (long)_second];
                }
                
                if ( _minute < 0 ) {
                    strMinute = @"00 : "; strSecond = @"00";
                }
                
                _lblMinuteTimer.text = strMinute;   _lblSecondTimer.text = strSecond;
                
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if ( _minute < 0 ) {
                _lblMinuteTimer.text = @"00 : ";    _lblSecondTimer.text = @"00";
                _strMessageAlertView = @"Bạn đã hết thời gian làm bài.";
                [self alertViewShow];
            }
        });
    });
    
}

#pragma mark - AlertView
- (void)alertViewShow
{
    _strTitleMessageAlertView = @"Mesage";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_strTitleMessageAlertView
                    message:_strMessageAlertView
                   delegate:self
          cancelButtonTitle:@"Hoàn tất"
          otherButtonTitles:@"Thoát", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        [self pushVC];
    } else if (buttonIndex == 1) {
        if ( _minute < 0 ) {
            [self pushVC];
        } else {
            [alertView setHidden:YES];
        }
    }
    
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
        [self insertListAnsSelected];

        // Set Title of Button
        _strTitleBtn = @"Kiểm tra";
        [_btnContinue setTitle:_strTitleBtn forState:UIControlStateNormal];
        
        _strMessageAlertView = @"Bạn có chắc chắn muốn nộp bài ?";
        
        [self alertViewShow];
        
    }
}

static BOOL isBackAction = NO;
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
    if ( !isBackAction ) {
        [self.tableView reloadRowsAtIndexPaths:arrIndexPath withRowAnimation:UITableViewRowAnimationLeft];
    } else {
        [self.tableView reloadRowsAtIndexPaths:arrIndexPath withRowAnimation:UITableViewRowAnimationRight];
    }
    
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
        cell.userInteractionEnabled = NO;
        NSMutableString *titleQues = [NSMutableString stringWithFormat:@"Câu %ld. ", (long)_numberQuesPresent + 1];
        [titleQues insertString:_question.contentQuestion atIndex:titleQues.length];
        lblContent.text = titleQues;
    } else {
        cell.userInteractionEnabled = YES;
        Answers *ans = [_listAnswers objectAtIndex:indexPath.row - 1];
        lblContent.text = ans.contentAnswer;
    }
    
    [self updateCell:cell];
    return cell;
}

#pragma mark - fit size cell

- (float)updateCell : (UITableViewCell *)cell
{
    UILabel *lbl = [cell.contentView viewWithTag:101];
    
    lbl.frame = CGRectMake(lbl.frame.origin.x, lbl.frame.origin.y, cell.frame.size.width*2/3, 20);
    
    [lbl sizeToFit];
    return lbl.frame.size.height + 20;
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row != 0) {
        // Get indexPath selected
        NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
        // Setup Row Selected
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        UILabel *lblContentAns = [cell.contentView viewWithTag:101];
        lblContentAns.textColor = [UIColor blueColor];
        // Setup Transform
        lblContentAns.font = [UIFont fontWithName:@"System" size:40];
        lblContentAns.transform = CGAffineTransformScale(lblContentAns.transform, .25, .25);
        [UIView animateWithDuration:0.5f animations:^{
            lblContentAns.transform = CGAffineTransformScale(lblContentAns.transform, 4.0, 4.0);
        } completion:^(BOOL finished) {
            lblContentAns.font = [UIFont fontWithName:@"System" size:17];
            lblContentAns.transform = CGAffineTransformScale(lblContentAns.transform, 1.0, 1.0);
        }];
        
        cell.userInteractionEnabled = NO;
        
        // Reset Different Rows
        for(int i = 1; i <= 4; i++) {
            NSIndexPath *indexPathForRow = [NSIndexPath indexPathForRow:i inSection:0];
            if( indexPathForRow != selectedIndexPath ) {
                cell = [tableView cellForRowAtIndexPath:indexPathForRow];
                cell.userInteractionEnabled = YES;
                lblContentAns = [cell.contentView viewWithTag:101];
                lblContentAns.textColor = [UIColor blackColor];
            }
        }
        //Setup Button
        _btnContinue.enabled = YES;
        _btnContinue.alpha = 1.0f;
        _indexAnsSelected = indexPath.row;
    }
}

- (void)backAction:(id)sender
{
    if(_numberQuesPresent <= 0)
    {
        [self backVC];
    }
    else if (_numberQuesPresent > 0) {
        _numberQuesPresent = _numberQuesPresent - 2;
        
        if(_numberQuesPresent < 0){
            [self backVC];
        }
        else {
            isBackAction = YES;
            [self updateDataCell];
            isBackAction = NO;
        }
    }
    
}

#pragma mark - Push And Pop ViewController

- (void)backVC
{
    if (!self.navigationController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)pushVC
{
    // Push VC
    ResultLevelViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ResultLevelViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
