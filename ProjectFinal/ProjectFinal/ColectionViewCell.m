//
//  ColectionViewCell.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/25/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "ColectionViewCell.h"
#import "BasedTableViewController.h"
#import "LeftMenuViewController.h"


@interface ColectionViewCell ()

@end

@implementation ColectionViewCell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UICollectionViewScrollDirectionHorizontal;
    
    self.arrColorName = @[@"Red",
                          @"Pink",
                          @"Purple",
                          @"Deep Purple",
                          @"Indigo",
                          @"Blue",
                          @"Light Blue",
                          @"Cyan",
                          @"Teal",
                          @"Green",
                          @"Light Green",
                          @"Lime",
                          @"Amber",
                          @"Orange",
                          @"Deep Orange",
                          @"Blue Grey",
                          @"Brown",
                          @"Black",
                          @"900",
                          @"A400",
                          @"A700",
                          @"A701",
                          @"A401",
                          @"700",
                          @"600",
                          @"900",
                          @"500",
                          @"A402",
                          @"A404",
                          @"200"];
    self.arrColorValue = @[@"#F44336",
                           @"#EC407A",
                           @"#9C27B0",
                           @"#673AB7",
                           @"#3F51B5",
                           @"#2196F3",
                           @"#03A9F4",
                           @"#00BCD4",
                           @"#009688",
                           @"#4CAF50",
                           @"#8BC34A",
                           @"#CDDC39",
                           @"#FFC107",
                           @"#FF9800",
                           @"#FF5722",
                           @"#795548",
                           @"#607DBB",
                           @"#000000",
                           @"#1B5E20",
                           @"#00E676",
                           @"#1DE9B6",
                           @"#00BFA5",
                           @"#76FF03",
                           @"#5D4037",
                           @"#546E7A",
                           @"#212121",
                           @"#9E9E9E",
                           @"#D500F9",
                           @"#FF1744",
                           @"#F48FB1"];
    
    self.numberRowInSection = @{@(0): @(self.arrColorName.count)};
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5*6;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [Utils colorFromHex:self.arrColorValue[indexPath.row]];
    
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(collectionView.frame.size.width /4, collectionView.frame.size.width /4);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strColor = self.arrColorValue[indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:strColor forKey:kUD_MainColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [StaticData sharedInstance].mainColor = [Utils colorFromHex:self.arrColorValue[indexPath.row]];
    
    [[LeftMenuViewController shareInstance] refreshColor];
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.numberRowInSection.allKeys.count;
}

@end
