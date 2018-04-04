//
//  ViewController.m
//  runtime（添加属性）
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

/**
 动态添加属性:什么时候需要动态添加属性
 开发场景
 给系统的类添加属性的时候,可以使用runtime动态添加属性方法
 
 本质:动态添加属性，本质就是让某个属性与对象产生关联
 
 需求:让一个NSObject类 保存一个字符串
 
 runtime一般都是针对系统的类
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc]init];
    p.name = @"cwq";
    
    NSLog(@"%@",p.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
