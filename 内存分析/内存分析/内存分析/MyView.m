//
//  MyView.m
//  内存分析
//
//  Created by 蔡伟强 on 2018/4/8.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2.画圆
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddEllipseInRect(path, NULL, rect);
    
    CGContextAddPath(context, path);
    
    [[UIColor redColor] set];
    
    CGPathRelease(path);
    
    CGPathRelease(path);
    // CFRelease(path);
    
    CGContextDrawPath(context, kCGPathFill);
}


@end
