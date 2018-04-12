//
//  ViewController.m
//  内存分析
//
//  Created by 蔡伟强 on 2018/4/8.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    MyView *demoView = [[MyView alloc] init];
    demoView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:demoView];
}
/**
 * 静态内存分析
 */
-(void)staticAnialize{
    
    NSObject *objc = [[NSObject alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
