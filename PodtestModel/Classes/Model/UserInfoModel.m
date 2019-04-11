//
//  UserInfoModel.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/4/29.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userBG forKey:@"userBG"];
    [aCoder encodeObject:_userID forKey:@"userID"];
    [aCoder encodeObject:_userIDKey forKey:@"userIDKey"];
    [aCoder encodeObject:_userPwdKey forKey:@"userPwdKey"];
    [aCoder encodeObject:_userFactory forKey:@"userFactory"];
    [aCoder encodeObject:_userKey forKey:@"userKey"];
    [aCoder encodeObject:_userResultModel forKey:@"userResultModel"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        _userBG=[aDecoder decodeObjectForKey:@"userBG"];
        _userID=[aDecoder decodeObjectForKey:@"userID"];
        _userIDKey=[aDecoder decodeObjectForKey:@"userIDKey"];
        _userPwdKey=[aDecoder decodeObjectForKey:@"userPwdKey"];
        _userFactory=[aDecoder decodeObjectForKey:@"userFactory"];
        _userKey=[aDecoder decodeObjectForKey:@"userKey"];
        _userResultModel =[aDecoder decodeObjectForKey:@"userResultModel"];
    }
    return self;
}


@end
