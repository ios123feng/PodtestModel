//
//  WorkDAL.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/4.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "WorkDAL.h"
#import "WorkModel.h"

@implementation WorkDAL
@synthesize empWorkInfo;

-(id)init:(EmpInfoDetail)empInfoDetail
{
    self=[super init];
    if (self) {
        empWorkInfo=empInfoDetail;
    }
    
    return self;
}

//result是传入的json数据
-(WorkReponseModel *)parseWorkLifeList:(id)result
{
    NSMutableArray *dataList=nil;
    WorkReponseModel *workResponseModel=nil;
    if ([result isKindOfClass:[NSArray class]]) {
        
        workResponseModel=[[WorkReponseModel alloc] init];
        //判断是否有数据
        workResponseModel.status=[self judgeRequstResult:result];
        if (workResponseModel.status != nil) {
            //这句感觉没用
            workResponseModel.resultInfo=dataList;
            return workResponseModel;
        }
        dataList=[[NSMutableArray alloc] init];
        for (id item in result)
        {
            //如果result的 （即传入的json数据）子项是字典类型，
            if ([item isKindOfClass:[NSDictionary class]])
            {
                switch (empWorkInfo) {
                
                    case EmpCardInfo:
                        [dataList addObject:[self parseCardInfoList:item]];
                        break;
                    case EmpOverTimeInfo:
                        [dataList addObject:[self parseOverTimeInfoList:item]];
                        break;
                    case EmpLeaveInfo:
                        [dataList addObject:[self parseLeaveInfoList:item]];
                        break;
                    case EmpWorkDateInfo:
                        [dataList addObject:[self parseWorkDateInfoList:item]];
                        break;
                    case EmpChangeWorkInfo:
                        [dataList addObject:[self parseChangeWorkInfoList:item]];
                        break;
                    case EmpSubrrEgionInfo:
                        [dataList addObject:[self parseSubRegionInfoList:item]];
                        break;
                    case EmpAttendceExceptionInfo:
                        [dataList addObject:[self parseAttendceExceptionInfoList:item]];
                        break;
                    case EmpMoveRestInfo:
                        [dataList addObject:[self parseMoveRestInfoList:item]];
                        break;
                    case EmpRewardsPunishmentInfo:
                        [dataList addObject:[self parseRewardsPunishmentInfoList:item]];
                        break;
                    case EmpContractInfo:
                        [dataList addObject:[self parseContractInfoList:item]];
                        break;
                        
                    case FRMEMPCARD:
                        [dataList addObject:[self parseFrmCardInfoList:item]];
                        break;
                    case FRMEMPARRANCE:
                        [dataList addObject:[self parseArranceInfoList:item]];
                        break;
                    case FRMEMPWORKREST:
                        [dataList addObject:[self parseWorkRestInfoList:item]];
                        break;
                    case FRMEMPTRAVE:
                        [dataList addObject:[self parseTravelInfoList:item]];
                        break;
                    case FRMEMPLEAVE:
                        [dataList addObject:[self parseFrmLeaveInfoList:item]];
                        break;
                    case FRMEMPYEARLEAVE:
                        [dataList addObject:[self parseYearLeaveInfoList:item]];
                        break;
                        
                    default:
                        break;
                }
            }
            
        }
        
        workResponseModel.resultInfo=dataList;
    }

    return workResponseModel;
}

-(NSString *)judgeRequstResult:(id)result
{
    if ([result count] == 1 && [result isKindOfClass:[NSArray class]]) {
        //判斷只有一個值時是否有數據
        if ([[result objectAtIndex:0] isKindOfClass:[NSDictionary class]] && [[result objectAtIndex:0] allKeys].count == 1) {
            //無數據
            return [[result objectAtIndex:0] objectForKey:@"STATUS"];
        }
    }
    return nil;
}



//刷卡信息
-(CardModel *)parseCardInfoList:(id)resultItem
{
    CardModel *cardModel=[[CardModel alloc]init];
    cardModel.cardDate=[resultItem objectForKey:@"CARD_DATE"];
    cardModel.cardPlace=[resultItem objectForKey:@"CARD_PLACE"];
    cardModel.cardTime=[resultItem objectForKey:@"CARD_TIME"];
    cardModel.collectTime=[resultItem objectForKey:@"COLLECT_TIME"];
    cardModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    cardModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    cardModel.status=[resultItem objectForKey:@"STATUS"];
    cardModel.subCard=[resultItem objectForKey:@"SUB_CARD"];
    cardModel.isLate = [resultItem objectForKey:@"IS_LATE"];

    return cardModel;
}

