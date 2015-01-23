//
//  UIImage+ILTool.m
//  网易新闻
//
//  Created by 李龙 on 15/1/23.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "UIImage+ILTool.h"

@implementation UIImage (ILTool)

//设置图片不被系统渲染
+(instancetype)imageOriginal:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+(instancetype)imageStretch:(NSString *)imageName{
    UIImage *image =[UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height*0.5];
}

@end
