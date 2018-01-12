//
//  CHOIBaseSettingController.h
//  彩票
//
//  Created by cai on 17/11/28.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CHOIGroupSetting.h"
#import "CHOIArrowSetting.h"
#import "CHOISwithchSetting.h"

@interface CHOIBaseSettingController : UITableViewController

// 记录当前tableview的所有数组
@property(nonatomic,strong)NSMutableArray *groups;


@end
