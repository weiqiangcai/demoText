//
//  Person.h
//  05-单利（粒）(宏)
//
//  Created by virgilChoi on 2018/2/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/** 名字 */
@property(nonatomic,copy)NSString *name;

+(instancetype)sharePerson;

@end
