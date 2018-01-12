//
//  CHOIActive.m
//  彩票
//
//  Created by cai on 17/11/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIActive.h"

@implementation CHOIActive

+(instancetype)ActiveMenu{
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    
}

+(instancetype)showInPoint:(CGPoint)point{
    
    CHOIActive *active = [CHOIActive ActiveMenu];
    
    active.center = point;
    
    [CHOIKeyWindow addSubview:active];
    
    return active;
}
+(void)hideInPoint:(CGPoint)point completion:(void (^)())completion{
    
    for (CHOIActive *active in CHOIKeyWindow.subviews) {
        if ([active isKindOfClass:self]) {
            [active hideViewAnimation:point completion:^{
               
                if (completion) {
                    completion();
                }
            }];
        }
    }
    
}

-(void)hideViewAnimation:(CGPoint)point completion:(void(^)())completion{
    
   [UIView animateWithDuration:1 animations:^{
       
       // 修改形变，如果直接缩放为0 ，父控件马上消失
       CGAffineTransform transform = CGAffineTransformIdentity;
       
       transform = CGAffineTransformTranslate(transform, -self.center.x +point.x, -self.center.y +point.y);
       transform = CGAffineTransformScale(transform, 0.01, 0.01);

       self.transform = transform;
       
       
   } completion:^(BOOL finished) {
       
       // 如果动画完成，取消view
       [self removeFromSuperview];
       
       if (completion) {
           completion();
       }
       
   }];
    
}

- (IBAction)clickBtn:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(activeButtonClick:)]) {
        [self.delegate activeButtonClick:self];
    }
    
}



@end
