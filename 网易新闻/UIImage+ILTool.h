//
//  UIImage+ILTool.h
//  网易新闻
//
//  Created by 李龙 on 15/1/23.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ILTool)

/**
 *  图片不被系统渲染
 *
 */
+(instancetype)imageOriginal:(NSString *)imageName;

/**
 *  图片平铺拉伸
 *
 */
+(instancetype)imageStretch:(NSString *)imageName;
@end
