//
//  CWQXibCell.m
//  备课07-自定义不等高的cell-frame
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 小码哥. All rights reserved.
//

#import "CWQXibCell.h"
#import "CHOIStatuesFrame.h"
#import "CHOIStatuesItem.h"
@interface CWQXibCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLb;

@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@end

@implementation CWQXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)setFrameItem:(CHOIStatuesFrame *)frameItem{
    
    _frameItem = frameItem;
    CHOIStatuesItem *statues = frameItem.status;
    self.nameLb.text = statues.name;
    self.contentLb.text = statues.text;
    self.iconImageView.image = [UIImage imageNamed:statues.icon];
    if (statues.vip) {
        self.vipImageView.hidden = NO;
        self.nameLb.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLb.textColor = [UIColor blackColor];
    }
    
    if (statues.picture) {
        self.pictureImageView.image = [UIImage imageNamed:statues.picture];
        self.pictureImageView.hidden = NO;
    } else {
        self.pictureImageView.hidden = NO;
    }
    
    
    
}


@end
