//
//  NSObject+Model.h
//  runtime(模型转换)
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional
// 提供一个协议，只要准备这个协议的类，都能把数组中的字典转模型

+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (Model)
+(instancetype)modelWithDict:(NSDictionary *)dict;

// 对比之前的
//  XMGHtmlItem *item = [XMGHtmlItem objcWithDict:dict mapDict:@{@"ID":@"id"}];
+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
