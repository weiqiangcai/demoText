//
//  Status.m
//  runtime(模型转换)
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "Status.h"

@implementation Status

+ (NSDictionary *)arrayContainModelClass
{
    return @{@"pic_urls" : @"Picture"};
}

+(instancetype)itemWithDict:(NSDictionary *)dict{
    
    Status *item = [[self alloc]init];
    //KVC:把字典中所有值给模型属性赋值
    [item setValuesForKeysWithDictionary:dict];
    
    //
    
    return  item;
}
// 重写系统方法? 1.想给系统方法添加额外功能 2.不想要系统方法实现
// 系统找不到就会调用这个方法,报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}
/*
 KVC 原理：
 1.遍历字典中所有key，去模型中查找有没有对应的属性
 eg:
 [item setValue:@"来自即刻笔记" forKey:@"source"]:
 1.首先去模型中查找有没有setSource,找到，直接调用赋值 [self setSource:@"来自即可笔记"];
 2.取模型中查找有没有source属性，有，直接访问属性赋值 source = value
 3.取模型中查找有没有_source属性，有直接访问属性赋值 _source = value
 4.找不到，就会直接报错 setValue:forUndefinedKey:报找不到的错误
 */

@end
