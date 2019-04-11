//
//  UserResultInfoModel.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/5.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "UserResultInfoModel.h"

@implementation UserResultInfoModel

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_deptName forKey:@"deptName"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_headShip forKey:@"headShip"];
    [aCoder encodeObject:_inFoxconnDate forKey:@"inFoxconnDate"];
    [aCoder encodeObject:_phoneNumber forKey:@"phoneNumber"];
    
    [aCoder encodeObject:_postLevel forKey:@"postLevel"];
    [aCoder encodeObject:_qqNum forKey:@"qqNum"];
    [aCoder encodeObject:_status forKey:@"status"];
    [aCoder encodeObject:_weixinNum forKey:@"weixinNum"];
    [aCoder encodeObject:_workYears forKey:@"workYears"];
    [aCoder encodeObject:_bgCode forKey:@"BG_CODE"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        _deptName=[aDecoder decodeObjectForKey:@"deptName"];
        _email=[aDecoder decodeObjectForKey:@"email"];
        _userName=[aDecoder decodeObjectForKey:@"userName"];
        
        _headShip=[aDecoder decodeObjectForKey:@"headShip"];
        
        _inFoxconnDate=[aDecoder decodeObjectForKey:@"inFoxconnDate"];
        
        _phoneNumber=[aDecoder decodeObjectForKey:@"phoneNumber"];
        _postLevel =[aDecoder decodeObjectForKey:@"postLevel"];
        _qqNum=[aDecoder decodeObjectForKey:@"qqNum"];
        _status=[aDecoder decodeObjectForKey:@"status"];
        _weixinNum=[aDecoder decodeObjectForKey:@"weixinNum"];
        
        _workYears=[aDecoder decodeObjectForKey:@"workYears"];
        _bgCode=[aDecoder decodeObjectForKey:@"BG_CODE"];
    }
    return self;
}



@end
