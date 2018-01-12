//
//  CHOIDownView.m
//  彩票
//
//  Created by cai on 17/11/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIDownView.h"
#import "CHOIMenu.h"
#define CHOICols 3
#define CHOIitemWH CHOIScreenW / CHOICols

@interface CHOIDownView()

@property(nonatomic,strong) NSMutableArray *btns;
@property (nonatomic, strong) NSArray *items;
@end

@implementation CHOIDownView

-(void)hiden{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
        
    } completion:^(BOOL finished) {
    
        [self removeFromSuperview];
        
    }];
    
    
    
}

+(instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY{
    
    
    // 高度 == 总行数  rows = (count -1)/(cols +1)
    NSInteger count = items.count;
    NSInteger rows = (count - 1)/CHOICols +1;
    CGFloat x = 0;
    CGFloat y = oriY;
    CGFloat menuW = CHOIScreenW;
    CGFloat menuH = rows * CHOIitemWH;
    
    CHOIDownView *downView = [[self alloc]initWithFrame:CGRectMake(x, y, menuW, menuH)];

    downView.items = items;
    // 添加子button
    [downView setupChildBtn:items];
    
    // 添加线view
    [downView addLineView];
    
    UIView *blackView = [[UIView alloc]initWithFrame:downView.frame];
    blackView.backgroundColor = [UIColor blackColor];
    [superView addSubview:blackView];
    
    downView.transform = CGAffineTransformMakeTranslation(0, -downView.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        downView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
       
        [blackView removeFromSuperview];
    }];
    
    
    downView.backgroundColor = [UIColor blackColor];
    
    [superView addSubview:downView];
    
    return downView;
}
-(void)addLineView{
    
    for (int i = 0; i < CHOICols - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake((i + 1) * CHOIitemWH, 0, 1, self.height);
        
        [self addSubview:divideV];
    }
    NSUInteger rows = (self.items.count - 1) / CHOICols + 1;
    
    // 横:总行数-1
    // x = 0 y = （i + 1） * itemWh w:menu.w h 1
    for (int i = 0; i < rows - 1; i++) {
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake(0, (i + 1) * CHOIitemWH, self.width, 1);
        
        [self addSubview:divideV];
    }

}
/**
 * 布局自button

 @param array 模型数组
 */
-(void)setupChildBtn:(NSArray *)array{
    
    for (CHOIMenu * items in self.items) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:items.title forState:UIControlStateNormal];
        [button setImage:items.image forState:UIControlStateNormal];
        
        [self addSubview:button];
        
        [self.btns addObject:button];
    }
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSInteger count = self.items.count;
    int cols = 0;
    NSUInteger rows = 0;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = CHOIitemWH;
    CGFloat h = CHOIitemWH;

    
    for (NSInteger i = 0; i<count ; i++) {
        
        cols = i % CHOICols;
        rows = i / CHOICols;
        
        UIButton *btn = self.btns[i];
        x = cols *w;
        y = rows *h;
        
        btn.frame = CGRectMake(x, y, w, h);
        
    }
 
    
}
-(NSMutableArray *)btns{
    
    if (!_btns ) {
        
        _btns = [NSMutableArray array];
    }
    return _btns;
}
@end
