//
//  NewsDetailDAL.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/27.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsDetailResultInfoModel;

@interface NewsDetailDAL : NSObject

-(NewsDetailResultInfoModel *)parseNewsDetailList:(id)result ImgPath:(NSString *)imgPath;

@end
