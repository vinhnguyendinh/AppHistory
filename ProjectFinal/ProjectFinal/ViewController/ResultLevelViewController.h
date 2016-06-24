//
//  ResultLevelViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/24/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"

@interface ResultLevelViewController : BasedTableViewController
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
- (IBAction)btnContinueClicked:(id)sender;

@end
