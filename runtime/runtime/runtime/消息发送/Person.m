//
//  Person.m
//  runtime
//
//  Created by 蔡伟强 on 2018/4/2.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)eat{
    NSLog(@"Person----吃了");
}

-(void)run:(NSInteger)metre{
    
    NSLog(@"person -- 跑了%zd米",metre);
}

@end
