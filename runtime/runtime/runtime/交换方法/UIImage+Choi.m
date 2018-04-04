//
//  UIImage+Choi.m
//  runtime
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "UIImage+Choi.h"
#import <objc/message.h>
@implementation UIImage (Choi)
/**
 * 把类加载进内存的时候调用，只会调用一次
 */
+(void)load{
    
    // 获取imageNamed 方法
    //Class  _Nullable __unsafe_unretained cls 获取哪个类的方法
    //SEL  _Nonnull name  获取哪个方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    // 获取choi_imageNamed方法：
    Method choi_imageNamedMethod = class_getClassMethod(self, @selector(choi_imageNamed:));
    
    //Method  _Nonnull m1 方法交换
    method_exchangeImplementations(imageNamedMethod, choi_imageNamedMethod);
    
}

+(UIImage *)choi_imageNamed:(NSString *)name{
    
    UIImage *image = [UIImage choi_imageNamed:name];
    
    if (image) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return nil;
}
// 在分类中,最好不要重写系统方法,一旦重写,把系统方法实现给干掉

//+ (UIImage *)imageNamed:(NSString *)name
//{
//    // super -> 父类NSObject
//
//}
// 会调用多次
//+ (void)initialize
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    });
//
//}
@end
