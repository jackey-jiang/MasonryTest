//
//  DEMO13_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-14.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO13_ViewController.h"

static const CGFloat reduce_height = 100.f;
static const CGFloat blowup_height = 200.f;

@implementation DEMO13_ViewController
{
    UIButton *_clickButton;
    UIView *_moveView;
    
    BOOL _expanded;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_clickButton setTitle:@"点击" forState:UIControlStateNormal];
    [_clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [_clickButton addTarget:self action:@selector(clickButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_clickButton];
    
    
    _moveView = [UIView new];
    
    _moveView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_moveView];
    
    [_clickButton makeConstraints:^(MASConstraintMaker *make) {
       
        //button的size不设置 会根据title自动计算

        make.top.equalTo(self.view).offset(20).key(@"haha"); //key表示只检查这一行约束，并显示 DEBUG
        make.centerX.equalTo(self.view);
    }];
    
    [_moveView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_clickButton.bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@(reduce_height));
        
    }];
    
    
    //deBug  调试

    MASAttachKeys(_clickButton,_moveView,self.view);
}

- (void)clickButtonClick
{
    //此动画 附带弹性效果
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.4f initialSpringVelocity:5.f options:0 animations:^{
        
        //动画时间 设置button不可点击
        _clickButton.enabled = NO;
        
        //更新约束
        [_moveView updateConstraints:^(MASConstraintMaker *make) {
           
            make.height.equalTo(!_expanded ? @(blowup_height) : @(reduce_height));
            make.bottom.lessThanOrEqualTo(self.view.bottom).offset(- 20);
            
        }];
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        _clickButton.enabled = YES;
        
        //bool取反
        _expanded = !_expanded;
        
    }];
}

@end
