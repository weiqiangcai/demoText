//
//  CHOICover.m
//  彩票
//
//  Created by cai on 17/11/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOICover.h"

@implementation CHOICover

+(void)show{
    
    CHOICover *cover = [[CHOICover alloc]initWithFrame:CGRectMake(0, 0, CHOIScreenW, CHOIScreenH)];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.alpha = 0.6;
    
    [CHOIKeyWindow addSubview:cover];
    
}
+(void)hide{
    
    for (CHOICover *cover in CHOIKeyWindow.subviews) {
        if ([cover isKindOfClass:self]) {
            [cover removeFromSuperview];
        }
    }
    
}
@end
