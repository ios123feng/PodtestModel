//
//  NewsDetailDAL.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/27.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "NewsDetailDAL.h"
#import "NewsDetailModel.h"
#import "HtmlLabel.h"

@implementation NewsDetailDAL

-(NewsDetailResultInfoModel *)parseNewsDetailList:(id)result ImgPath:(NSString *)imgPath
{
    NSMutableArray *dataList=nil;
    NewsDetailResultInfoModel *newsDetailInfoModel=nil;
    if ([result isKindOfClass:[NSDictionary class]]) {
        
        newsDetailInfoModel=[[NewsDetailResultInfoModel alloc]init];
        newsDetailInfoModel.status=[[[result objectForKey:@"RESULT"] objectAtIndex:0] objectForKey:@"STATUS"];
        
        dataList=[[NSMutableArray alloc]init];
        HtmlLabel *htmlLabel=[[HtmlLabel alloc] init];
        for (id item in [result objectForKey:@"VALUES"]) {
            
            if ([item isKindOfClass:[NSDictionary class]]) {
                
                NewsDetailModel *newsDetailModel=[[NewsDetailModel alloc]init];
                //extractStyleFromText这个方法能提取html语言
                newsDetailModel.content=[htmlLabel extractStyleFromText:[item  objectForKey:@"CONTENT"]];
                NSString *imageUrl = [item objectForKey:@"CONTENT_IMAGE"];
                
                //CONTENT_IMAGE不为空
                if (![imageUrl isEqualToString:@"" ])
                {
                  //url为http://aservice.foxconn.com/qazwsxedcrfvtgbyhnujmikolp/
                  //url加上图片的名字 这样可以从服务器读取到图片
                    newsDetailModel.contentImage=[imgPath stringByAppendingString:[NSString stringWithFormat:@"/%@",imageUrl]];
                }else{
                    //把json中的CONTENT_IMAGE赋给Model
                    newsDetailModel.contentImage = imageUrl;
                }
                newsDetailModel.createDate=[item objectForKey:@"CREATE_DATE"];
                newsDetailModel.createUser=[item objectForKey:@"CREATE_USER"];
                newsDetailModel.delFlag=[item objectForKey:@"DEL_FLAG"];
                newsDetailModel.endDate=[item objectForKey:@"END_DATE"];
                newsDetailModel.item=[item objectForKey:@"ITEM"];
                newsDetailModel.titleID=[item objectForKey:@"TITLE_ID"];
                newsDetailModel.updateDate=[item objectForKey:@"UPDATE_DATE"];
                newsDetailModel.updateUser=[item objectForKey:@"UPDATE_USER"];
                
                [dataList addObject:newsDetailModel];
            }
        }
        newsDetailInfoModel.resultInfo=dataList;

    }
    
    return newsDetailInfoModel;
}

@end
