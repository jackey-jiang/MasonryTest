//
//  DEMO1_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-3.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO1_ViewController.h"

@interface DEMO1_ViewController ()

@end

@implementation DEMO1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    
    UIView *leftView = [[UIView alloc] init];
    
    leftView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:leftView];
    
    
    UIView *rightView = [[UIView alloc] init];
    
    rightView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:rightView];
    
    
    UIView *bottomView = [[UIView alloc] init];
    
    bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bottomView];
    
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //顶部
        make.top.equalTo(self.view).offset(10);
        //左部
        make.left.equalTo(self.view).offset(10);
        //宽
        make.width.equalTo(rightView);
        //高
        make.height.equalTo(@[rightView,bottomView]);
        //右
        make.right.equalTo(rightView.mas_left).offset(-10);
        //底
        make.bottom.equalTo(bottomView.mas_top).offset(-10);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        

        make.top.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(leftView);
        make.height.equalTo(@[leftView,bottomView]);
    }];

    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(leftView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@[leftView,rightView]);
        make.bottom.equalTo(self.view.bottom).offset(-10);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
