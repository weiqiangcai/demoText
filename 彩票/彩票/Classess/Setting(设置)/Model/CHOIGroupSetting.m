//
//  CHOIGroupSetting.m
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIGroupSetting.h"

@implementation CHOIGroupSetting

+(instancetype)groupWithItem:(NSArray *)items{
    
    CHOIGroupSetting *group = [[self alloc]init];
    
    group.items = items;
    
    return group;
    
}

@end
