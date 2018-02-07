//
//  Phone.m
//  05-单利（粒）(宏)
//
//  Created by virgilChoi on 2018/2/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "Phone.h"

@implementation Phone

static id _instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    @synchronized(self){
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}
+(instancetype)shareInstance{

    @synchronized(self){
        if (_instance == nil) {
            _instance = [[self alloc]init];
        }
    }
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
@end
