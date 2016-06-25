//
//  ResultLevelViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/24/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "ResultLevelViewController.h"
#import "QuestionViewController.h"
#import "QuestionLib.h"
#import "LevelViewController.h"
#import "SoundManager.h"
#import "MusicViewController.h"

@implementation ResultLevelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // insert code right here
    [self customButton];
    
    self.strTitle = @"Kết quả";
    
    _listAnswersSelected = [[NSMutableArray alloc]initWithArray:[QuestionViewController sharedInstance].listAnswersSelected];
    _listQuestions = [[NSMutableArray alloc]initWithArray:
    [QuestionViewController sharedInstance].level.listQuestions];
    [self CountsAnsTrue];
    NSLog(@" Score : %ld", (long)_Score);
    
    self.lblScore.text = [NSString stringWithFormat:@"%ld/10 Điểm",(long)_Score];
}

- (void)customButton
{
    // Setting Button
    _btnContinue.alpha = 0.5f;
    _btnContinue.enabled = NO;
}

- (IBAction)btnContinueClicked:(id)sender {
    // Pop VC Present
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void) CountsAnsTrue
{
    for (int i = 0; i < _listQuestions.count; i++) {
        Question *ques = [_listQuestions objectAtIndex:i];
        if ([ques.answerTrue isEqualToString:[_listAnswersSelected objectAtIndex:i]]) {
            _Score++;
        }
    }
}

- (IBAction)btnLamLai:(id)sender {
    LevelViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"LevelViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnNextLv:(id)sender {
    if((long)_Score < 6 ){
        
        [[SoundManager sharedManager] playSound:@"sound1" looping:YES];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Làm lại"
                  message:@"Bạn phải trả lời đúng 6/10"
                 delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        LevelViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"LevelViewController"];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