//加班信息
-(OverTimeModel *)parseOverTimeInfoList:(id)resultItem
{
    OverTimeModel *overTimeModel=[[OverTimeModel alloc]init];
    overTimeModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    overTimeModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    overTimeModel.endTime=[resultItem objectForKey:@"END_TIME"];
    overTimeModel.overTimeHours=[resultItem objectForKey:@"OVERTIME_HOURS"];
    overTimeModel.overTimeType=[resultItem objectForKey:@"OVERTIME_TYPE"];
    overTimeModel.startTime=[resultItem objectForKey:@"START_TIME"];
    overTimeModel.status=[resultItem objectForKey:@"STATUS"];
    overTimeModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    
    return overTimeModel;
}

//請假信息
-(LeaveModel *)parseLeaveInfoList:(id)resultItem
{
    LeaveModel *leaveModel=[[LeaveModel alloc]init];
    leaveModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    leaveModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    leaveModel.endTime=[resultItem objectForKey:@"END_TIME"];
    leaveModel.isInvalid=[resultItem objectForKey:@"IS_INVALID"];
    leaveModel.leaveHours=[resultItem objectForKey:@"LEAVE_HOURS"];
    leaveModel.startTime=[resultItem objectForKey:@"START_TIME"];
    leaveModel.status=[resultItem objectForKey:@"STATUS"];
    leaveModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    leaveModel.leaveType=[resultItem objectForKey:@"LEAVE_TYPE"];
    
    return leaveModel;
}

//排班信息
-(WorkDateModel *)parseWorkDateInfoList:(id)resultItem
{

    WorkDateModel *workDateModel=[[WorkDateModel alloc]init];
    workDateModel.dateType=[resultItem objectForKey:@"DATE_TYPE"];
    workDateModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    workDateModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    workDateModel.status=[resultItem objectForKey:@"STATUS"];
    workDateModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    workDateModel.workTime1=[resultItem objectForKey:@"WORK_TIME1"];
    workDateModel.workTime2=[resultItem objectForKey:@"WORK_TIME2"];
    workDateModel.workTime3=[resultItem objectForKey:@"WORK_TIME3"];
    workDateModel.workTime4=[resultItem objectForKey:@"WORK_TIME4"];
    workDateModel.workTime5=[resultItem objectForKey:@"WORK_TIME5"];
    workDateModel.workType=[resultItem objectForKey:@"WORK_TYPE"];
    
    return workDateModel;
}

//調班信息
-(ChangeWorkModel *)parseChangeWorkInfoList:(id)resultItem
{
    ChangeWorkModel *changeWorkModel=[[ChangeWorkModel alloc]init];
    changeWorkModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    changeWorkModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    changeWorkModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    changeWorkModel.startTime=[resultItem objectForKey:@"START_TIME"];
    changeWorkModel.endTime=[resultItem objectForKey:@"END_TIME"];
    changeWorkModel.repairEndTime=[resultItem objectForKey:@"REPAIR_END_TIME"];
    changeWorkModel.repairStartTime=[resultItem objectForKey:@"REPAIR_START_TIME"];
    changeWorkModel.repairWorkDate=[resultItem objectForKey:@"REPAIR_WORK_DATE"];
    changeWorkModel.changeWorkHours=[resultItem objectForKey:@"CHANGE_WORK_HOURS"];
    changeWorkModel.status=[resultItem objectForKey:@"STATUS"];
    
    return changeWorkModel;
}

//分區刷卡
-(SubrRegionModel *)parseSubRegionInfoList:(id)resultItem
{
    SubrRegionModel *subrRegionModel=[[SubrRegionModel alloc]init];
    subrRegionModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    subrRegionModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    subrRegionModel.regionPlace=[resultItem objectForKey:@"REGION_PLACE"];
    subrRegionModel.regionType=[resultItem objectForKey:@"REGION_TYPE"];
    subrRegionModel.startTime=[resultItem objectForKey:@"START_TIME"];
    subrRegionModel.endTime=[resultItem objectForKey:@"END_TIME"];
    subrRegionModel.status=[resultItem objectForKey:@"STATUS"];
    
    return subrRegionModel;
}

