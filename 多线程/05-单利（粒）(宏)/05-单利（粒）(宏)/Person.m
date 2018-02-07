//
//  Person.m
//  05-单利（粒）(宏)
//
//  Created by virgilChoi on 2018/2/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

// 静态变量 static 不能少 否则，当_person释放后，_person = nil 程序会崩溃
static Person *_person;

@implementation Person

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    // 执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [super allocWithZone:zone];
    });
    return _person;
}
+(instancetype)sharePerson{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [[self alloc]init];
    });
    return _person;
}
-(id)copyWithZone:(NSZone *)zone{
    
    return _person;
}

@end
