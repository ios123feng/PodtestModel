//
//  HelpInfoModel.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/11.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "HelpInfoModel.h"

@implementation HelpInfoModel

#pragma mark 根据字典初始化微博对象
-(HelpInfoModel *)initWithDictionary:(NSDictionary *)dic
{
    if(self=[super init]){
        self.tittle=dic[@"tittle"];
        self.text=dic[@"text"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(HelpInfoModel *)statusWithDictionary:(NSDictionary *)dic
{
    HelpInfoModel *helpInfoModel=[[HelpInfoModel alloc]initWithDictionary:dic];
    return helpInfoModel;
}


@end
