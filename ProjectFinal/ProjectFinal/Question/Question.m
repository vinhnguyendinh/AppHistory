//
//  Question.m
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "Question.h"
#import "FMDB.h"
#import "AppDelegate.h"
#import "sqlite3.h"
#import "QuestionLib.h"

@implementation Question

- (instancetype)initWithNumAns:(NSInteger)numAns andIdQues:(NSInteger)idQues andContQues:(NSString *)contQues
{
    self = [super init];
    
    if ( self ) {
        _numberAnswer = numAns;
        _idQuestion = idQues;
        _contentQuestion = contQues;
        _answerTrue = @"";
        _scoreOfQues = 1;
        _listAnswers = [[NSMutableArray alloc]init];
    }
    
    return self;
}

#pragma mark - Database methods

/*
 
 CREATE TABLE "Question" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`contentQuestion`	TEXT NOT NULL,
	`A`	TEXT NOT NULL,
	`B`	TEXT NOT NULL,
	`C`	TEXT NOT NULL,
	`D`	TEXT NOT NULL,
	`Result`	TEXT NOT NULL
 )
 
 */

+ (void)loadQuestionsFromDBCompletionBlock:(void (^)(NSArray *))completionHandler
{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[APPDELEGATE databasePath]];
    
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM Question;"];
        
        NSMutableArray *listQuestions = [[NSMutableArray alloc]init];
        //iterate the loop
        while ([rs next]) {
            NSInteger quesId = [rs intForColumn:@"Id"];
            NSString *contQues = [rs stringForColumn:@"contentQuestion"];
            NSString *contA = [rs stringForColumn:@"A"];
            NSString *contB = [rs stringForColumn:@"B"];
            NSString *contC = [rs stringForColumn:@"C"];
            NSString *contD = [rs stringForColumn:@"D"];
            NSString *res = [rs stringForColumn:@"Result"];
            
            // Init Answers
            Answers *answerA = [[Answers alloc]initWithNameAns:@"A" andcontAns:contA];
            Answers *answerB = [[Answers alloc]initWithNameAns:@"B" andcontAns:contB];
            Answers *answerC = [[Answers alloc]initWithNameAns:@"C" andcontAns:contC];
            Answers *answerD = [[Answers alloc]initWithNameAns:@"D" andcontAns:contD];
            
            // Init Question
            Question *ques = [[Question alloc]initWithNumAns:4 andIdQues:quesId andContQues:contQues];
            ques.answerTrue = res;
            
            // Add Answers to Question
            [ques.listAnswers addObject:answerA];
            [ques.listAnswers addObject:answerB];
            [ques.listAnswers addObject:answerC];
            [ques.listAnswers addObject:answerD];
            
            // Add question to list question
            [listQuestions addObject:ques];
            
        }
        
        NSLog(@"Questions count: %ld", listQuestions.count);
        
        //pass result out
        completionHandler(listQuestions);
        
    }];
}

@end
