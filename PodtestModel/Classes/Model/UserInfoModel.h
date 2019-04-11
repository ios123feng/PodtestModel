//
//  UserInfoModel.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/4/29.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserResultInfoModel.h"

@interface UserInfoModel : NSObject<NSCoding>

@property(nonatomic,retain)NSString *userID;//用戶id
@property(nonatomic,retain)NSString *userIDKey;//用戶id加密後的key
//@property(nonatomic,retain)NSString *userPwd;//用戶密碼
@property(nonatomic,retain)NSString *userPwdKey;//用戶密碼加密後的key
@property(nonatomic,retain)NSString *userBG;//用戶所在事業群
@property(nonatomic,retain)NSString *userFactory;//用戶所在廠區
@property(nonatomic,retain)NSString *userKey;//加密匙鑰

@property(nonatomic,retain)UserResultInfoModel *userResultModel;

@end
