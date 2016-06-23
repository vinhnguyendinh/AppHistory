//
//  QuestionViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@property NSInteger numberAns;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingOfBtnContinue;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self CustomButton];
    _numberAns = 4;
}

// Custom Button
- (void)CustomButton
{
    _btnContinue.layer.cornerRadius = 15.0f;
    _leadingOfBtnContinue.constant = (self.view.frame.size.width - 110) / 2;
}

// Logic next question
- (IBAction)btnContinueClicked:(id)sender {
    
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
   
    if(indexPath.row % (_numberAns+1) == 0) {
        lblContent.text = @"Cau hoi";
    } else if(indexPath.row % (_numberAns+1) == 1) {
        lblContent.text = @"Dap an 1";
    } else if(indexPath.row % (_numberAns+1) == 2) {
        lblContent.text = @"Dap an 2";
    } else if(indexPath.row % (_numberAns+1) == 3) {
        lblContent.text = @"Dap an 3";
    } else if(indexPath.row % (_numberAns+1) == 4) {
        lblContent.text = @"Dap an 4";
    }
    
    return cell;
}


@end
