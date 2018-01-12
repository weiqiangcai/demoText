//
//  CHOINavigationController.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOINavigationController.h"
#import <objc/runtime.h>

@interface CHOINavigationController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) id popDelegate;

@end

@implementation CHOINavigationController
// 加载类的时候调用，当程序一启动的时候就调用
+(void)load{
    
    
}

/**
 * 当前类或者他的子类第一次使用的时候才会调用，仅且一次
 */
+(void)initialize{
    
    NSArray *array = [NSArray arrayWithObjects:[self class], nil];
    
    UINavigationBar  *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:array];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条颜色
    NSMutableDictionary *attriDic = [NSMutableDictionary dictionary];
    attriDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attriDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar setTitleTextAttributes:attriDic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    // 取出系统手势target手势对象
    // 取出某个对象里面属性 1.kvc 前提条件 必须知道属性名 2.运行时
    // 遍历某个类里面的所有属性 Ivar: 表示成员属性
    // copyIvarList只能获取那个类下面的属性，并不会越界（并不会把他父类的属性打印出来）
    // Class 获取那个类的成员属性
    // count 告诉你当前类里面成员属性的总数
    unsigned int count = 0;
    
    // 返回成员属性的数组
    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
    
    for (int i = 0; i < count; i++) {
        // 取出成员变量
        Ivar ivar = ivars[i];
        // 获取属性名
        NSString *ivarName = @(ivar_getName(ivar));
        
       
        
    }
    
    // 属性名
    NSArray *targets = [self.interactivePopGestureRecognizer valueForKey:@"_targets"];
    
//     NSLog(@"%@--%zd",targets,targets.count);
    
    id objc = [targets firstObject];
    
    id target = [objc valueForKey:@"_target"];
    
    NSLog(@"%@",target);
    
    // 其实
//    self.interactivePopGestureRecognizer.delegate == target
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
    
    
}
// 是否开始触发手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    // 判断当前是否是跟控制器
    return (self.topViewController != [self.viewControllers firstObject]);
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count  != 0) { // 非跟控制器
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航条左边按钮的内容，把系统的返回按钮给覆盖，导航控制器的返回功能就木有了
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(popset)];
    }
 
    [super pushViewController:viewController animated:animated];
}
-(void)popset{
    
    [self popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
