//
//  QuestionSQLite.m
//  ProjectFinal
//
//  Created by Vinh Nguyen Dinh on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import "QuestionSQLite.h"

@implementation QuestionSQLite

- (instancetype)initWithId:(NSInteger)anId andQues:(NSString *)ques andAnsA:(NSString *)a andAnsB:(NSString *)b andAnsC:(NSString *)c andAnsD:(NSString *)d
{
    self = [super init];
    
    if ( self ) {
        _questionId = anId;
        _contentQuestion = ques;
        _answerA = a;
        _answerB = b;
        _answerC = c;
        _answerD = d;
    }
    
    return self;
}

#pragma mark - Database methods

/*

 CREATE TABLE "Question" (
	`Id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`contentQuestion`	TEXT,
	`A`	TEXT,
	`B`	TEXT,
	`C`	TEXT,
	`D`	TEXT
 )
 
*/


+ (void)loadQuestionsFromDBCompletionBlock:(void (^)(NSArray *))completionHandler;
{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[APPDELEGATE databasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM Question;"];
        
        NSMutableArray *listQuestions = [[NSMutableArray alloc]init];
        //iterate the loop
        while ([rs next]) {
            NSInteger quesId = [rs intForColumn:@"Id"];
            NSString *question = [rs stringForColumn:@"contentQuestion"];
            NSString *ansA = [rs stringForColumn:@"A"];
            NSString *ansB = [rs stringForColumn:@"B"];
            NSString *ansC = [rs stringForColumn:@"C"];
            NSString *ansD = [rs stringForColumn:@"D"];
            
            QuestionSQLite *ques = [[QuestionSQLite alloc]initWithId:quesId andQues:question andAnsA:ansA andAnsB:ansB andAnsC:ansC andAnsD:ansD];
            
            [listQuestions addObject:ques];
            
        }
        
        NSLog(@"Questions count: %ld", listQuestions.count);
        
        //pass result out
        completionHandler(listQuestions);
        
    }];
    
}

+ (void)addQuestionToDB:(QuestionSQLite *)question error:(NSError **)error
{
    if (question == nil) {
        //ERROR contact is nil, cannot add to database
        *error = [NSError errorWithDomain:@"abc" code:-1 userInfo:nil];
        
        return;
    }
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[APPDELEGATE databasePath]];
    
    [queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"INSERT INTO Question(contentQuestion, A, B, C, D) VALUES(?, ?, ?, ?, ?) ;", question.contentQuestion, question.answerA, question.answerB, question.answerC, question.answerD];
        
        if (!result) {
            //FAIL
            //get error out
            *error = [db lastError];
            
        }
        
    }];
}


+ (void)updateQuestionDB:(QuestionSQLite *)question error:(NSError **)error
{
    
    if (question == nil) {
        //ERROR contact is nil, cannot add to database
        *error = [NSError errorWithDomain:@"abc" code:-1 userInfo:nil];
        
        return;
    }
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[APPDELEGATE databasePath]];
    
    [queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"UPDATE Question SET contentQuestion = ?, A = ?, B = ?, C = ?, D = ? WHERE Id = ? ;", question.contentQuestion, question.answerA, question.answerB, question.answerC, question.answerD, [NSNumber numberWithInteger:question.questionId]];
        
        if (!result) {
            //FAIL
            //get error out
            *error = [db lastError];
            
        }
        
    }];
    
}

+ (void)deleteQuestionFromDB:(QuestionSQLite *)question error:(NSError **)error
{
    if (question == nil) {
        //ERROR contact is nil, cannot add to database
        *error = [NSError errorWithDomain:@"abc" code:-1 userInfo:nil];
        
        return;
    }
    
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[APPDELEGATE databasePath]];
    
    [queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"DELETE FROM Question WHERE Id = ? ;", [NSNumber numberWithInteger:question.questionId]];
        
        if (!result) {
            //FAIL
            //get error out
            *error = [db lastError];
        }
        
    }];
}

@end
