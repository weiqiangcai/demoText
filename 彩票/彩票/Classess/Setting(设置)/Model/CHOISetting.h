//
//  CHOISetting.h
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHOISetting : NSObject

@property(nonatomic,strong)UIImage *image;

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *subTtitle;

@property(nonatomic,strong)void (^itemOpertion)(NSIndexPath *indexPath);

+(instancetype)initWithImage:(UIImage *)image title:(NSString *)title;



@end
