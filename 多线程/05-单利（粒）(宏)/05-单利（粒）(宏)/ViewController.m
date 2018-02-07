//
//  ViewController.m
//  05-单利（粒）(宏)
//
//  Created by virgilChoi on 2018/2/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h" // 原始
#import "CHOICar.h" // 宏 common
#import "Dog.h" // 可以改变的
#import "Phone.h" // 非GCD 单利
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self Phone];
}

/**
 * 非GCD 单粒模式
 */
-(void)Phone{
    
    Phone *p1 = [Phone shareInstance];
    
    Phone *p2 = [[Phone alloc]init];
    
    NSLog(@"%p  %p",p1,p2);
    
}

/**
 * 单粒模式（宏） 可修改变量名
 */
-(void)dog{
    
    Dog *p1 = [Dog shareDog];
    p1.name = @"Jack";
    Dog *p2 = [[Dog alloc]init];
    
    NSLog(@"%p  %p",p1,p2);
     NSLog(@"%@  %@",p1,p2.name);
}

/**
 * 单粒模式（宏） 统一样式
 */
-(void)car{
    
    CHOICar *p1 = [CHOICar shareInstance];

    CHOICar *p2 = [[CHOICar alloc]init];
    
    NSLog(@"%p  %p",p1,p2);
}

/**
 * 单粒模式 
 */
-(void)person{
    
    Person *p1 = [Person sharePerson];
    p1.name = @"jack";
    Person *p2 = [[Person alloc]init];
    
    NSLog(@"%@  %@",p1,p2.name);
    NSLog(@"%p  %p",p1,p2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
