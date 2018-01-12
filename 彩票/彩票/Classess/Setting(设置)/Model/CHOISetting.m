//
//  CHOISetting.m
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOISetting.h"

@implementation CHOISetting

+(instancetype)initWithImage:(UIImage *)image title:(NSString *)title{
    
    CHOISetting * seting = [[self alloc]init];
    
    seting.image = image;
    
    seting.title = title;
    
    return seting;
    
}

@end