//異常信息
-(AttendceExceptionModel *)parseAttendceExceptionInfoList:(id)resultItem
{
    AttendceExceptionModel *attendceExceptionModel=[[AttendceExceptionModel alloc]init];
    attendceExceptionModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    attendceExceptionModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    attendceExceptionModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    attendceExceptionModel.dateType=[resultItem objectForKey:@"DATE_TYPE"];
    attendceExceptionModel.hwtCode=[resultItem objectForKey:@"HWT_CODE"];
    attendceExceptionModel.hwtType=[resultItem objectForKey:@"HWT_TYPE"];
    attendceExceptionModel.startTime=[resultItem objectForKey:@"START_TIME"];
    attendceExceptionModel.firstStartTime=[resultItem objectForKey:@"FIRST_START_TIME"];
    attendceExceptionModel.onDutyResult=[resultItem objectForKey:@"ON_DUTY_RESULT"];
    attendceExceptionModel.delayTime=[resultItem objectForKey:@"DELAY_TIME"];
    attendceExceptionModel.onDutyOpen=[resultItem objectForKey:@"ON_DUTY_OPEN"];
    attendceExceptionModel.endTime=[resultItem objectForKey:@"END_TIME"];
    attendceExceptionModel.secondEndTime=[resultItem objectForKey:@"SECOND_END_TIME"];
    attendceExceptionModel.offDutyResult=[resultItem objectForKey:@"OFF_DUTY_RESULT"];
    attendceExceptionModel.earlyTime=[resultItem objectForKey:@"EARLY_TIME"];
    attendceExceptionModel.offDutyOpen=[resultItem objectForKey:@"OFF_DUTY_OPEN"];
    attendceExceptionModel.status=[resultItem objectForKey:@"STATUS"];
    
    return attendceExceptionModel;
}

//調休信息
-(MoveRestModel *)parseMoveRestInfoList:(id)resultItem
{
    MoveRestModel *moveRestModel=[[MoveRestModel alloc]init];
    moveRestModel.status=[resultItem objectForKey:@"STATUS"];
    moveRestModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    moveRestModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    moveRestModel.workDate=[resultItem objectForKey:@"WORK_DATE"];
    moveRestModel.startTime=[resultItem objectForKey:@"START_TIME"];
    moveRestModel.endTime=[resultItem objectForKey:@"END_TIME"];
    moveRestModel.moveRestHours=[resultItem objectForKey:@"MOVE_REST_HOURS"];
    moveRestModel.reason=[resultItem objectForKey:@"REASON"];
    
    return moveRestModel;
}

//獎罰信息
-(RewardsPunishmentModel *)parseRewardsPunishmentInfoList:(id)resultItem
{
    RewardsPunishmentModel *rewardsPunishmentModel=[[RewardsPunishmentModel alloc]init];
    rewardsPunishmentModel.status=[resultItem objectForKey:@"STATUS"];
    rewardsPunishmentModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    rewardsPunishmentModel.empNo=[resultItem objectForKey:@"EMP_NO"];
    rewardsPunishmentModel.closeDate=[resultItem objectForKey:@"CLOSE_DATE"];
    rewardsPunishmentModel.rapTime=[resultItem objectForKey:@"RAP_TIME"];
    rewardsPunishmentModel.rapLevel=[resultItem objectForKey:@"RAP_LEVEL"];
    rewardsPunishmentModel.rapReason=[resultItem objectForKey:@"RAP_REASON"];
    
    return rewardsPunishmentModel;
}

//行程管理
- (FrmArranceModel *)parseArranceInfoList:(id)resultItem
{
    FrmArranceModel *arranceModel = [[FrmArranceModel alloc] init];
    arranceModel.status = [resultItem objectForKey:@"STATUS"];
    arranceModel.empName = [resultItem objectForKey:@"EMP_NAME"];
    arranceModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    arranceModel.journeyDay = [resultItem objectForKey:@"JOURNEY_DATE"];
    arranceModel.joruneyType = [resultItem objectForKey:@"JOURNEY_TYPE"];
    arranceModel.flight = [resultItem objectForKey:@"FLIGHT"];
    arranceModel.startEndTime = [resultItem objectForKey:@"START_END_TIME"];
    arranceModel.startEndPlace = [resultItem objectForKey:@"START_END_PLACE"];
    
    return arranceModel;
}

