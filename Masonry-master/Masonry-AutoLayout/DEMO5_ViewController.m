//
//  DEMO5_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO5_ViewController.h"

@implementation DEMO5_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#warning 第一种方式 使用edge(边距)
    UIView *lastView = [UIView new];
    
    [self.view addSubview:lastView];
    
    [lastView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
    for(int i = 0 ; i < 10; i ++)
    {
        UIView *subView  = [[UIView alloc] init];
        
        subView.backgroundColor = [self randomColor];
        
        [self.view addSubview:subView];
        
        [subView makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));
        }];
        
        
        lastView = subView;
    }
    
    
#warning 第二种方式  使用Margin(边距)   (ios8以上可用) (自我感觉没第一种好用)
    
//    UIView *lastView = [UIView new];
//    
//    //这里设置
////    lastView.layoutMargins = UIEdgeInsetsMake(5, 10, 15, 20);
//    
//    [self.view addSubview:lastView];
//    
//    [lastView makeConstraints:^(MASConstraintMaker *make) {
//
//        UIView *navi = (id)self.topLayoutGuide;
//
//        make.top.equalTo(navi.bottom);
//        make.left.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//        make.right.equalTo(self.view);
//    }];
//    
//    for(int i = 0 ; i < 10; i ++)
//    {
//        UIView *subView  = [[UIView alloc] init];
//
//        subView.backgroundColor = [self randomColor];
//        subView.layoutMargins = UIEdgeInsetsMake(5, 10, 15, 20);
//        [self.view addSubview:subView];
//
//        [subView makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(lastView.topMargin);
//            make.left.equalTo(lastView.leftMargin);
//            make.bottom.equalTo(lastView.bottomMargin);
//            make.right.equalTo(lastView.rightMargin);
//        }];
//
//        
//        lastView = subView;
//    }
    
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
