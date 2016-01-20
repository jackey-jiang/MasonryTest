//
//  DEMO10_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO10_ViewController.h"

@implementation DEMO10_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.pagingEnabled = YES;
    
    [self.view addSubview:scrollView];
    
    
    //scrollView的contentView必须设置
    UIView *contentView = [UIView new];
    
    [scrollView addSubview:contentView];
    
    
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
        
    }];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        
#warning 这个contentView不知道为什么要这样设置,待考证,目测是scrollView特有的(原因可能是contentView的不确定性)
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView);
        
    }];
    

    UIView *lastView;
    
    for(int i = 0; i < 20; i ++)
    {
        UIView *subView = [UIView new];
        
        subView.backgroundColor = [self randomColor];
        
        [contentView addSubview:subView];
        
        [subView makeConstraints:^(MASConstraintMaker *make) {
            
            //view的顶部底部对齐scrollView
            make.top.bottom.equalTo(scrollView);
            //如果lastview存在 生成的view的左边对齐scrollView左边， 否则从contentView的右边开始
            make.left.equalTo(!lastView ? scrollView.left : lastView.right);
            //view的宽度对齐scrollView的宽度
            make.width.equalTo(scrollView.width);
            
        }];
        
        //每次循环把当前的view赋给lastView
        lastView = subView;
    }
    
    [contentView updateConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(lastView.right);
    }];

    
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
