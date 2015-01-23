//
//  ILNewsCollectionViewController.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILNewsCollectionViewController.h"
#import "ILNewsCollectionViewCell.h"
#import "UIImage+ILTool.h"

@interface ILNewsCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionLayout;

@property (nonatomic,strong) NSArray *allNewsList;

@end

@implementation ILNewsCollectionViewController

static NSString * const reuseIdentifier = @"newsCollectionCell";

-(NSArray *)allNewsList{
    if (_allNewsList == nil) {
        _allNewsList= [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NewsURLs.plist" ofType:nil]];
    }
    return _allNewsList;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    //设置导航栏沉浸式栏的状态颜色.字体为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //关掉导航栏的渲染，不透明。view的高度从导航栏下标开始算起
    self.navigationController.navigationBar.translucent = NO;
    //着色渲染模式。 和imageWithRenderingMode一起使用
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
    
    //设置中间的标题图片
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"home_header_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [iconView sizeToFit];
    self.navigationItem.titleView = iconView;
    
    //设置左边呼出按钮
    UIButton *leftMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftMenuBtn setBackgroundImage:[[UIImage imageNamed:@"night_top_navigation_menuicon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateNormal];
    [leftMenuBtn setBackgroundImage:[[UIImage imageNamed:@"night_top_navigation_menuicon_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateHighlighted];
    [leftMenuBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftMenuBtn];
 
    
    //右边的
    UIButton *rightInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightInfoBtn setBackgroundImage:[[UIImage imageNamed:@"night_top_navigation_infoicon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateNormal];
    [rightInfoBtn setBackgroundImage:[[UIImage imageNamed:@"night_top_navigation_infoicon_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateHighlighted];
    [rightInfoBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightInfoBtn];
    
}



-(void)viewWillLayoutSubviews{
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
    self.collectionLayout.minimumInteritemSpacing = 0;
    self.collectionLayout.minimumLineSpacing = 0;
    self.collectionLayout.itemSize = self.view.bounds.size;
    self.collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
//    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}



#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allNewsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ILNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.urlString = self.allNewsList[indexPath.row][@"urlString"];
    
    return cell;
}


@end
