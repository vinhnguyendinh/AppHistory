//
//  ExamViewController.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/22/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()

@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.strTitle = @"Đề Thi";
     [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}

@end
