//
//  CHOITabBarViewController.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOITabBarViewController.h"
#import "CHOIArenaViewController.h"
#import "CHOIMyLotterViewController.h"
#import "CHOIHallTableViewController.h"
#import "CHOIHistoryTableViewController.h"
#import "CHOIDiscoverTableViewController.h"
#import "CHOINavigationController.h"

#import "CHOIArenaController.h"
// /Users/Mac/Documents/彩票/彩票/Classess/Other/CHOICP.pch

#import "CHOITabBar.h"

@interface CHOITabBarViewController ()<CHOITabBarDelegate>

@property(nonatomic,strong)NSMutableArray *itemsArray;


@end

@implementation CHOITabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self setupChilderView];
    
    [self setupTabbarItems];
    
//    self.selectedIndex = 0;
}
-(void)setupTabbarItems{
    
    
    
    CHOITabBar *tabbar = [[CHOITabBar alloc]init];
    
    tabbar.tabBarItems = self.itemsArray;
    
    tabbar.delegate = self;
    
    // 注意这个赋值 为题 之前是self.tabBar.frame 
    tabbar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabbar];

    // 测试
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[CHOITabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}


#pragma mark - <CHOITabBarDelegate>

-(void)CHOITabBar:(CHOITabBar *)tabBar didClickBtn:(NSInteger)index{
    
    self.selectedIndex = index;
    
}

// tabbar上的按钮是有尺寸的 ，不能超过44
-(void)setupChilderView{
    
    
    // 购彩大厅
    CHOIHallTableViewController *hall = [[CHOIHallTableViewController alloc]init];
    [self initializeChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];

    
    // 竞技场
    CHOIArenaViewController *area = [[CHOIArenaViewController alloc]init];
    [self initializeChildViewController:area image:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    // 发现
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CHOIDiscoverTableViewController" bundle:nil];
    CHOIDiscoverTableViewController *disc = [storyboard instantiateInitialViewController];
    
    [self initializeChildViewController:disc image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    // 开奖信息
    CHOIHistoryTableViewController *history = [[CHOIHistoryTableViewController alloc]init];
    [self initializeChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    // 我的彩票
    CHOIMyLotterViewController *lotter = [[CHOIMyLotterViewController alloc]init];
    [self initializeChildViewController:lotter image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
    
}
-(void)initializeChildViewController:(UIViewController *)VC image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    
    VC.navigationItem.title = title;
    
    VC.tabBarItem.image = image;
    VC.tabBarItem.selectedImage = selectedImage;
    VC.title = title;
    
    // 记录所有控制器对应按钮内容
    [self.itemsArray addObject:VC.tabBarItem];
    
//    VC.view.backgroundColor = [self arcRandomColor];
    
    UINavigationController *nav = [[CHOINavigationController alloc]initWithRootViewController:VC];
    
    if ([VC isKindOfClass:[CHOIArenaViewController class]]) {
        nav = [[CHOIArenaController alloc]initWithRootViewController:VC];
        
    }
    
    [self addChildViewController:nav];
    
}
-(UIColor *)arcRandomColor{
    
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
    
}

-(NSMutableArray *)itemsArray{
    
    if (!_itemsArray ) {
        
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
