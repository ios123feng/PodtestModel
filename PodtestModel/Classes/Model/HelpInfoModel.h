//
//  HelpInfoModel.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/11.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpInfoModel : NSObject

@property (nonatomic,copy) NSString *tittle;//標題
@property (nonatomic,copy) NSString *text;//内容

#pragma mark 根据字典初始化微博对象
-(HelpInfoModel *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(HelpInfoModel *)statusWithDictionary:(NSDictionary *)dic;

@end
