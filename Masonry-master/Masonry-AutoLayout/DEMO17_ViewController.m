//
//  DEMO17_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-19.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO17_ViewController.h"

@implementation DEMO17_ViewController
{
    NSMutableArray *_viewHorArray;
    NSMutableArray *_viewVerArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv11];
    [self.view addSubview:sv12];
    [self.view addSubview:sv13];
    [self.view addSubview:sv21];
    [self.view addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [self.view distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [self.view distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    
}

@end
