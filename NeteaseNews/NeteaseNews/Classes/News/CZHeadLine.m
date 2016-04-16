//
//  CZHeadLine.m
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import "CZHeadLine.h"
#import "CZNetworkTool.h"

@implementation CZHeadLine

+ (instancetype)headLineWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

+ (void)headlinesWithSuccess:(void (^)(NSArray *headLines))success andFailure:(void (^)(NSError *error))failure
{
    NSAssert(success!=nil, @"必须传入成功回调");
    [[CZNetworkTool sharedNetworkTool] GET:@"headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject ----- %@",responseObject);
        //获取字典的第一个key
        NSString *rootKey = [responseObject keyEnumerator].nextObject;
        //根据key获取数组
        NSArray *array = responseObject[rootKey];
        //模型数组·
        NSMutableArray *arrayM = [NSMutableArray array];
        //遍历数组
        for (NSDictionary *dict in array) {
            //字典转模型
            CZHeadLine *headLine = [CZHeadLine headLineWithDict:dict];
            //添加模型到数组
            [arrayM addObject:headLine];
        }
        //将结果传递给调用方法
        success(arrayM.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error ----- %@",error);
    }];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