//返乡休假
- (FrmWorkRestModel *)parseWorkRestInfoList:(id)resultItem
{
    FrmWorkRestModel *workRestModel = [[FrmWorkRestModel alloc] init];
    workRestModel.status = [resultItem objectForKey:@"STATUS"];
    workRestModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    workRestModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    workRestModel.restTime = [resultItem objectForKey:@"REST_TIME"];
    workRestModel.restDays = [resultItem objectForKey:@"REST_DAYS"];
    workRestModel.travelTime = [resultItem objectForKey:@"TRAVEL_TIME"];
    workRestModel.travelDays = [resultItem objectForKey:@"TRAVEL_DAYS"];
    workRestModel.cumTravelDays = [resultItem objectForKey:@"CUM_TRAVEL_DAYS"];
    
    return workRestModel;
}

//出差信息
- (FrmTravelModel *)parseTravelInfoList:(id)resultItem
{
    FrmTravelModel *travelModel = [[FrmTravelModel alloc] init];
    travelModel.status = [resultItem objectForKey:@"STATUS"];
    travelModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    travelModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    travelModel.formType = [resultItem objectForKey:@"FORM_TYPE"];
    travelModel.travelDate = [resultItem objectForKey:@"TRAVEL_DATE"];
    travelModel.travelArea = [resultItem objectForKey:@"TRAVEL_AREA"];
    travelModel.travelDays = [resultItem objectForKey:@"TRAVEL_DAYS"];
    
    return travelModel;

}

//年休假
- (FrmYearLeaveModel *)parseYearLeaveInfoList:(id)resultItem
{
    FrmYearLeaveModel *yearLeaveModel = [[FrmYearLeaveModel alloc] init];
    yearLeaveModel.status = [resultItem objectForKey:@"STATUS"];
    yearLeaveModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    yearLeaveModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    yearLeaveModel.leaveType = [resultItem objectForKey:@"LEAVE_TYPE"];
    yearLeaveModel.provideDays = [resultItem objectForKey:@"PROVIDE_DAYS"];
    yearLeaveModel.totalDays = [resultItem objectForKey:@"TOTAL_DAYS"];
    yearLeaveModel.residueDays = [resultItem objectForKey:@"RESIDUE_DAYS"];
    
    return yearLeaveModel;
}

//請假信息
- (FrmLeaveModel *)parseFrmLeaveInfoList:(id)resultItem
{
    FrmLeaveModel *frmLeaveModel = [[FrmLeaveModel alloc] init];
    frmLeaveModel.status = [resultItem objectForKey:@"STATUS"];
    frmLeaveModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    frmLeaveModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    frmLeaveModel.leaveType = [resultItem objectForKey:@"LEAVE_TYPE"];
    frmLeaveModel.leaveDay = [resultItem objectForKey:@"WORK_DATE"];
    frmLeaveModel.startTime = [resultItem objectForKey:@"START_TIME"];
    frmLeaveModel.endTiem = [resultItem objectForKey:@"END_TIME"];
    frmLeaveModel.invalid =[resultItem objectForKey:@"INVALID_DESC"];
    frmLeaveModel.actualTime = [resultItem objectForKey:@"ACTUAL_LEAVE_DAYS"];
    
    return frmLeaveModel;
}

- (FrmCardModel *)parseFrmCardInfoList:(id)resultItem
{
    FrmCardModel *frmCardModel = [[FrmCardModel alloc] init];
    frmCardModel.status = [resultItem objectForKey:@"STATUS"];
    frmCardModel.empName=[resultItem objectForKey:@"EMP_NAME"];
    frmCardModel.empNo = [resultItem objectForKey:@"EMP_NO"];
    
    frmCardModel.cardDate = [resultItem objectForKey:@"CARD_DATE"];
    frmCardModel.cardTime= [resultItem objectForKey:@"CARD_TIME"];
    frmCardModel.cardAddress = [resultItem objectForKey:@"CARD_PLACE"];
    frmCardModel.collectionTime = [resultItem objectForKey:@"COLLECT_TIME"];
    
    return frmCardModel;
    
}


 //包工分红信息
 - (ContractModel *)parseContractInfoList:(id)resultItem
{
    ContractModel *contractModel=[[ContractModel alloc]init];
    contractModel.contractTime=[resultItem objectForKey:@"WORK_DATE"];
    contractModel.lineName=[resultItem objectForKey:@"LINE"];
    contractModel.squadType=[resultItem objectForKey:@"WORK_CODE"];
    contractModel.contractType=[resultItem objectForKey:@"OPERSONAL_TYPE"];
    contractModel.contractDividend=[resultItem objectForKey:@"BOUNUS_AMOUNT"];
    
    return contractModel;
}
                         
@end
