//
//  Answers.h
//  ProjectFinal
//
//  Created by Nguyen Duc Tai on 6/21/16.
//  Copyright © 2016 VinhNguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answers : NSObject

@property NSString *nameAnswer;
@property NSString *contentAnswer;
@property BOOL isChoos;

- (instancetype)initWithNameAns:(NSString*)name andcontAns:(NSString*)contAns;

@end
