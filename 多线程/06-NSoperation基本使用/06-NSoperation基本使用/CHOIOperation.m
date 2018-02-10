//
//  CHOIOperation.m
//  06-NSoperation基本使用
//
//  Created by virgilChoi on 2018/2/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CHOIOperation.h"

@implementation CHOIOperation


/**
 * 队列内容都写在 这个里面
 */
-(void)main{
    
    NSLog(@"%s",__func__);
    NSLog(@"-----自己的队列--");
    
    for (NSInteger i = 0; i<1000; i++) {
        NSLog(@"download1 -%zd-- %@", i, [NSThread currentThread]);
    }
    if (self.isCancelled) return;
    
    for (NSInteger i = 0; i<1000; i++) {
        NSLog(@"download2 -%zd-- %@", i, [NSThread currentThread]);
    }
    if (self.isCancelled) return;
    
    for (NSInteger i = 0; i<1000; i++) {
        NSLog(@"download3 -%zd-- %@", i, [NSThread currentThread]);
    }
    if (self.isCancelled) return;
    
}

@end
