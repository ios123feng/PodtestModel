//
//  UserResultInfoModel.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/5.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserResultInfoModel : NSObject<NSCoding>

@property(nonatomic,retain)NSString *deptName;
@property(nonatomic,retain)NSString *email;
@property(nonatomic,retain)NSString *userName;//用戶姓名
@property(nonatomic,retain)NSString *headShip;
@property(nonatomic,retain)NSString *inFoxconnDate;
@property(nonatomic,retain)NSString *phoneNumber;
@property(nonatomic,retain)NSString *postLevel;
@property(nonatomic,retain)NSString *qqNum;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *weixinNum;
@property(nonatomic,retain)NSString *workYears;
@property(nonatomic,retain)NSString *bgCode;//用戶所屬事業群

@end
