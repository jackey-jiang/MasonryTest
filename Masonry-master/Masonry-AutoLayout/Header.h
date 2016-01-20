//
//  Header.h
//  Masonry-AutoLayout
//
//  Created by AVGD on 15-3-12.
//  Copyright (c) 2015年 327156719@qq.com. All rights reserved.
//

#ifndef Masonry_AutoLayout_Header_h
#define Masonry_AutoLayout_Header_h


//加入这句宏   可以不用使用mas_前缀
#define MAS_SHORTHAND
#import "Masonry.h"

//屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//自动适配宽度,width为原始iphone4/5的宽度
#define AUTO_MATE_WIDTH(width) ((width) * SCREEN_WIDTH / 320.0)

//自动适配宽度,width为原始iphone4/5的高度
#define AUTO_MATE_HEIGHT(height) ((height) * SCREEN_HEIGHT / 568.0)

#endif
