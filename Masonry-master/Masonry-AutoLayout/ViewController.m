//
//  ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-3.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RootViewController.h"
#import "DEMO1_ViewController.h"
#import "DEMO2_ViewController.h"
#import "DEMO3_ViewController.h"
#import "DEMO4_ViewController.h"
#import "DEMO5_ViewController.h"
#import "DEMO6_ViewController.h"
#import "DEMO7_ViewController.h"
#import "DEMO8_ViewController.h"
#import "DEMO9_ViewController.h"
#import "DEMO10_ViewController.h"
#import "DEMO11_ViewController.h"
#import "DEMO12_ViewController.h"
#import "DEMO13_ViewController.h"
#import "DEMO14_ViewController.h"
#import "DEMO15_ViewController.h"
#import "DEMO16_ViewController.h"
#import "DEMO17_ViewController.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_rootTableView;
    
    NSArray *_classArray;
    NSArray *_rootTitleArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Masonry使用指南";
    
    _rootTitleArray = @[@"多个控件相对约束",@"更新约束",@"重置约束",@"使用约束",@"循环生成",@"倍率与优先级",@"循环动画",@"动态label",@"纵向scrollView",@"横向scrollView",@"使用数组保存多个控件进行约束",@"tableView及cell的动态布局",@"弹性动画",@"CollectionView及cell的动态布局(未完成)",@"纵向等距排列",@"横向等距排列",@"不同尺寸控件的等距排列"];
    
    _classArray = @[[DEMO1_ViewController class], [DEMO2_ViewController class], [DEMO3_ViewController class], [DEMO4_ViewController class], [DEMO5_ViewController class], [DEMO6_ViewController class], [DEMO7_ViewController class], [DEMO8_ViewController class], [DEMO9_ViewController class],[DEMO10_ViewController class],[DEMO11_ViewController class], [DEMO12_ViewController class], [DEMO13_ViewController class], [DEMO14_ViewController class], [DEMO15_ViewController class], [DEMO16_ViewController class], [DEMO17_ViewController class]];
    
    //创建一个列表
    _rootTableView = [UITableView new];
    
    _rootTableView.delegate = self;
    _rootTableView.dataSource = self;
    
    [self.view addSubview:_rootTableView];
    
    //设置tableView的边缘==父视图
    [_rootTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _classArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"DEMO%ld---%@",(long)indexPath.row + 1, _rootTitleArray[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RootViewController *vc = [[_classArray[indexPath.row] alloc] init];
    
    vc.titleStr = _rootTitleArray[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
