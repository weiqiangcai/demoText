//
//  CHOIHallTableViewController.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIHallTableViewController.h"
#import "CHOIDownView.h"
#import "CHOIMenu.h"
#import "CHOICover.h"
#import "CHOIActive.h"

@interface CHOIHallTableViewController ()<CHOIActiveDelegate>

@property(nonatomic,weak) CHOIDownView *downMenu;

@property(nonatomic,assign)BOOL isHiden;



@end

@implementation CHOIHallTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageOrigeRender:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(myActive)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageOrigeRender:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMenu)];
}

/**
 * 左侧点击事件
 */
-(void)myActive{
    
    [CHOICover show];
    
    CHOIActive *active = [CHOIActive showInPoint:self.view.center];
    
    active.delegate = self;
    
}
#pragma mark - <CHOIActiveDelegate>
-(void)activeButtonClick:(CHOIActive *)active{
    
    [CHOIActive hideInPoint:CGPointMake(44, 44) completion:^{
       
        [CHOICover hide];
        
    }];
}

/**
 * 右侧点击事件 自定义的菜单
 */
-(void)popMenu{

    if (_isHiden == NO) {
    
        [self downMenu];
        
    } else {
        
        [self.downMenu hiden];
    }
    
    _isHiden = !_isHiden;
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
#pragma mark - 懒加载
-(CHOIDownView *)downMenu{
    
    if (!_downMenu ) {
        CHOIMenu *menu = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        CHOIMenu *menu1 = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        CHOIMenu *menu2 = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        CHOIMenu *menu3 = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        CHOIMenu *menu4 = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        CHOIMenu *menu5 = [CHOIMenu initWithImage:[UIImage imageNamed:@"Development"] title:nil];
        NSArray *array = [NSArray arrayWithObjects:menu,menu1,menu2,menu3,menu4,menu5, nil];
        
        _downMenu = [CHOIDownView showInView:self.view items:array oriY:0];
        
        
    }
    return _downMenu;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
