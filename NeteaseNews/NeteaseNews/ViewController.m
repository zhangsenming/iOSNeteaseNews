//
//  ViewController.m
//  NeteaseNews
//
//  Created by 张森明 on 16/4/14.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import "ViewController.h"
#import "CZHeadLine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [CZHeadLine headlinesWithSuccess:^(NSArray *headLines) {
        NSLog(@"headlines ----%@",headLines);
    } andFailure:^(NSError *error) {
        
    }];
}

@end
