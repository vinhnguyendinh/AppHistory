//
//  LevelViewController.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/23/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//
#import "BasedTableViewController.h"
#import "Question/QuestionLib.h"

@interface LevelViewController : BasedTableViewController

@property Level *levelSelected;

+ (LevelViewController *)sharedInstance;

@end
