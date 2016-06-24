//
//  QuestionViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"

@interface QuestionViewController : BasedTableViewController

@property NSInteger numberQuesPresent;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;

- (IBAction)btnContinueClicked:(id)sender;

@end
