//
//  CHOINewLucky.m
//  彩票
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOINewLucky.h"

@implementation CHOINewLucky


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    
    [image drawInRect:rect];
}

@end
