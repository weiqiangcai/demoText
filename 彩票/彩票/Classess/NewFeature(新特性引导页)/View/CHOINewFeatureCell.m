//
//  CHOINewFeatureCell.m
//  彩票
//
//  Created by cai on 17/11/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOINewFeatureCell.h"

#import "CHOITabBarViewController.h"

@interface CHOINewFeatureCell ()

@property(nonatomic,weak) UIImageView *imageView;

@property(nonatomic,strong)UIButton *startButton;


@end

@implementation CHOINewFeatureCell

-(UIImageView *)imageView{
    
    if (!_imageView ) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CHOIScrreenBouns];
        
        _imageView = imageView;
        
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

-(UIButton *)startButton{
    
    if (!_startButton ) {
        
        // 使用苹果提供的类方法创建对象，苹果会帮我们管理
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_startButton sizeToFit];
        
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton.center = CGPointMake(CHOIScreenW *0.5, CHOIScreenH * 0.9);
        
        [self.contentView addSubview:_startButton];
    }
    return _startButton;
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    self.imageView.image = image;
}
-(void)setupIndexPath:(NSIndexPath *)indexPath pageCounts:(NSInteger)couns{
    
    if (indexPath.row == couns - 1) {
        
        self.startButton.hidden = NO;
        
    } else {
    
        self.startButton.hidden = YES;
    }
}
// 跳转到核心界面
-(void)start{
    
    // 跳转到核心界面 push modal ，切换跟控制器的方法
    CHOIKeyWindow.rootViewController = [[CHOITabBarViewController alloc]init];

    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleffect";
    [CHOIKeyWindow.layer addAnimation:anim forKey:nil];
}

@end
