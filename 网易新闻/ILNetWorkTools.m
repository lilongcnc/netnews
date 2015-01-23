//
//  ILNetWorkTools.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILNetWorkTools.h"

@implementation ILNetWorkTools

+(instancetype)sharedNetWorkTools{
    static ILNetWorkTools *tools;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
         // 设置反序列化的数据格式－> 官方建议的修改方式
        tools = [[ILNetWorkTools alloc] initWithBaseURL:url sessionConfiguration:config];
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return tools;
}



@end
