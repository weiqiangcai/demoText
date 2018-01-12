//
//  CHOISaveTool.h
//  彩票
//
//  Created by cai on 17/11/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHOISaveTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;
@end
