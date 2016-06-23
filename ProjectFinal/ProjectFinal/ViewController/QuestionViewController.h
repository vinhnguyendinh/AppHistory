//
//  QuestionViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"

@interface QuestionViewController : BasedTableViewController

- (IBAction)btnContinueClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;

@end
