//
//  ILNewsCollectionViewCell.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILNewsCollectionViewCell.h"
#import "ILTableViewController.h"
#import "ILMainNviViewController.h"

@interface ILNewsCollectionViewCell ()

@property (nonatomic,strong) ILTableViewController *newsTableVC;

@end
@implementation ILNewsCollectionViewCell

-(void)awakeFromNib{
    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"ILTableViewController" bundle:nil];
    
    self.newsTableVC = stroyboard.instantiateInitialViewController;
    
    self.bounds = self.newsTableVC.view.bounds;
    
    [self addSubview:self.newsTableVC.view];
}


-(void)setUrlString:(NSString *)urlString{
    _urlString = urlString;
    
    self.newsTableVC.urlString = urlString;
}
@end
