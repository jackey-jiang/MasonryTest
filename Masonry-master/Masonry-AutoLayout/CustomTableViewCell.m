//
//  CustomTableViewCell.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Header.h"
@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.contentView.backgroundColor = [UIColor orangeColor];
    
    //label
    _subLabel = [UILabel new];
    
    _subLabel.numberOfLines = 0;
    _subLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    _subLabel.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_subLabel];
    
    //imageview
    _subImageView = [UIImageView new];
    
    _subImageView.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:_subImageView];
    
    
    //label不用设置高度
    [_subLabel makeConstraints:^(MASConstraintMaker *make) {
        
        //设置上左约束
        make.top.left.equalTo(_subLabel.superview).insets(UIEdgeInsetsMake(10, 10, 0, 0));
        //设置宽度
        make.width.equalTo(@100);
        
    }];
    
    [_subImageView makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_subLabel.bottom).offset(10);
        make.left.equalTo(_subLabel);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
       
        //设置上左右约束
        make.top.left.right.equalTo(self.contentView.superview).insets(UIEdgeInsetsMake(10, 10, 0, 10));
        //设置底部相对于SubLable的底部 偏移10
        make.bottom.equalTo(_subImageView.bottom).offset(10);
        
    }];
    
    
}

@end
