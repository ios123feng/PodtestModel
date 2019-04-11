//
//  WorkDAL.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/4.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkReponseModel.h"

typedef enum {
    EmpCardInfo,//刷卡信息
    EmpOverTimeInfo,//加班信息
    EmpLeaveInfo,//請假信息
    EmpWorkDateInfo,//排班信息
    EmpChangeWorkInfo,//調班信息
    EmpSubrrEgionInfo,//分區刷卡記錄
    EmpAttendceExceptionInfo,//異常信息
    EmpMoveRestInfo,//調休信息
    EmpRewardsPunishmentInfo,//獎懲信息
    EmpContractInfo,//包工分红
    
    FRMEMPCARD,          //八個外幹的接口
    FRMEMPINFO,
    FRMEMPARRANCE,
    FRMEMPWORKREST,
    FRMEMPTRAVE,
    FRMEMPLEAVE,
    FRMEMPYEARLEAVE,
    FRMAREASUBSIDY,
    Error
}EmpInfoDetail;//工作生活詳細信息枚舉標示

@interface WorkDAL : NSObject

@property(nonatomic,assign)EmpInfoDetail empWorkInfo;

-(id)init:(EmpInfoDetail)empInfoDetail;
-(WorkReponseModel *)parseWorkLifeList:(id)result;


@end
