//
//  HomeDAL.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/18.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeResultInfoModel;

@interface HomeDAL : NSObject

-(HomeResultInfoModel *)parseHomeList:(id)result ImgPath:(NSString *)imgPath;
-(NSMutableArray *)getImageUrl:(id)result ImgVirtualUrl:(NSString *)imgVirtualUrl;

@end
