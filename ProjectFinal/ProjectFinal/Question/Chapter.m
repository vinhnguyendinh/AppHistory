//
//  Chapter.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/23/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "Chapter.h"

@implementation Chapter

- (instancetype)initWithNumbLevel:(NSInteger)numberLev
{
    self = [super init];
    
    if ( self ) {
        _isLocked = YES;
        _numberLevel = numberLev;
        _listLevels = [[NSMutableArray alloc]init];
    }
    
    return self;
}


@end
