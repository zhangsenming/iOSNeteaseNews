//
//  CZHeadLineViewController.m
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import "CZHeadLineViewController.h"
#import "CZLoopView.h"
#import "CZHeadLine.h"

@interface CZHeadLineViewController ()

@end

@implementation CZHeadLineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载头条数据
    [CZHeadLine headlinesWithSuccess:^(NSArray *headLines) {
        
        //图片数组
        NSArray *imgs = [headLines valueForKeyPath:@"imgsrc"];
        //标题数组
        NSArray *titles = [headLines valueForKeyPath:@"title"];
        //创建图片轮播器
        CZLoopView *loopView = [[CZLoopView alloc] initWithURLS:imgs andTitles:titles];
        loopView.frame = self.view.bounds;
        [self.view addSubview:loopView];
        
    } andFailure:^(NSError *error) {
        
    }];
}



@end
