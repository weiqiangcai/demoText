//
//  ViewController.m
//  runtime
//
//  Created by 蔡伟强 on 2018/4/2.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"
#import "Dog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self msg];
//    [self test];
    
    // 方法交换
//    [self methodExchangeImplementation];
    
    [self addMethod];
}

#pragma mark - 3 动态添加方法

/*
 Runtime(动态添加方法):OC都是懒加载机制，只要一个方法实现了，就会马上添加到方法列表中
 app:免费版,收费版
 QQ,微博,直播等等应用,都有会员机制
 
 美团有个面试题?有没有使用过performSelector,什么时候使用?动态添加方法的时候使用过?怎么动态添加方法?用runtime?为什么要动态添加方法?
 */

-(void)addMethod{
    
//    Dog *d = [[Dog alloc]init];
    Dog *d = objc_msgSend([Dog class], @selector(alloc));
    
    d = objc_msgSend(d, sel_registerName("init"));
    
    [d performSelector:@selector(dogRun)];
    
    // fight 打架
    [d performSelector:@selector(fight:) withObject:@5];
    
    
    
}

#pragma mark - 2 交换方法 重点
/**
 runtime(交换方法):只要想修改系统的的方法实现
 需求：
 比如一个项目，已经开发2年了，忽然项目负责人添加一个功能，每次UIImage加载图片，告诉我是否加载成功
 
 方法一：
 给系统的imageNamed:添加功能，只能使用runtime(交互方法)
 1. 给系统的方法添加分类
 2.自己实现一个带有扩展功能的方法
 3.交换方法，只需要交换一次
 方法二：
 1.自定义UIImage
 2.UIImage添加分类
 
 弊端：
 1.每次使用,都需要导入
 2.项目大了,没办法实现
 
 */

/**
 * 交换方法 重点
 */
-(void)methodExchangeImplementation{
    
    UIImage *image = [UIImage imageNamed:@"1"];
    NSLog(@"%@",image);
}

#pragma mark -msg 1 消息机制
// runtime 必须导入头文件<objc/message.h>
// 任何方法调用本质： 发送一个消息，用runtime 发送消息.OC底层实现通过runtime实现
// 解决消息机制方法提示步骤
// 查找build setting  -> 搜索msg
// 类方法本质：类对象调用[NSObject class]
// id:谁发送消息
// SEL: 发送什么消息

/*
   内存5大区：https://www.jianshu.com/p/a3d42a70be3d
   1.栈 2.堆 3.静态区 4.常量区 5.方法区
   栈：不需要手动管理内存,系统自动管理
   堆：需要手动管理内存，需要自己释放
 
 */
// runtime :方法都有前缀,谁的事情谁开头
/*
 方法调用流程：
 怎么区调用eat方法,对象方法：类对象的方法列表 类方法：元类中方法列表
 // 1.通过isa去对应的类中查找
 // 2.注册方法编号
 // 3.根据方法编号去查找对应方法
 // 4.找到最终函数实现地址，根据地址去方法区调用对应函数
 */

//
-(void)msg{
    
    //Person *p1 = [Person alloc]; <==>如下
//    Person *p = objc_msgSend(objc_getClass("Person"),sel_registerName("alloc") );
    Person *p = objc_msgSend([Person class],sel_registerName("alloc") );
    
    //p = [p init]; <==>
    //p = objc_msgSend(p, @selector(init));
    p = objc_msgSend(p, sel_registerName("init"));
    
    // [p eat];
    objc_msgSend(p, @selector(eat));

    // 执行: -(void)run:(NSInteger)metre
    //objc_msgSend(id  _Nullable self, SEL  _Nonnull op, ...)
    //id  _Nullable self ==> 对象 p|| [Person alloc] || objc_msgSend(objc_getClass("Person")
    //SEL  _Nonnull op, ==>执行方法 ==>sel_registerName("run:")||@selector(run:)
    //... ==>参数
    objc_msgSend(p, sel_registerName("run:"),5);
}
-(void)test{
    
//    id objc = [NSObject alloc];
    id objc = objc_msgSend(objc_getClass("NSObject"), sel_registerName("alloc"));
    
//    objc = [objc init];
    objc = objc_msgSend(objc, @selector(init));
    
    NSLog(@"objc---%@",objc);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
