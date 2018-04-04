//
//  ViewController.m
//  runtime(模型转换)
//
//  Created by 蔡伟强 on 2018/4/4.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+Property.h"
#import "NSObject+Log.h"

#import "NSObject+Model.h"
#import "Status.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *statuses;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // 获取字典数组
    NSArray *dictArr = dict[@"statuses"];
    
    NSDictionary *dict1 = dictArr[0];
    
    [dict1 createPropertyCode];
    
    _statuses = [NSMutableArray array];
    
    // 遍历字典数组
    for (NSDictionary *dict in dictArr) {
        
        Status *status = [Status modelWithDict:dict];
        
        [_statuses addObject:status];
        
    }
    
    [NSObject resolveDict:dict1[@"user"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
