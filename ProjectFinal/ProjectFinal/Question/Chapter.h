//
//  Chapter.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/23/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chapter : NSObject

@property                     NSInteger numberLevel;
@property(nonatomic, strong)  NSMutableArray *listLevels;
@property                     BOOL isLocked;

- (instancetype)initWithNumbLevel:(NSInteger)numberLev;

@end
