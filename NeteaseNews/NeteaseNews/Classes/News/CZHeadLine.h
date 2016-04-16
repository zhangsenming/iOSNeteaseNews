//
//  CZHeadLine.h
//  NeteaseNews
//
//  Created by 张森明 on 16/4/16.
//  Copyright © 2016年 sonmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHeadLine : NSObject
/**
 *  头条新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  头条图片
 */
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)headLineWithDict:(NSDictionary *)dict;

+ (void)headlinesWithSuccess:(void (^)(NSArray *headLines))success andFailure:(void (^)(NSError *error))failure;
@end
