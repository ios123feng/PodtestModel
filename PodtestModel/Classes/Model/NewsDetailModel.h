//
//  NewsDetailModel.h
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/27.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDetailModel : NSObject

@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *contentImage;
@property(nonatomic,retain)NSString *createDate;
@property(nonatomic,retain)NSString *createUser;
@property(nonatomic,retain)NSString *delFlag;
@property(nonatomic,retain)NSString *endDate;
@property(nonatomic,retain)NSString *item;
@property(nonatomic,retain)NSString *titleID;
@property(nonatomic,retain)NSString *updateDate;
@property(nonatomic,retain)NSString *updateUser;

@end

@interface NewsDetailResultInfoModel : NSObject

@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)id resultInfo;

@end