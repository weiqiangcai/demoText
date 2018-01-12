//
//  UIImage+CHOIImage.h
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHOIImage)


/**
 * 使用原来图片

 @param image 图片名称
 @return 返回一张图片
 */
+(instancetype)imageOrigeRender:(NSString *)image;

/**
 * 拉伸图片

 @param imageName 图片名称
 @return 返回一张图片
 */
+(instancetype)ImageWithStretchableImage:(NSString *)imageName;

@end
