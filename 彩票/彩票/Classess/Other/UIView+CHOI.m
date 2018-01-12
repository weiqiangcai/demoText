//
//  UIView+CHOI.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIView+CHOI.h"

@implementation UIView (CHOI)

-(void)setX:(CGFloat)x{
    
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
    
}
-(CGFloat)x{
    
  return self.frame.origin.x;
}
-(void)setY:(CGFloat)y{
    
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

-(void)setWidth:(CGFloat)width{
    
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
    
}
-(CGFloat)width{
    
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
-(CGFloat)height{
    
    return self.frame.size.height;
}

-(void)setCentetX:(CGFloat)centetX{
    
    CGPoint center = self.center;
    center.x = centetX;
    self.center = center;
    
}
-(CGFloat)centetX{
    
    return self.center.x;
}

-(void)setCentetY:(CGFloat)centetY{
    
    CGPoint center = self.center;
    center.y = centetY;
    self.center = center;
}
-(CGFloat)centetY{
    
    return self.center.y;
}

@end
