//
//  Answers.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "Answers.h"

@implementation Answers

- (instancetype)initWithNameAns:(NSString *)name andcontAns:(NSString *)contAns
{
    self = [super init];
    
    if ( self ) {
        _nameAnswer = name;
        _contentAnswer = contAns;
        _isChoos = NO;
    }
    
    return self;
}

@end
