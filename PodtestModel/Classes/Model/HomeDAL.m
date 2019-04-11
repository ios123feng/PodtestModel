//
//  HomeDAL.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/18.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "HomeDAL.h"
#import "HomeResultInfoModel.h"
#import "HtmlLabel.h"
#import "HomeModel.h"

@implementation HomeDAL


//json有两个组，一个是RESULT  一个是VALUES
-(HomeResultInfoModel *)parseHomeList:(id)result ImgPath:(NSString *)imgPath
{
    NSMutableArray *dataList=nil;
    NSMutableArray *imageDataList=nil;
    HomeResultInfoModel *homeResultModel=nil;
    // 如果result是dictionary类
    if ([result isKindOfClass:[NSDictionary class]]) {
        homeResultModel=[[HomeResultInfoModel alloc] init];
        //获取json里面的result组里的status：（是Y或者N）
        homeResultModel.status=[[[result objectForKey:@"RESULT"] objectAtIndex:0]objectForKey:@"STATUS"];
        
        dataList=[[NSMutableArray alloc] init];
        imageDataList=[[NSMutableArray alloc] init];
        
        //这个类可以解析html语言
        HtmlLabel *htmlLabel=[[HtmlLabel alloc] init];
        
        //获取json里面的values组，values组一般只有一组dictionary数据
        for (id item in [result objectForKey:@"VALUES"]) {
            
            if ([item isKindOfClass:[NSDictionary class]]) {
                
                HomeModel *homeModel=[[HomeModel alloc]init];
                
                // 此方法可以提取出item里CONTENT的html语言，并规定其用法
                homeModel.content=[htmlLabel extractStyleFromText:[item objectForKey:@"CONTENT"]];
                
                homeModel.endDate=[item objectForKey:@"END_DATE"];
                homeModel.factory=[item objectForKey:@"FACTORY"];
                homeModel.groupName=[item objectForKey:@"GROUP_NAME"];
                homeModel.item=[item objectForKey:@"ITEM"];
                homeModel.noticeType=[item objectForKey:@"NOTICE_TYPE"];
                homeModel.subject=[item objectForKey:@"SUBJECT"];
                homeModel.sysName=[item objectForKey:@"SYS_NAME"];
                homeModel.titleImage=[item objectForKey:@"TITLE_IMAGE"];
                homeModel.updateDate=[item objectForKey:@"UPDATE_DATE"];
                homeModel.updateUser=[item objectForKey:@"UPDATE_USER"];
                
                homeModel.tittleImgURL=[imgPath stringByAppendingString:[NSString stringWithFormat:@"/%@",[item objectForKey:@"TITLE_IMAGE"]]];
                
                if ([[item objectForKey:@"NOTICE_TYPE"]isEqual:@"4"]) {
                    //獲取圖片新聞
                    [imageDataList addObject:homeModel];
                }else{
                    //獲取列表新聞
                    [dataList addObject:homeModel];
                }
            }
        }
        homeResultModel.resultInfo=dataList;
        homeResultModel.imageNewsInfo=imageDataList;
        
    }
    
    return homeResultModel;
}

-(NSMutableArray *)getImageUrl:(id)result ImgVirtualUrl:(NSString *)imgVirtualUrl
{
    NSMutableArray *imgUrlList=nil;
    if ([result isKindOfClass:[NSDictionary class]]) {
        
        imgUrlList=[[NSMutableArray alloc]init];
        for (id item in [result objectForKey:@"VALUES"]) {
            
            if ([item isKindOfClass:[NSDictionary class]]) {
                
                [imgUrlList addObject:[imgVirtualUrl stringByAppendingPathComponent:[item objectForKey:@"TITLE_IMAGE"]]];
                
            }
        }
        
    }
    
    return imgUrlList;
}


@end
