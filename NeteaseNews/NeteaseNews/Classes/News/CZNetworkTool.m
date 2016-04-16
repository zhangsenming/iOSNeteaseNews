//
//  CZNetworkTool.m
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import "CZNetworkTool.h"

@implementation CZNetworkTool
+ (instancetype)sharedNetworkTool
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/ad/"];
        instance = [[self alloc] initWithBaseURL:baseURL];
    });
    return instance;
}
@end
