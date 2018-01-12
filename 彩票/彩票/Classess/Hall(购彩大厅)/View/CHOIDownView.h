//
//  CHOIDownView.h
//  彩票
//
//  Created by cai on 17/11/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHOIDownView : UIView


/**
  初始化 方法

 @param superView 要被添加到父控件的view上
 @param items 数组
 @param oriY 位置
 @return 这个类
 */
+(instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY;

-(void)hiden;

@end
