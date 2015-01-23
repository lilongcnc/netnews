//
//  ILNewItems.h
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILNewModel : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  摘要信息
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟贴
 */
@property (nonatomic, copy) NSNumber *replyCount;
/**
 *  图片资源
 */
@property (nonatomic, copy) NSString *imgsrc;

/**
 *  多图数组
 */
@property (nonatomic, strong) NSArray *imgextra;
/**
 *  一个图
 */
@property (nonatomic, copy) NSNumber *imgType;

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *photosetID;
@property (nonatomic, copy) NSNumber *hasHead;
@property (nonatomic, copy) NSNumber *hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *template;
@property (nonatomic, copy) NSString *skipType;

@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, copy) NSNumber *hasAD;
@property (nonatomic, copy) NSNumber *priority;
@property (nonatomic, copy) NSString *cid;

@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, copy) NSString *ename;


@property (nonatomic, copy) NSString *skipID;



@property (nonatomic, copy) NSNumber *order;

@property (nonatomic, copy) NSString *url_3w;
@property (nonatomic, copy) NSString *timeConsuming;

@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *adTitle;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *TAG;
@property (nonatomic, strong) NSArray *editor;

@property (nonatomic, copy) NSString *TAGS;

@property (nonatomic, copy) NSString *specialID;
@property (nonatomic, strong) NSArray *specialextra;

@property (nonatomic,copy) NSString *videoID;

+ (instancetype)newsModelWithDict:(NSDictionary *)dict;


@end
