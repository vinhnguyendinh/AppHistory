//
//  LeftMenuViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "BasedTableViewController.h"

@interface LeftMenuViewController : BasedTableViewController

@property NSInteger previousRow;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

- (void) refreshColor;
+ (LeftMenuViewController *)shareInstance;

@end
