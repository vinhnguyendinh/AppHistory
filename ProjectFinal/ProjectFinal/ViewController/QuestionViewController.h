//
//  QuestionViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"
#import "QuestionLib.h"
#import "MainViewController.h"
#import "LevelViewController.h"
#import "ResultLevelViewController.h"

@interface QuestionViewController : BasedTableViewController

@property NSInteger numberQuesPresent;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

- (IBAction)btnContinueClicked:(id)sender;
+ (QuestionViewController *)sharedInstance;

@property NSArray *listAnsChoose;
@property NSInteger countTrue;
@property NSString *strTitleBtn;
@property NSInteger numberAns;
@property NSInteger indexAnsSelected;
@property Level *level;
@property Question *question;
@property NSMutableArray *listAnswers;


@property NSInteger minute;
@property NSInteger second;
@property NSMutableArray *listAnswersSelected;

@end
