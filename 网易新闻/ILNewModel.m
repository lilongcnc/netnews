//
//  ILNewItems.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILNewModel.h"

@implementation ILNewModel

+(instancetype)newsModelWithDict:(NSDictionary *)dict{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}



@end
