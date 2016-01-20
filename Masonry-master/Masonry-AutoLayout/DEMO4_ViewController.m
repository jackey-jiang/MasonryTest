//
//  DEMO4_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO4_ViewController.h"

@implementation DEMO4_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc] init];
    
    blueView.backgroundColor = [UIColor blueColor];
    blueView.layer.borderWidth = 2.f;
    blueView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:blueView];
    
    
    UIView *redView = [[UIView alloc] init];
    
    redView.backgroundColor = [UIColor redColor];
    redView.layer.borderWidth = 2.f;
    redView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:redView];
    
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view).offset(20);
        make.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 20, 20, 20));
        
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
       
        //中心偏移
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, 50));
        
        //设置尺寸
        make.size.mas_equalTo(CGSizeMake(200, 100));
        //设置底部小于blueView的底部 偏移 -20
        make.bottom.lessThanOrEqualTo(blueView.bottom).offset(-20);

    }];
    
    
    //DEBUG调试

    MASAttachKeys(blueView, self.view, redView, self.view);
}

@end
