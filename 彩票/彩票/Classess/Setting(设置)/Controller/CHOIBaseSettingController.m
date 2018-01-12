//
//  CHOIBaseSettingController.m
//  彩票
//
//  Created by cai on 17/11/28.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIBaseSettingController.h"
#import "CHOISettingCell.h"


@interface CHOIBaseSettingController ()

@end

@implementation CHOIBaseSettingController

-(NSMutableArray *)groups{
    
    if (!_groups ) {
        
        _groups = [NSMutableArray array];
    }
    return _groups;
}
-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    CHOIGroupSetting *group = self.groups[section];
    
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CHOISettingCell *cell = [CHOISettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    // 取出哪一组
    CHOIGroupSetting *group = self.groups[indexPath.section];
    
    // 取出哪一行
    CHOISetting *item = group.items[indexPath.row];
    
    // 给cell赋模型
    cell.item = item;
    
    return cell;
}
// 返回title标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    CHOIGroupSetting *group = self.groups[section];
    
    return group.headTitle;
}
// 返回底部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    CHOIGroupSetting *group = self.groups[section];
    
    return group.footerTitle;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CHOIGroupSetting *group = self.groups[indexPath.section];
    
    CHOISetting *item = group.items[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion(indexPath);
    }
    
    if ([item isKindOfClass:[CHOIArrowSetting class]]) {
        // 箭头
        CHOIArrowSetting *arrow = (CHOIArrowSetting *)item;
        if (arrow.destVc) {
            
            UIViewController *vc = [[arrow.destVc alloc]init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
   
        }
        
    }
    
}
@end
