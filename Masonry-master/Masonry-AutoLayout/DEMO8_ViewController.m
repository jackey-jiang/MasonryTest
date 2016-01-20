//
//  DEMO8_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO8_ViewController.h"

#warning 可以定义一个边距,包含对应的4个方向的值(kPadding.top;kPadding.left等)
static UIEdgeInsets const kPadding = {10, 10, 10, 10};

@implementation DEMO8_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label1 = [UILabel new];
    
    //无限行
    label1.numberOfLines = 0;
    //根据字符来包装
    label1.lineBreakMode = NSLineBreakByCharWrapping;

    label1.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    label1.backgroundColor = [UIColor redColor];
    [self.view addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    
    label2.text = @"太极娃娃";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:24.f];
    label2.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:label2];
    
    UILabel *label3 = [UILabel new];
    
    label3.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:label3];
    
    
    //如果是动态布局label  不用设置高度, 系统会根据文字的长度自动计算
    [label1 makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.width.equalTo(@220);
        
    }];
    
    [label2 makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(label1.bottom).offset(20);
        make.left.right.equalTo(self.view).insets(kPadding);
        
    }];
    
    [label3 makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-10);
        make.left.equalTo(label1.right).offset(20);
        //label3的高度会根据label1的高度 动态调整
        make.height.equalTo(label1.height);
        
    }];

}

@end
