//
//  RootViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-14.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _titleStr;
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
