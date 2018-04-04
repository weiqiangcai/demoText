//
//  Status.h
//  runtime(模型转换)
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface Status : NSObject

@property (nonatomic, strong) NSString *source;

@property (nonatomic, assign) int reposts_count;

@property (nonatomic, strong) NSArray *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) int attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) int comments_count;

@property (nonatomic, strong) User *user;

+(instancetype)itemWithDict:(NSDictionary *)dict;

@end
