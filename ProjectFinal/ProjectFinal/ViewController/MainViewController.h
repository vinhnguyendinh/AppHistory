//
//  MainViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"

@interface MainViewController : BasedTableViewController

@property(nonatomic, strong)    NSMutableArray *listQuestions;
@property(nonatomic, strong)    NSMutableArray *listLevels;
@property(nonatomic, strong)    NSMutableArray *listChapters;
@property       NSInteger numberChapter;

+ (MainViewController *) sharedInstance;

@end
