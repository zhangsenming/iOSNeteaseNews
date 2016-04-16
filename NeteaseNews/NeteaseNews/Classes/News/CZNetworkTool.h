//
//  CZNetworkTool.h
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface CZNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;
@end
