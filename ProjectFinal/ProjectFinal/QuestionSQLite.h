//
//  QuestionSQLite.h
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fmdb/FMDB.h"
#import "AppDelegate.h"

@interface QuestionSQLite : NSObject

@property(nonatomic, assign)    NSInteger     questionId;
@property(nonatomic, copy)      NSString   *  contentQuestion;
@property(nonatomic, copy)      NSString   *  answerA;
@property(nonatomic, copy)      NSString   *  answerB;
@property(nonatomic, copy)      NSString   *  answerC;
@property(nonatomic, copy)      NSString   *  answerD;

- (instancetype)initWithId:(NSInteger)anId andQues:(NSString*)ques andAnsA:(NSString*)a andAnsB:(NSString*)b andAnsC:(NSString*)c andAnsD:(NSString*)d;

+ (void)loadQuestionsFromDBCompletionBlock:(void(^)(NSArray *questions))completionHandler;

+ (void)addQuestionToDB:(QuestionSQLite *)question error:(NSError **)error;

+ (void)updateQuestionDB:(QuestionSQLite *)question error:(NSError **)error;

+ (void)deleteQuestionFromDB:(QuestionSQLite *)question error:(NSError **)error;


@end
