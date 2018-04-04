//
//  NSObject+Property.h
//  runtime（添加属性）
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类：只会生成get set方法声明，不会生成实现，也不会生成下划线成员属性
@property NSString *name;

@end
