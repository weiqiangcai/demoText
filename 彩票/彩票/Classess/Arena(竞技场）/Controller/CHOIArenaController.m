//
//  CHOIArenaController.m
//  彩票
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIArenaController.h"

@interface CHOIArenaController ()

@end

@implementation CHOIArenaController

+(void)initialize{
    
    NSArray *array = [NSArray arrayWithObjects:[self class], nil];
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:array];
    
    [navBar setBackgroundImage:[UIImage ImageWithStretchableImage:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
