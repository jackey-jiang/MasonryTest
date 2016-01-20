//
//  DEMO6_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO6_ViewController.h"

@implementation DEMO6_ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *topView = [UIView new];
    
    topView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:topView];
    
    
    UIView *bottomView = [UIView new];
    
    bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bottomView];
    
    
    UIView *topInsideView = [UIView new];
    
    topInsideView.backgroundColor = [UIColor greenColor];
    
    [topView addSubview:topInsideView];
    
    UIView *bottomInsideView = [UIView new];
    
    bottomInsideView.backgroundColor = [UIColor yellowColor];
    
    [bottomView addSubview:bottomInsideView];
    
    
    [topView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(bottomView.top);
        make.height.equalTo(bottomView);
        
    }];
    
    
    [bottomView makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.left.right.equalTo(self.view);
        
        
    }];
    
    
    [topInsideView makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(topView);
        make.width.equalTo(topView);
        //设置宽度为高度的5倍
        make.width.equalTo(topInsideView.height).multipliedBy(5);
        //设置高度最大值 不大于topview的宽度
        make.height.lessThanOrEqualTo(topView);
        
    }];
    
    [bottomInsideView makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(bottomView);
        make.height.equalTo(bottomView);
        
        //倍率
        CGFloat multiolied = 1.f / 5.f;
        
        //设置宽度为高度的5分之一
        make.width.equalTo(bottomInsideView.height).multipliedBy(multiolied);
        //设置宽度不得大于 topView的宽度
        make.width.lessThanOrEqualTo(bottomView);
        
    }];
}
@end
