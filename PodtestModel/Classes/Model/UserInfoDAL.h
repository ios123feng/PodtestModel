//
//  UserInfoDAL.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/5.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "UserResultInfoModel.h"

@interface UserInfoDAL : NSObject

-(UserResultInfoModel *)parseUserInfoByData:(id)resultData;


@end
