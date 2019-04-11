//
//  UserInfoDAL.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/5.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "UserInfoDAL.h"

@implementation UserInfoDAL

-(UserResultInfoModel *)parseUserInfoByData:(id)resultData
{
    UserResultInfoModel *userResultInfoModel=nil;
    if([resultData isKindOfClass:[NSArray class]])
    {
        userResultInfoModel=[[UserResultInfoModel alloc]init];
        
        userResultInfoModel.deptName=[[resultData objectAtIndex:0] objectForKey:@"DEPT_NAME"];
        userResultInfoModel.email=[[resultData objectAtIndex:0] objectForKey:@"EMAIL"];
        userResultInfoModel.userName=[[resultData objectAtIndex:0] objectForKey:@"EMP_NAME"];
        userResultInfoModel.headShip=[[resultData objectAtIndex:0] objectForKey:@"HEAD_SHIP"];
        userResultInfoModel.inFoxconnDate=[[resultData objectAtIndex:0] objectForKey:@"IN_FOXCONN_DATE"];
        userResultInfoModel.phoneNumber=[[resultData objectAtIndex:0] objectForKey:@"PHONE_NUMBER"];
        userResultInfoModel.postLevel=[[resultData objectAtIndex:0] objectForKey:@"POST_LEVEL"];
        userResultInfoModel.qqNum=[[resultData objectAtIndex:0] objectForKey:@"QQ_NUM"];
        userResultInfoModel.status=[[resultData objectAtIndex:0] objectForKey:@"STATUS"];
        userResultInfoModel.weixinNum=[[resultData objectAtIndex:0] objectForKey:@"WEIXIN_NUM"];
        userResultInfoModel.workYears=[[resultData objectAtIndex:0] objectForKey:@"WORK_YEARS"];
        userResultInfoModel.bgCode=[[resultData objectAtIndex:0] objectForKey:@"BG_CODE"];
        
    }
    return userResultInfoModel;

}

@end
