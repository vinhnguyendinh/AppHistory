//
//  QuestionViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuestionSQLite.h"

@interface QuestionViewController ()

@property(nonatomic, strong)    NSMutableArray *listQuestions;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", [APPDELEGATE databasePath]);
    [self assignBarItems];
    
    [self reloadDataWillReloadTableView:YES];
}

- (void)assignBarItems;
{
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addItemDidTap:)];
    
    self.navigationItem.rightBarButtonItem = barItem;
    self.navigationItem.rightBarButtonItems = @[self.editButtonItem, barItem];
}

- (void)addItemDidTap:(id)sender;
{
    QuestionSQLite *newQuestion = [[QuestionSQLite alloc]initWithId:-1 andQues:@"Tên của bố bạn là gì ?" andAnsA:@"Nguyễn Văn A" andAnsB:@"Nguyễn Văn B"  andAnsC:@"Nguyễn Văn C"  andAnsD:@"Nguyễn Văn D" andResult:@"D"];
    
    NSError *error = nil;
    [QuestionSQLite addQuestionToDB:newQuestion error:&error];
    
    if(error != nil) {
        NSLog(@"ERROR add Question: %@", error);
    }
    else {
        // ADD SUCCESS
       
        // insert row with animation
        [_tblQuestions beginUpdates];
        
        NSIndexPath *indexPathInsert = [NSIndexPath indexPathForRow:_listQuestions.count inSection:0];
        
        [_tblQuestions insertRowsAtIndexPaths:@[indexPathInsert] withRowAnimation:UITableViewRowAnimationLeft];
        
        // reload data
        [self reloadDataWillReloadTableView:NO];
        
        [_tblQuestions endUpdates];
    }
}


- (void)reloadDataWillReloadTableView:(BOOL)willReloadTable;
{
    [QuestionSQLite loadQuestionsFromDBCompletionBlock:^(NSArray *questions) {
        
        self.listQuestions = [[NSMutableArray alloc]initWithArray:questions];
        
        if (willReloadTable) {
            //reload tableview
            [self.tblQuestions reloadData];
        }
    }];
    
}


///editing state
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    [self.tblQuestions setEditing:editing animated:animated];
    
    
}

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listQuestions.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //get out subview
    UILabel *lblQuestion =  [cell.contentView viewWithTag:100];
    UILabel *lblAnsA =   [cell.contentView viewWithTag:101];
    UILabel *lblAnsB  = [cell.contentView viewWithTag:102];
    UILabel *lblAnsC  = [cell.contentView viewWithTag:103];
    UILabel *lblAnsD  = [cell.contentView viewWithTag:104];
    
    QuestionSQLite *ques = [self.listQuestions objectAtIndex:indexPath.row];
    
    lblQuestion.text = ques.contentQuestion;
    lblAnsA.text = ques.answerA;
    lblAnsB.text = ques.answerB;
    lblAnsC.text = ques.answerC;
    lblAnsD.text = ques.answerD;
    
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


//editing

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!tableView.isEditing) {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        QuestionSQLite *questionToDelete = [self.listQuestions objectAtIndex:indexPath.row];
        
        [self.listQuestions removeObjectAtIndex:indexPath.row];
        
        NSError *error = nil;
        [QuestionSQLite deleteQuestionFromDB:questionToDelete error:&error];
        
        if( error != nil ) {
            NSLog(@"ERROR delete Question: %@", error);
        }
        else {
            // Delete success
            
            
            // delete row of tableView
            [_tblQuestions beginUpdates];
            
            NSIndexPath *indexPathDelete = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            [_tblQuestions deleteRowsAtIndexPaths:@[indexPathDelete] withRowAnimation:UITableViewRowAnimationLeft];
            
            // reload data
            [self reloadDataWillReloadTableView:NO];
            
            [_tblQuestions endUpdates];
        }
    }
    
}

@end
