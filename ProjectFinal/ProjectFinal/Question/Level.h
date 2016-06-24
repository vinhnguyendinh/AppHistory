//
//  Level.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property(nonatomic, strong)    NSMutableArray    *listQuestions;
@property                       NSInteger         Score;
@property                       NSInteger         numberQuestion;
@property                       NSInteger         minScoreToPass;
@property                       NSInteger         startId;
@property                       NSInteger         endId;


- (instancetype)initWithNumbQues:(NSInteger)numbQues andMinScoreToPass:(NSInteger)minScore andStartId:(NSInteger)start andEndId:(NSInteger)end;

@end
