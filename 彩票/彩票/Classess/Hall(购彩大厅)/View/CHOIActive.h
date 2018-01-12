//
//  CHOIActive.h
//  彩票
//
//  Created by cai on 17/11/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHOIActive;
@protocol CHOIActiveDelegate <NSObject>

-(void)activeButtonClick:(CHOIActive *)active;

@end

@interface CHOIActive : UIView


@property(nonatomic,weak)id <CHOIActiveDelegate>delegate;


+(instancetype)ActiveMenu;

+(instancetype)showInPoint:(CGPoint)point;

+(void)hideInPoint:(CGPoint)point completion:(void(^)())completion;

@end
