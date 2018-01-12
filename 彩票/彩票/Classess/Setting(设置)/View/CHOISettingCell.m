//
//  CHOISettingCell.m
//  彩票
//
//  Created by cai on 17/11/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOISettingCell.h"
#import "CHOIArrowSetting.h"
#import "CHOISwithchSetting.h"
@interface CHOISettingCell ()

@property(nonatomic,strong) UIImageView *arrawImageView;

@property(nonatomic,strong)UISwitch *switchView;


@end

@implementation CHOISettingCell

-(UIImageView *)arrawImageView{
    
    if (!_arrawImageView ) {
        
        _arrawImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrawImageView;
}

-(UISwitch *)switchView{
    
    if (!_switchView ) {
        
        _switchView = [[UISwitch alloc]init];
    }
    return _switchView;
}

+(instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    
    
        
        static NSString *cellID = @"cell";
        
        CHOISettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[CHOISettingCell alloc]initWithStyle:style reuseIdentifier:cellID];
            
        }
        return cell;

}

-(void)setItem:(CHOISetting *)item{
    
    _item = item;
    
    // 设置控件上的内容
    [self setupData];
    
    //设置辅助视图
    [self setUpAccessoryView];
}
-(void)setupData{
    
    self.textLabel.text = _item.title;
    
    self.imageView.image = _item.image;
    
    self.detailTextLabel.text = _item.subTtitle;
    
}
-(void)setUpAccessoryView{
    
    if ([_item isKindOfClass:[CHOIArrowSetting class]]) {
        // 箭头
        self.accessoryView = self.arrawImageView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if([_item isKindOfClass:[CHOISwithchSetting class]]){
        // 开关
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else {
        
        // 还原
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

@end
