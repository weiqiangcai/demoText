//
//  CHOISettingCell.h
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHOISetting;

@interface CHOISettingCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;


@property(nonatomic,strong)CHOISetting *item;


@end
