//
//  Level.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "Level.h"
#import "Question.h"

@implementation Level

- (instancetype)initWithNumbQues:(NSInteger)numbQues andMinScoreToPass:(NSInteger)minScore andStartId:(NSInteger)start andEndId:(NSInteger)end
{
    self = [super init];
    
    if ( self ) {
        _isLocked = YES;
        _numberQuestion = numbQues;
        _minScoreToPass = minScore;
        _startId = start;
        _endId = end;
        _listQuestions = [[NSMutableArray alloc]init];
    }
    
    return self;
}


@end
