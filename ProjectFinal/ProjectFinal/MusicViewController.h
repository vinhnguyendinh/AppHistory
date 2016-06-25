//
//  MusicViewController.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/25/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundManager.h"

@interface MusicViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *switchTrackButton;
@property (nonatomic, assign) NSUInteger trackIndex;

- (IBAction)playPauseMusic:(UIButton *)sender;
- (IBAction)switchTrack:(UIButton *)sender;
- (IBAction)playSound1:(UIButton *)sender;
- (IBAction)playSound2:(UIButton *)sender;
- (IBAction)setSoundVolume:(UISlider *)sender;
- (IBAction)setMusicVolume:(UISlider *)sender;

@end
