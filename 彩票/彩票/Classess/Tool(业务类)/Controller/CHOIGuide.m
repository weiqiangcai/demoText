//
//  CHOIGuide.m
//  彩票
//
//  Created by cai on 17/11/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIGuide.h"
#import "CHOINewFeatureViewController.h"
#import "CHOITabBarViewController.h"
#import "CHOISaveTool.h"

#define CHOIVersion @"version"

@implementation CHOIGuide

+(UIViewController *)chooseViewController{
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    // 保存版本号
    NSString *oldVersion = [CHOISaveTool objectForKey:CHOIVersion];
    UIViewController *rootVc = nil;
    if ([currentVersion isEqualToString:oldVersion]) { // 进入核心界面
        
        rootVc = [[CHOITabBarViewController alloc]init];
        
    } else {// 有新版本 进入新的页面
        // 这是个colllerciow view 必须初始化设置布局参数
        rootVc = [[CHOINewFeatureViewController alloc]init];
        
        [CHOISaveTool setObject:currentVersion forKey:CHOIVersion];
    }
    
    return rootVc;
}

@end
