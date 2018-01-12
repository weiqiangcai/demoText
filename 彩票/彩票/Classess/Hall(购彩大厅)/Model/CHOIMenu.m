//
//  CHOIMenu.m
//  彩票
//
//  Created by cai on 17/11/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIMenu.h"

@implementation CHOIMenu

+(instancetype)initWithImage:(UIImage *)image title:(NSString *)title{
    
    CHOIMenu *menu = [[self alloc]init];
    
    menu.title = title;
    
    menu.image = image;
    
    return menu;
}

@end
