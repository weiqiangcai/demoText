//
//  CHOIMenu.h
//  彩票
//
//  Created by cai on 17/11/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CHOIMenu : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)UIImage *image;

+(instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

@end
