//
//  WorkModel.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/4/30.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkModel : NSObject

@end

//刷卡信息Model
@interface CardModel : NSObject

@property(nonatomic,retain)NSString *cardDate;
@property(nonatomic,retain)NSString *cardPlace;
@property(nonatomic,retain)NSString *cardTime;
@property(nonatomic,retain)NSString *collectTime;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *subCard;
@property(nonatomic,retain)NSString *isLate;

@end

//加班信息Model
@interface OverTimeModel : NSObject

@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *overTimeHours;
@property(nonatomic,retain)NSString *overTimeType;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *workDate;

@end

//請假信息Model
@interface LeaveModel : NSObject

@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *isInvalid;//是否銷假
@property(nonatomic,retain)NSString *leaveHours;//請假小時數
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *workDate;
@property(nonatomic,retain)NSString *leaveType;//请假类型

@end

//排班信息Model
@interface WorkDateModel : NSObject

@property(nonatomic,retain)NSString *dateType;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *workDate;
@property(nonatomic,retain)NSString *workTime1;
@property(nonatomic,retain)NSString *workTime2;
@property(nonatomic,retain)NSString *workTime3;
@property(nonatomic,retain)NSString *workTime4;
@property(nonatomic,retain)NSString *workTime5;
@property(nonatomic,retain)NSString *workType;

@end

//調班信息Model
@interface ChangeWorkModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *workDate;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *changeWorkHours;
@property(nonatomic,retain)NSString *repairWorkDate;
@property(nonatomic,retain)NSString *repairStartTime;
@property(nonatomic,retain)NSString *repairEndTime;

@end

//分區刷卡信息Model
@interface SubrRegionModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *regionPlace;
@property(nonatomic,retain)NSString *regionType;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *endTime;

@end

//異常信息Model
@interface AttendceExceptionModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *workDate;
@property(nonatomic,retain)NSString *dateType;
@property(nonatomic,retain)NSString *hwtCode;
@property(nonatomic,retain)NSString *hwtType;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *firstStartTime;
@property(nonatomic,retain)NSString *onDutyResult;
@property(nonatomic,retain)NSString *delayTime;
@property(nonatomic,retain)NSString *onDutyOpen;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *secondEndTime;
@property(nonatomic,retain)NSString *offDutyResult;
@property(nonatomic,retain)NSString *earlyTime;
@property(nonatomic,retain)NSString *offDutyOpen;

@end

//調休信息Model
@interface MoveRestModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *workDate;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *moveRestHours;
@property(nonatomic,retain)NSString *reason;

@end


//獎罰信息Model
@interface RewardsPunishmentModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *closeDate;
@property(nonatomic,retain)NSString *rapTime;
@property(nonatomic,retain)NSString *rapLevel;
@property(nonatomic,retain)NSString *rapReason;

@end

//行程管理
@interface FrmArranceModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *journeyDay;    //日期
@property(nonatomic,retain)NSString *joruneyType;   //类型
@property(nonatomic,retain)NSString *flight;        //航班
@property(nonatomic,retain)NSString *startEndTime;  //起讫时间
@property(nonatomic,retain)NSString *startEndPlace; //起讫地点

@end

//返乡述职／休假
@interface FrmWorkRestModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *restTime;      //休假时间
@property(nonatomic,retain)NSString *restDays;      //休假天数
@property(nonatomic,retain)NSString *travelTime;    //本次出差期间
@property(nonatomic,retain)NSString *travelDays;    //本次出差天数
@property(nonatomic,retain)NSString *cumTravelDays; //本年累计出差天数


@end

//出差信息
@interface FrmTravelModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *formType;   //类型
@property(nonatomic,retain)NSString *travelDate; //出差日期
@property(nonatomic,retain)NSString *travelArea; //目的地
@property(nonatomic,retain)NSString *travelDays; //本次累积天数



@end

//年休假信息
@interface FrmYearLeaveModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;
@property(nonatomic,retain)NSString *leaveType;   //类型
@property(nonatomic,retain)NSString *provideDays; //规定天数
@property(nonatomic,retain)NSString *totalDays;   //已休天数
@property(nonatomic,retain)NSString *residueDays; //剩余天数

@end


//請假信息
@interface FrmLeaveModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;

@property(nonatomic,retain)NSString *leaveDay;
@property(nonatomic,retain)NSString *leaveType;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *endTiem;
@property(nonatomic,retain)NSString *invalid;
@property(nonatomic,retain)NSString *actualTime;

@end


//請假信息
@interface FrmCardModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *empNo;
@property(nonatomic,retain)NSString *empName;

@property(nonatomic,retain)NSString *cardDate;
@property(nonatomic,retain)NSString *cardAddress;
@property(nonatomic,retain)NSString *cardTime;
@property(nonatomic,retain)NSString *collectionTime;

@end

//包工分红Model
@interface ContractModel : NSObject

@property(nonatomic,retain)NSString *contractTime;     //包工时间
@property(nonatomic,retain)NSString *lineName;         //包工线体
@property(nonatomic,retain)NSString *squadType;        //班别
@property(nonatomic,retain)NSString *contractType;     //包工类型
@property(nonatomic,retain)NSString *contractDividend; //分红收益

@end

















