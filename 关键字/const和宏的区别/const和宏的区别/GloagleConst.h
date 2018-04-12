//
//  GloagleConst.h
//  const和宏的区别
//
//  Created by 蔡伟强 on 2018/4/12.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
#define CWQKIT_EXTERN        extern "C" __attribute__((visibility ("default")))
#else
#define CWQKIT_EXTERN            extern __attribute__((visibility ("default")))
#endif

CWQKIT_EXTERN NSString * const CWQconstant;

