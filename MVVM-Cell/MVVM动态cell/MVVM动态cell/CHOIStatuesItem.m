//
//  CHOIStatuesItem.m
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "CHOIStatuesItem.h"

@implementation CHOIStatuesItem

+(instancetype)statusWithDict:(NSDictionary *)dict{
    
    CHOIStatuesItem *item = [[self alloc]init];
    
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

@end
