//
//  ILNewsCell.m
//  网易新闻
//
//  Created by 李龙 on 15/1/22.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#import "ILNewsCell.h"
#import "ILNewModel.h"
#import "UIImageView+WebCache.h"
@interface ILNewsCell ()
/**
 *  正文图像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  正文内容
 */
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
/**
 *  跟帖
 */
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
/**
 *  图片2
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView2;
/**
 *  图片3
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView3;



@end

@implementation ILNewsCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setNewsModel:(ILNewModel *)newsModel{
    _newsModel = newsModel;
    
    
    self.titleLabel.text = newsModel.title;
    self.digestLabel.text = newsModel.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%@跟贴", newsModel.replyCount];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    
    // 多图
    if (newsModel.imgextra.count == 2) {
        [self.iconView2 sd_setImageWithURL:[NSURL URLWithString:newsModel.imgextra[0][@"imgsrc"]]];
        [self.iconView3 sd_setImageWithURL:[NSURL URLWithString:newsModel.imgextra[1][@"imgsrc"]]];
    }
}


+(NSString *)cellIDWithModel:(ILNewModel *)news{
    if (news.imgType) {
        return @"BigImageCell";
    }else if(news.imgextra){
        return @"ImageCell";
    }else{
        return @"NewCell";
    }
}

+(CGFloat)rowHeightWithModel:(ILNewModel *)news{
    if (news.imgType) {
        return 150;
    }else if(news.imgextra){
        return 110;
    }else{
        return 80;
    }
}



@end
