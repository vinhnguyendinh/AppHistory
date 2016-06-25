//
//  MusicViewController.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/25/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()


@end

@implementation MusicViewController

@synthesize switchTrackButton;
@synthesize trackIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [SoundManager sharedManager].allowsBackgroundMusic = YES;
    [[SoundManager sharedManager] prepareToPlay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playSound1:(__unused UIButton *)sender
{
    [[SoundManager sharedManager] playSound:@"sound1" looping:NO];
}


@end
