//
//  CustomCollectionViewCell.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-14.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Header.h"
@implementation CustomCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.contentView.backgroundColor = [UIColor grayColor];
    
    _subLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    
    _subLabel.backgroundColor = [UIColor redColor];
    _subLabel.textColor = [UIColor blackColor];
    _subLabel.numberOfLines = 0;
    _subLabel.text = @"11111111111111111111111111111111111111111";
    _subLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    [self.contentView addSubview:_subLabel];
//
//    
//    _subImageView = [UIImageView new];
//    
//    _subImageView.backgroundColor = [UIColor blueColor];
//    
//    [self.contentView addSubview:_subImageView];
    
//    
//    
//    _subView = [UIView new];
//    _subView.backgroundColor = [UIColor orangeColor];
//    
//    [self.contentView addSubview:_subView];
//    
//    [_subLabel makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.left.equalTo(_subLabel.superview).insets(UIEdgeInsetsMake(10, 10, 0, 0));
//        make.width.equalTo(@70);
//        
//    }];
//
//    [_subImageView makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.equalTo(_subLabel.bottom).offset(10);
//        make.left.equalTo(self.contentView).offset(10);
//        make.size.mas_equalTo(CGSizeMake(60, 60));
//        
//    }];
//    
//    [_subView makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 0, 0, 10));
//        make.left.equalTo(_subLabel.right).equalTo(@20);
//        make.bottom.equalTo(_subImageView.bottom);
//    
//    }];
    
//    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.left.right.equalTo(self.contentView.superview).insets(UIEdgeInsetsMake(10, 10, 0, 10));
//        make.bottom.equalTo(_subLabel.bottom).offset(10);
//        
//
//    }];
    
//    MASAttachKeys(_subLabel,_subImageView,_subView,self.contentView,self);
}

@end
