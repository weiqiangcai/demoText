//
//  Dog.m
//  runtime
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "Dog.h"
#import <objc/message.h>

@implementation Dog

// 没有返回值,也没有参数
// void,(id,SEL)
void dogFight (id self,SEL _cmd,NSNumber  *meter){
    
    NSLog(@"狗打架%@次，从没有输过",meter);
}
void dogRun (){
    NSLog(@"狗跑了很久，都没有停过");
}
/**
 * 作用： 动态添加方法，处理未实现
 * 任何方法默认都有两个隐式参数，self _cmd
 * 什么时候调用：只要一个对象调用了一个未实现的方法就会调用这个方法进行处理
 
 @param sel 方法名
 @return  bool
 */
+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    // 写法一：sel == @selector(fight:)  sel == NSSelectorFromString(@"fight:")
    // 写法二：sel == NSSelectorFromString(@"fight:")
    // 写法三：[NSStringFromSelector(sel) isEqualToString:@"fight:"]
    if ([NSStringFromSelector(sel) isEqualToString:@"fight:"]) {
    
        //Class  _Nullable __unsafe_unretained cls  给那个类添加方法
        //SEL  _Nonnull name 添加方法的方法编号
        //IMP  _Nonnull imp 添加方法的函数实现（函数地址）
        //const char * _Nullable types 函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, sel, (IMP)dogFight, "v@:@");
        return YES;
    } else if (sel == NSSelectorFromString(@"dogRun")){
        
        class_addMethod(self, sel,(IMP) dogRun, "v@:");
    }
    
    
    return [super resolveInstanceMethod:sel];
}



@end
