//
//  UIView+masonry.h
//  Masonry-AutoLayout
//
//  Created by 江坤 on 15/3/24.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface UIView (masonry)

//水平排列
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;


//垂直排列
- (void) distributeSpacingVerticallyWith:(NSArray*)views;



@end
