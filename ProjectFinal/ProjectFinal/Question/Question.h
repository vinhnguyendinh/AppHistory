//
//  Question.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property                       NSInteger           numberAnswer;
@property                       NSInteger           idQuestion;
@property                       NSString       *    contentQuestion;
@property(nonatomic, strong)    NSMutableArray *    listAnswers;
@property                       NSString       *    answerTrue;
@property                       NSInteger           scoreOfQues;

- (instancetype)initWithNumAns:(NSInteger)numAns andIdQues:(NSInteger)idQues andContQues:(NSString*)contQues;

+ (void)loadQuestionsFromDBCompletionBlock:(void(^)(NSArray *questions))completionHandler;

@end
