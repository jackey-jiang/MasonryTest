//
//  DEMO15_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-18.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO15_ViewController.h"

@implementation DEMO15_ViewController
{
    NSMutableArray *_viewVerArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewVerArray = [NSMutableArray new];
    
    
    UIView *rootView = [UIView new];
    
    rootView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:rootView];
    
    
    [rootView makeConstraints:^(MASConstraintMaker *make) {
   
        make.top.equalTo(self.view).offset(10);
        make.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 10, 10));
    }];
    
    
    /**
     *  纵向排列的view
     */
    for(int i = 0; i < 4; i ++)
    {
        UIView *subView = [UIView new];
        
        subView.backgroundColor = [UIColor redColor];
        
        [rootView addSubview:subView];
        
        [subView makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.centerX.equalTo(rootView);
        }];
        
        [_viewVerArray addObject:subView];
        
        MASAttachKeys(subView);
    }
    
    
    
    //执行纵向排列的方法
    [rootView distributeSpacingVerticallyWith:_viewVerArray];
    
    
    
    //deBug  调试
    MASAttachKeys(self.view, rootView,self.view);
    

}

@end
