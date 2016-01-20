//
//  DEMO16_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-18.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO16_ViewController.h"


@implementation DEMO16_ViewController
{
    NSMutableArray *_viewHorArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewHorArray = [NSMutableArray new];
    
    
    UIView *rootView = [UIView new];
    
    rootView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:rootView];
    
    
    [rootView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view).offset(10);
        make.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 10, 10));
    }];
    
    
    /**
     *  横向排列的view
     */
    for(int i = 0; i < 4; i ++)
    {
        UIView *subView = [UIView new];
        
        subView.backgroundColor = [UIColor redColor];
        
        [rootView addSubview:subView];
        
        [subView makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.centerY.equalTo(rootView);
        }];
        
        [_viewHorArray addObject:subView];
    }
    
    
    
    //横向排列
    [rootView distributeSpacingHorizontallyWith:_viewHorArray];

    
}

@end
