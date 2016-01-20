//
//  DEMO11_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO11_ViewController.h"

@implementation DEMO11_ViewController
{
    NSArray *_buttonArray;
    float _padding;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.tag = 10;
    leftButton.backgroundColor = [UIColor redColor];
    [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"向上" forState:UIControlStateNormal];
    
    [self.view addSubview:leftButton];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    centerButton.tag = 20;
    centerButton.backgroundColor = [UIColor yellowColor];
    [centerButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerButton setTitle:@"回到中点" forState:UIControlStateNormal];
    
    [self.view addSubview:centerButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.tag = 30;
    rightButton.backgroundColor = [UIColor blueColor];
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"向下" forState:UIControlStateNormal];
    
    [self.view addSubview:rightButton];
    
    [leftButton makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view.left).offset(40);
        make.centerY.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
    }];
    
    [centerButton makeConstraints:^(MASConstraintMaker *make) {
        
       
        make.center.equalTo(self.view);
        make.size.equalTo(leftButton);
        
    }];
    
    [rightButton makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view.right).offset( - 40);
        make.centerY.equalTo(self.view);
        make.size.equalTo(leftButton);
        
    }];
    
    //用数组保存三个button
    _buttonArray = @[leftButton, centerButton, rightButton];
}

- (void)buttonClick:(UIButton *)button
{

    
    if(button.tag == 10)
    {
        _padding -= 10.f;
    }
    else if(button.tag == 20)
    {
        _padding = 0.f;
    }
    else
    {
        _padding += 10.f;
    }
    
    //开始更新约束
    [self startUpdateConstraints:_padding];
}

- (void)startUpdateConstraints:(float)padding
{
    //直接使用数组
    [_buttonArray updateConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.view.centerY).offset(padding);
        
    }];
}
@end
