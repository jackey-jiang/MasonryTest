//
//  DEMO7_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.

#import "DEMO7_ViewController.h"

@interface DEMO7_ViewController()

@property(nonatomic, strong)NSMutableArray *animatableConstraints;;   /**< 约束数组 */

@end

@implementation DEMO7_ViewController
{
    UIView *_leftView;
    UIView *_rightView;
    UIView *_bottomView;
    
    int _padding;
    //缩小 或者 放大
    BOOL _cutdownOrBlowup;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.hidden = YES;
    
    
    int padding = _padding = 10;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(_padding, _padding, _padding, _padding);
    
    self.animatableConstraints = NSMutableArray.new;
    
    _leftView = [UIView new];
    
    _leftView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_leftView];
    
    _rightView = [UIView new];
    
    _rightView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_rightView];
    
    _bottomView = [UIView new];
    
    _bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:_bottomView];
    
    
    
    [_leftView makeConstraints:^(MASConstraintMaker *make) {
       
        [self.animatableConstraints addObjectsFromArray:@[
                                                      
          make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(),
          make.bottom.equalTo(_bottomView.top).offset(-padding),
          ]];
        
        make.size.equalTo(_rightView);
        make.height.equalTo(_bottomView.height);
    }];
    
    [_rightView makeConstraints:^(MASConstraintMaker *make) {
       
        [self.animatableConstraints addObjectsFromArray:@[
                                                      
          make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(),
          make.left.equalTo(_leftView.right).offset(padding),
          make.bottom.equalTo(_bottomView.top).offset(-padding),
          ]];
        
        make.size.equalTo(_leftView);
        make.height.equalTo(_bottomView.height);
        
    }];
    
    [_bottomView makeConstraints:^(MASConstraintMaker *make) {
       
        [self.animatableConstraints addObjectsFromArray:@[
                                                          
          make.edges.equalTo(self.view).insets(paddingInsets).priorityLow(),
          ]];
        
        make.height.equalTo(_leftView.mas_height);

        
    }];
    
    //deBug  调试
    MASAttachKeys(_leftView,_rightView, _bottomView,self.view);
    

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    

    [self.view layoutIfNeeded];
    
    _cutdownOrBlowup = YES;
    
    [self animateWithInvertedInsets:NO];
}

- (void)animateWithInvertedInsets:(BOOL)invertedInsets {
    if (!_cutdownOrBlowup) return;
    
    NSLog(@"循环");
    
    int padding = invertedInsets ? 100 : _padding;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in self.animatableConstraints) {
        constraint.insets = paddingInsets;
    }
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        //repeat!
        [self animateWithInvertedInsets:!invertedInsets];
    }];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    _cutdownOrBlowup = NO;
    
    NSLog(@"呵呵哒");
}


@end
