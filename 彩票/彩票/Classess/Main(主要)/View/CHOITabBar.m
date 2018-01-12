//
//  CHOITabBar.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOITabBar.h"

@interface CHOITabBar ()

@property(nonatomic,strong) UIButton *selectedBtn;

@end

@implementation CHOITabBar


-(void)setTabBarItems:(NSArray *)tabBarItems{

    _tabBarItems = tabBarItems;
    
    
    for (UITabBarItem *items in tabBarItems) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setBackgroundImage:items.image forState:UIControlStateNormal];
        
        [button setBackgroundImage:items.selectedImage forState:UIControlStateSelected];
        
        button.tag = self.subviews.count;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        if (self.subviews.count == 1) {
            [self buttonClick:button];
        }
        
    }
    
}
-(void)buttonClick:(UIButton *)button{
    
    self.selectedBtn.selected = NO;
    
    button.selected = YES;
    
    self.selectedBtn = button;
    
    if ([_delegate respondsToSelector:@selector(CHOITabBar:didClickBtn:)]) {
        
        [_delegate CHOITabBar:self didClickBtn:button.tag];
    }
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat h = self.height;
    CGFloat w = CHOIScreenW /count;

    for (NSInteger i = 0 ; i<count; i++) {
     
        UIButton *btn = self.subviews[i];
        
        btn.frame = CGRectMake(i*w, 0, w, h);
        
        
    }
    
    
}

@end
