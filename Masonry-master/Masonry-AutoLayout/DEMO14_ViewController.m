//
//  DEMO14_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-14.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO14_ViewController.h"
#import "CustomCollectionViewCell.h"
@implementation DEMO14_ViewController
{
    CustomCollectionViewCell *_staticCell;
    UICollectionView *_collectionView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _staticCell = [CustomCollectionViewCell new];
    
    //初始化网格层
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    //滚动方向 垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //初始化网格视图
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, 500, 500) collectionViewLayout:flowLayout];
//    _collectionView = [[UICollectionView alloc] init];
//    _collectionView.collectionViewLayout = flowLayout;
    //设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //注册系统或者自定义的cell,必须添加
    [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:_collectionView];
    
    [_collectionView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view);
        make.left.bottom.right.equalTo(self.view);
        
    }];
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//返回每个cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

//    CGFloat width = [_staticCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width;
//    CGFloat height = [_staticCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 20;
//    NSLog(@"width = %f, height = %f", width, height);
//    //此处使用sizeToFit
//    return CGSizeMake(width, height);
    return CGSizeMake(80, 80);
}

//每个分组cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

//配置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

//item的最小横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    //横向
    return 10.f;
}

//item的最小纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //纵向
    return 10.f;
}


//当前cell被点击触发的事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"第%ld个cell被点击了",(long)indexPath.row);
}


//设置当前section的整体边缘间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
