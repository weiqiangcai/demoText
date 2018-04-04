//
//  NSObject+Model.m
//  runtime(模型转换)
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "NSObject+Model.h"

#import <objc/message.h>
// 获取类里面所有方法
// class_copyMethodList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)// 本质:创建谁的对象


// 获取类里面属性
//  class_copyPropertyList(<#__unsafe_unretained Class cls#>, <#unsigned int *outCount#>)



@implementation NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    // 遍历模型中的所有属性 --> 使用运行时
    
    // 0 创建对应的对象
    id objc = [[self alloc]init];
    
    // 1.利用runtime给对象中的成员属性赋值
    
    //class_copyIvarList：获取类中的所有成员属性
    //Ivar: 成员属性的意思
    //Class  _Nullable __unsafe_unretained cls 表示获取哪个类中的成员属性
    //unsigned int * _Nullable outCount 表示这个类中有多少成员属性，传入一个Int变量地址，对自动给这个变量赋值
    // 返回值： Ivar *: 指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到。
    
    /* 类似下面这种写法
     
     Ivar ivar;
     Ivar ivar1;
     Ivar ivar2;
     // 定义一个ivar的数组a
     Ivar a[] = {ivar,ivar1,ivar2};
     
     // 用一个Ivar *指针指向数组第一个元素
     Ivar *ivarList = a;
     
     // 根据指针访问数组第一个元素
     ivarList[0];
     
     */
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (NSInteger i = 0; i<count; i++) {
        // 根据角标，从数组取出对应的成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        NSLog(@"name---%@",name);
        // 处理成员属性名->字典中的key
        // 从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        
        // 根据成员属性名去字典中查找对应的value
        id value = dict[key];
        
        // 二级转换:如果字典中还有字典，也需要把对应的字典转换成模型
        // 判断下value是否是字典
        if ([value isKindOfClass:[NSDictionary class]]) {
            // 字典转模型
            // 获取模型的类对象，调用modelWithDict
            // 模型的类名已知，就是成员属性的类型
            
            // 获取成员属性类型
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            // 生成的是这种@"@\"User\"" 类型 -》 @"User"  在OC字符串中 \" -> "，\是转义的意思，不占用字符
            // 裁剪类型字符串
            NSRange range = [type rangeOfString:@"\""];
            
            type = [type substringFromIndex:range.location + range.length];
            
            range = [type rangeOfString:@"\""];
            
            // 裁剪到哪个角标，不包括当前角标
            type = [type substringToIndex:range.location];
            // 根据字符串类名生成类对象
            Class modelClass = NSClassFromString(type);
            
            if (modelClass) { // 有对应的模型才需要转
                
                // 把字典转模型
                value  =  [modelClass modelWithDict:value];
            }
            
            
        }
        
        // 三级转换：NSArray中也是字典，把数组中的字典转换成模型.
        // 判断值是否是数组
        if ([value isKindOfClass:[NSArray class]]) {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                
                // 转换成id类型，就能调用任何对象的方法
                id idSelf = self;
                
                // 获取数组中字典对应的模型
                NSString *type =  [idSelf arrayContainModelClass][key];
                
                // 生成模型
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                // 遍历字典数组，生成模型数组
                for (NSDictionary *dict in value) {
                    // 字典转模型
                    id model =  [classModel modelWithDict:dict];
                    [arrM addObject:model];
                }
                
                // 把模型数组赋值给value
                value = arrM;
                
            }
        }
        
        
        if (value) { // 有值，才需要给模型的属性赋值
            // 利用KVC给模型中的属性赋值
            [objc setValue:value forKey:key];
        }
        
    }
    
    return objc;
}
+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict
{
    
    id objc = [[self alloc]init];
    
    // 遍历模型中的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (int i = 0; i< count; i++) {
        Ivar ivar = ivars[i];
        
        NSString *ivarName = @(ivar_getName(ivar));
        // 截取字符串，从第一个位置开始 eg: _ID ==>截取后就是 ID
        ivarName = [ivarName substringFromIndex:1];
        
        // 需要有外界通知内部，模型中属性名对应字典里面的key
        id value = dict[ivarName];
        if (value == nil) {
            if (mapDict) {
                
                NSString *key = mapDict[ivarName];
                value = mapDict[key];
            }
        }
        [objc setValue:value forKey:ivarName];
    }
    
    return  objc;
}
@end
