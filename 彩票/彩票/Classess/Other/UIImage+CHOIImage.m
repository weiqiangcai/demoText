//
//  UIImage+CHOIImage.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIImage+CHOIImage.h"

@implementation UIImage (CHOIImage)

+(instancetype)imageOrigeRender:(NSString *)image{
    
    UIImage *images = [UIImage imageNamed:image];
    
    return [images imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
}
/**
 * 拉伸图片
 
 @param imageName 图片名称
 @return 返回一张图片
 */
+(instancetype)ImageWithStretchableImage:(NSString *)imageName{
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height*0.5];
    return image;
    
}

@end
