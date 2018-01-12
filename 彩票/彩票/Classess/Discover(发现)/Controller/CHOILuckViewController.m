//
//  CHOILuckViewController.m
//  彩票
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOILuckViewController.h"
#import "CHOILuckButton.h"

@interface CHOILuckViewController ()

@property(nonatomic,weak) CHOILuckButton *button;

@end

@implementation CHOILuckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CHOILuckButton *button = [CHOILuckButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    _button = button;
    
    [button sizeToFit];
    
    
    self.navigationItem.titleView = button;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"帮助" style:UIBarButtonItemStyleDone target:self action:@selector(help)];
    
}
-(void)help{
    
    CHOILogFunc;
    
    [_button setTitle:@"全部彩种全部彩种" forState:UIControlStateNormal];
    
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
