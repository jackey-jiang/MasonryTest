//
//  DEMO12_ViewController.m
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-13.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import "DEMO12_ViewController.h"
#import "CustomTableViewCell.h"

@implementation DEMO12_ViewController
{
    CustomTableViewCell *_staticCell;
    
    UITableView *_rootTableView;
    NSArray *_rootDataArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _staticCell = [CustomTableViewCell new];
    
    //取消留白
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _rootDataArray = [NSArray new];
    
    _rootTableView = [UITableView new];
    
    _rootTableView.delegate = self;
    _rootTableView.dataSource = self;
    
    [self.view addSubview:_rootTableView];
    
    //这句代码 可以 省略掉tableview多余的cell
    _rootTableView.tableFooterView = [UIView new];
    
    [_rootTableView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view);
        make.left.bottom.right.equalTo(self.view);
        
    }];
    
    //请求数据
    [self startRequsetData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rootDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if(cell == nil)
    {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.subLabel.text = _rootDataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#warning 此处很重要
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //这个cell最好做成一个全局的,否则会比较消耗资源
#warning 相当于创建一个CustomTableViewCell的cell,然后根据文字长度动态计算出contentView的高度,然后把计算出来的这个高度返回
    
    _staticCell.subLabel.text = _rootDataArray[indexPath.row];
    
    //此处使用sizeToFit
    return [_staticCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 20;
}

- (void)startRequsetData
{
    _rootDataArray = @[@"Hello friends",
                    @"The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.",
                    @"OH HAI AUTO SIZING TABLE CELL LOOK AT ME I'M SO COOL I MAKE YOUR LIFE EASIER WHHEEEEEEEEE"];
    
    [_rootTableView reloadData];
}



@end
