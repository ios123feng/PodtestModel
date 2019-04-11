//
//  questionOfSurveyModel.h
//  iFoxEKnown
//
//  Created by Hao on 2017/11/8.
//  Copyright © 2017年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface questionOfSurveyModel : NSObject

@property(nonatomic,copy)NSString *TYPE;//题目类型
@property(nonatomic,copy)NSString *STATUS;//用戶id

@property(nonatomic,copy)NSString *OPTION1;
@property(nonatomic,copy)NSString *OPTION2;
@property(nonatomic,copy)NSString *OPTION3;
@property(nonatomic,copy)NSString *OPTION4;
@property(nonatomic,copy)NSString *OPTION5;
@property(nonatomic,copy)NSString *OPTION6;

@property(nonatomic,copy)NSString *ID1;
@property(nonatomic,copy)NSString *ID2;
@property(nonatomic,copy)NSString *QUESTION;

@property(nonatomic,copy)NSString *ITEM;//题目序号

@property(nonatomic,copy)NSString *ANSWER;

@end
