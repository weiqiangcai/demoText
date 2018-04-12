//
//  ViewController.m
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "ViewController.h"
#import "CHOIStatuesCell.h"
#import "CHOIStatuesItem.h"
#import "CHOIStatuesFrame.h"

//
#import "CWQXibCell.h"
@interface ViewController ()

/** 数组 */
@property(nonatomic,strong)NSArray *statusArray;

@end

@implementation ViewController

-(NSArray *)statusArray{
    
    if (_statusArray == nil) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
        NSMutableArray *mutArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            CHOIStatuesItem *item = [CHOIStatuesItem statusWithDict:dict];
            CHOIStatuesFrame *statuesFrame = [[CHOIStatuesFrame alloc]init];
            statuesFrame.status = item;
            [mutArray addObject:statuesFrame];
            
        }
        _statusArray = mutArray;
    }
    return _statusArray;
}

static NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 第一种纯代码布局
//    [self.tableView registerClass:[CHOIStatuesCell class] forCellReuseIdentifier:ID];
    
    // 第二种通过xib布局
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CWQXibCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    // self-sizing(iOS8.0)之后
    // 告诉tableView所有cell的真实告诉是自动计算的（根据设置的约束）
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.statusArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 第一种
//    CHOIStatuesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    cell.item = self.statusArray[indexPath.row];
    // 第二种
    CWQXibCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.frameItem = self.statusArray[indexPath.row];
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    CHOIStatuesFrame *sf = self.statusArray[indexPath.row];
//    return sf.cellHeight;
//}
@end
