//
//  Question.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSInteger numberAnswer;
@property NSInteger idQuestion;
@property NSString *contentQuestion;
@property NSArray *answer;
@property NSString *answerTrue;

//- (instancetype)initWithNumAns:(NSInteger*)numAns andIdQues:(NSInteger*)idQues andContQues:(NSString*)contQues and
@end
