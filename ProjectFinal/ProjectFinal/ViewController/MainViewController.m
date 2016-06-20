//
//  MainViewController.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/6/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "MainViewController.h"

@class SWRevealViewController;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
//
//- (void)btnEditClicked:(id)sender
//{ 
//}

@end
