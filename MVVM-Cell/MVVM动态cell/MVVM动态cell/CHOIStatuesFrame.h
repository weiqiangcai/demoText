//
//  CHOIStatuesFrame.h
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHOIStatuesItem;
@interface CHOIStatuesFrame : NSObject

/** 模型 */
@property(nonatomic,strong)CHOIStatuesItem *status;

/** 头像的frame */
@property(nonatomic,assign)CGRect iconFrame;
/** 昵称 */
@property(nonatomic,assign)CGRect nameFrame;
/** vip */
@property(nonatomic,assign)CGRect vipFrame;
/** 内容 */
@property(nonatomic,assign)CGRect textFrame;
/** 配图 */
@property(nonatomic,assign)CGRect pictureFrame;


/** 所有cell的高度 */
@property(nonatomic,assign)CGFloat cellHeight;

@end
