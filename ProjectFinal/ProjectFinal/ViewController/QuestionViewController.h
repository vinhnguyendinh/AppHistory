//
//  QuestionViewController.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tblQuestions;

@end
