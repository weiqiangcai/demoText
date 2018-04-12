//
//  CHOIStatuesItem.h
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CHOINameFont [UIFont systemFontOfSize:17]
#define CHOITextFont [UIFont systemFontOfSize:14]
@interface CHOIStatuesItem : NSObject
/**
 *  图像
 */
@property (nonatomic ,copy)NSString *icon;
/**
 *  昵称
 */
@property (nonatomic ,copy)NSString *name;
/**
 *  vip
 */
@property (nonatomic ,assign ,getter=isVip)BOOL vip;
/**
 *  内容
 */
@property (nonatomic ,copy)NSString *text;
/**
 *  配图
 */
@property (nonatomic ,copy)NSString *picture;

+(instancetype)statusWithDict:(NSDictionary *)dict;

@end
