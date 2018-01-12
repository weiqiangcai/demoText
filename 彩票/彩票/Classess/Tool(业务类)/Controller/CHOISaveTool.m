//
//  CHOISaveTool.m
//  彩票
//
//  Created by cai on 17/11/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOISaveTool.h"

@implementation CHOISaveTool


+(id)objectForKey:(NSString *)defaultName{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+(void)setObject:(id)value forKey:(NSString *)defaultName{
    
    return [[NSUserDefaults standardUserDefaults]setObject:value forKey:defaultName];
}

@end
