//
//  DEMO2_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-12.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO2_ViewController.h"

@implementation DEMO2_ViewController
{
    CGFloat _buttonWidth;
    CGFloat _buttonHeight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _buttonWidth = 50.f;
    _buttonHeight = 50.f;
    
    
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    clickButton.tag = 10;
    [clickButton setTitle:@"点我" forState:UIControlStateNormal];
    [clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clickButton.layer.borderWidth = 2.f;
    clickButton.layer.borderColor = [UIColor redColor].CGColor;
    [clickButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:clickButton];
    
    [clickButton makeConstraints:^(MASConstraintMaker *make) {
        
        //中点
        make.center.equalTo(self.view);
        //宽
        make.width.equalTo(@(_buttonWidth));
        //高
        make.height.equalTo(@(_buttonHeight));
        
    }];
    
    //deBug  调试
    MASAttachKeys(clickButton,self.view);
}

- (void)startAnimate
{
    _buttonWidth += 50;
    _buttonHeight += 50;
    
    UIButton *clickButton = (UIButton *)[self.view viewWithTag:10];
    
    [clickButton updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@(_buttonWidth));
        make.height.equalTo(@(_buttonHeight));
        
//        //宽度最大只能等于父视图的宽度
        make.width.lessThanOrEqualTo(self.view).key(@"123");  //指定KEY  方便查找
        //高度最大只能等于父视图的高度
        make.height.lessThanOrEqualTo(self.view).key(@"321"); //指定KEY 方便查找
        
    }];
}

- (void)buttonClick
{

    [UIView animateWithDuration:0.4 animations:^{
        
        [self startAnimate];
        
        //带动画效果
        [self.view layoutIfNeeded];

    }];
}

@end
