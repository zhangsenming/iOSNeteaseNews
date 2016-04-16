//
//  CZLoopView.h
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZLoopView : UIView

/**
 *  根据url和标题初始化轮播器
 *
 *  @param URLS   图片URL数组
 *  @param titles 标题数组
 *
 *  @return 图片轮播器
 */
- (instancetype)initWithURLS:(NSArray <NSString *>*)URLs andTitles:(NSArray <NSString *>*)titles;
@end
