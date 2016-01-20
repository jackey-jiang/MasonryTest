//
//  DEMO3_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-12.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO3_ViewController.h"

@implementation DEMO3_ViewController
{
    BOOL _leftOrRight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    clickButton.tag = 10;
    [clickButton setTitle:@"点我" forState:UIControlStateNormal];
    [clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clickButton.layer.borderWidth = 2.f;
    clickButton.layer.borderColor = [UIColor redColor].CGColor;
    [clickButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:clickButton];
    
    [clickButton makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(20);
        
        //尺寸
        make.size.equalTo(@50);

    }];
    
}

- (void)buttonClick
{
    _leftOrRight = !_leftOrRight;
    
    [UIView animateWithDuration:0.3 animations:^{
       
        [self moveWithBool:_leftOrRight];
        
        [self.view layoutIfNeeded];
        
    }];
}

- (void)moveWithBool:(BOOL)leftOrRight
{
    UIButton *clickButton = (UIButton *)[self.view viewWithTag:10];
    
    [clickButton remakeConstraints:^(MASConstraintMaker *make) {
       
        make.size.equalTo(@50);
        
        if(_leftOrRight == YES)
        {
            make.bottom.equalTo(self.view).offset(-20);
            make.right.equalTo(self.view).offset(-20);
        }
        else
        {
            make.top.equalTo(self.view).offset(20);
            make.left.equalTo(self.view).offset(20);
        }
        
    }];
    

}

@end
