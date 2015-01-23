//
//  ILTableViewController.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILTableViewController.h"
#import "ILNewModel.h"
#import "ILNewsCell.h"
#import "ILNetWorkTools.h"

@interface ILTableViewController ()


@property (nonatomic,strong) NSArray *newsList;

@end

@implementation ILTableViewController



-(void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    
    [self.tableView reloadData];
}


-(void)setUrlString:(NSString *)urlString{
    //这里没必要写 _urlString = urlString;
    
    [[[ILNetWorkTools sharedNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        NSString *key = [responseObject.keyEnumerator nextObject];
        NSArray *dataList = responseObject[key];
        
        NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:dataList.count];
        [dataList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [tempArr addObject:[ILNewModel newsModelWithDict:obj]];
        }];
        
        self.newsList = tempArr;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }] resume];
    
}


#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//FIXME:这里写死 return 10;  跟帖label的地方会出现null值闪一下!!!

    return self.newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ILNewModel *newModel = self.newsList[indexPath .row];
    
    NSString *flag = [ILNewsCell cellIDWithModel:newModel];
    
    ILNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:flag];
    
    cell.newsModel = newModel;
//    NSLog(@"===》%@",newModel);
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ILNewModel *newModel = self.newsList[indexPath .row];

    return [ILNewsCell rowHeightWithModel:newModel];
}



@end
