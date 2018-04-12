//
//  ViewController.m
//  const和宏的区别
//
//  Created by 蔡伟强 on 2018/4/12.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import "GloagleConst.h"
// const : 苹果一直推荐我们使用const 而不是宏 为此，swif中已经取消宏了
/**
 const和宏的区别
 1.编译时刻 宏：预编译 const：编译
 2.编译检查 宏没有编译检查 const 有编译检查
 3.宏的好处 定义方法函数 const 不可以
 4.宏的坏处 大量使用宏，会导致预编译时间过长
 */



#define ChoiName @"name"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSUserDefaults standardUserDefaults] setObject:@"adfa" forKey:ChoiName];
    
    NSLog(@"全局const---:%@",CWQconstant);
    
    [self constTest];
}

#pragma mark const
/*
 const 作用：1.修饰右边基本变量或者指针变量
            2.被const修饰变量只读
 */
-(void)constTest{
    
    /*****修饰基本变量*******/
    int const a = 3;
    const int b = 5;
    // 以上两种方式等价于（都可以的）
    // a = 4; 报错
    //Cannot assign to variable 'a' with const-qualified type 'const int'
    // 不能将具有const限定类型的const int赋值给变量'a'。
    // 修饰指针变量
    
    /*****修饰指针*******/
    int c = 5;
    int d;
    int const *p = &c;
    c = 7;
    //*p = 9; 报错 Read-only variable is not assignable
    p = &d;
    
    [self test:&c];
    
}
-(void)test2{
    
    int * const p;  // p:只读  *p:变量
    int const * p1; // p1:变量 *p1:只读
    const int * p2; // p2:变量 *p2:只读
    const int * const p3; // p3:只读 *p3:只读
    int const * const p4; // p4:只读  *p4:只读
    
}
#pragma mark const开发中常用
NSString  * const name = @"name";
/**
 * 开发中常用
 * 1.修饰全局变量 ->全局只读变量 ->代替宏
 * 2.修饰方法总参数
 */
-(void)test:(int *)b{
    
    int a = *b;
    NSLog(@"%d",a);
    
}

#pragma mark static和extern使用
int  i = 100;

/**
 static:
 1.修饰局部变量,被static修饰局部变量,延长生命周期,跟整个应用程序有关
 *.被static修饰局部变量,只会分配一份内存
 *.被static修饰的局部变量,在程序一运行就会给static修饰的变量分配内存
 
 2.修饰全局变量,被static修饰全局变量,作用域会修改,只能在当前文件夹下使用
 
 extern:声明外部全局变量,注意:extern只能用于声明,不能用于定义
 
 extern工作原理:先会去当前文件夹下查找有没有对应全局变量,如果没有,才会去其他文件查找
 
 */

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static int a = 0;
    a ++;
    
    NSLog(@"%d",a);
}

#pragma mark static和const联合使用

/*
 const:修饰全局变量
 static修饰全局变量,修改作用域
 */
static NSString * const unite = @"联合";


#pragma mark extern和const联合使用
// 规定:全局变量定义在自己类中,自己定义全局文件夹管理全局东西
@end
