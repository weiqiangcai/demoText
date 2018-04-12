//
//  CHOIStatuesCell.m
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "CHOIStatuesCell.h"
#import "CHOIStatuesFrame.h"
#import "CHOIStatuesItem.h"
@interface CHOIStatuesCell ()

/** 头像 */
@property(nonatomic, weak)UIImageView *iconImageView;
/** 昵称 */
@property(nonatomic, weak)UILabel *nameLabel;
/** vip */
@property(nonatomic, weak)UIImageView *vipImageView;
/** 内容(正文) */
@property(nonatomic, weak)UILabel *text_label;
/** 配图 */
@property(nonatomic, weak)UIImageView *pictureImageView;
@end

@implementation CHOIStatuesCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupView];
    }
    return self;
}

-(void)setupView{
    /** 头像 */
    UIImageView *iconImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    /** 昵称 */
    UILabel *nameLb = [[UILabel alloc]init];
    nameLb.font = CHOINameFont;
    [self.contentView addSubview:nameLb];
    self.nameLabel = nameLb;
    
    /** vip */
    UIImageView *vipImageView = [[UIImageView alloc]init];
    vipImageView.image = [UIImage imageNamed:@"vip"];
    vipImageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:vipImageView];
    self.vipImageView = vipImageView;
    
    /** 内容(正文) */
    UILabel *text_label = [[UILabel alloc]init];
    text_label.numberOfLines = 0;
    text_label.font = CHOITextFont;
    [self.contentView addSubview:text_label];
    self.text_label = text_label;
    
    /** 配图 */
    UIImageView *pictureImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:pictureImageView];
    self.pictureImageView = pictureImageView;
}
-(void)setItem:(CHOIStatuesFrame *)item{
    
    _item = item;
    
    CHOIStatuesItem *statues = item.status;
    self.nameLabel.text = statues.name;
    self.text_label.text = statues.text;
    self.iconImageView.image = [UIImage imageNamed:statues.icon];
    if (statues.vip) {
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    if (statues.picture) {
        self.pictureImageView.image = [UIImage imageNamed:statues.picture];
        self.pictureImageView.hidden = NO;
    } else {
        self.pictureImageView.hidden = NO;
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.iconImageView.frame = self.item.iconFrame;
    self.nameLabel.frame = self.item.nameFrame;
    self.vipImageView.frame = self.item.vipFrame;
    self.text_label.frame = self.item.textFrame;
    self.pictureImageView.frame = self.item.pictureFrame;
    
}
@end
