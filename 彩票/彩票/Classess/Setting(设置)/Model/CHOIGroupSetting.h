//
//  CHOIGroupSetting.h
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHOIGroupSetting : NSObject

@property(nonatomic,strong)NSArray *items;

@property(nonatomic,strong)NSString *headTitle;

@property(nonatomic,strong)NSString *footerTitle;

+(instancetype)groupWithItem:(NSArray *)items;

@end
