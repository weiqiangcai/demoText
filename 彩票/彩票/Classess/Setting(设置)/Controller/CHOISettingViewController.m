//
//  CHOISettingViewController.m
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOISettingViewController.h"

@implementation CHOISettingViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"设置";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(help)];

    
    [self section0];
    
    [self section1];
    
    [self section2];
}
-(void)help{
    
    
}
-(void)section0{
    
    CHOIArrowSetting *row1 = [CHOIArrowSetting initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    row1.destVc = [UIViewController class];

    
    // 当前有多少组
    CHOIGroupSetting *group = [CHOIGroupSetting groupWithItem:@[row1]];
    group.headTitle = @"第一组";
    group.footerTitle = @"这是组尾";
    
    [self.groups addObject:group];
    
    
}
-(void)section1{
    
    CHOIArrowSetting *row1 = [CHOIArrowSetting initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"推送和提醒"];
    row1.destVc = [UIViewController class];
    
    
    CHOISwithchSetting *item = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item1 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item2 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item3 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    
    // 当前有多少组
    CHOIGroupSetting *group = [CHOIGroupSetting groupWithItem:@[row1,item,item1,item2,item3]];
    group.headTitle = @"第二组";
    
    [self.groups addObject:group];
    
    
}
-(void)section2{
    
    CHOIArrowSetting *row1 = [CHOIArrowSetting initWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"推送和提醒"];
    row1.destVc = [UIViewController class];
    
    
    CHOISwithchSetting *item = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item1 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item2 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    CHOISwithchSetting *item3 = [CHOISwithchSetting initWithImage:[UIImage imageNamed:@""] title:@"使用兑换码"];
    
    // 当前有多少组
    CHOIGroupSetting *group = [CHOIGroupSetting groupWithItem:@[row1,item,item1,item2,item3]];
    group.headTitle = @"第二组";
    
    [self.groups addObject:group];
    
    
}
@end
