//
//  ILNewsCell.h
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ILNewModel;

@interface ILNewsCell : UITableViewCell

/**
 *  根据模型返回可重用标示符号
 */
+ (NSString *)cellIDWithModel:(ILNewModel *)news;

/**
 *  根据模型返回行高
 */
+ (CGFloat)rowHeightWithModel:(ILNewModel *)news;

/**
 *  设置数据
 */
@property (nonatomic,strong) ILNewModel *newsModel;

@end
