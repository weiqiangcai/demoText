//
//  CHOILuckButton.m
//  彩票
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOILuckButton.h"

@implementation CHOILuckButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    
    [super setImage:image forState:state];
    
    [self sizeToFit];
    
}
@end
