//
//  CWQImage.m
//  runtime
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "CWQImage.h"

@implementation CWQImage

// 重写方法:想给系统的方法添加额外功能 不可取
+(UIImage *)imageNamed:(NSString *)name{
    
    UIImage *image = [super imageNamed:name];
    
    if (name) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return image;
}

@end
