//
//  CZLoopView.m
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import "CZLoopView.h"
#import "CZLoopViewCell.h"
#import "CZLoopViewFlowLayout.h"

@interface CZLoopView ()<UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *URLs;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation CZLoopView

/**
 *  根据url和标题初始化轮播器
 *
 *  @param URLS   图片URL数组
 *  @param titles 标题数组
 *
 *  @return 图片轮播器
 */
- (instancetype)initWithURLS:(NSArray <NSString *>*)URLs andTitles:(NSArray <NSString *>*)titles
{
    if (self = [super init]) {
        //记录URL数组
        self.URLs = URLs;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //添加子控件
        [self setup];
    }
    return self;
}


/**
 *  添加子控件
 */
- (void)setup
{
    //创建UICollectiionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[CZLoopViewFlowLayout alloc] init]];
    
    //设置背景颜色
    collectionView.backgroundColor = [UIColor whiteColor];
    //注册cell
    [collectionView registerClass:[CZLoopViewCell class] forCellWithReuseIdentifier:@"loopCell"];
    //设置数据源
    collectionView.dataSource = self;
    //添加到轮播器中
    [self addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.URLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 获得cell
    CZLoopViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"loopCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;
}


@end
