//
//  CHOIStatuesFrame.m
//  MVVM动态cell
//
//  Created by 蔡伟强 on 2018/4/7.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

#import "CHOIStatuesFrame.h"
#import "CHOIStatuesItem.h"
@implementation CHOIStatuesFrame

-(void)setStatus:(CHOIStatuesItem *)status{
    
    _status = status;
    // 定义一个间距
    CGFloat space = 10;
    // 头像
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 30;
    CGRect iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    self.iconFrame = iconFrame;
    // 昵称
    CGFloat nameX = CGRectGetMaxX(iconFrame) +space;
    CGFloat nameY = iconY;
    // 计算昵称大小
    CGSize nameSize = [status.name sizeWithAttributes:@{NSFontAttributeName:CHOINameFont}];
    CGRect nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    self.nameFrame = nameFrame;
    // VIP
    if (status.vip) {
        CGFloat vipX = CGRectGetMaxX(nameFrame) +space;
        CGFloat vipY = iconY;
        CGFloat vipWH = 14;
        CGRect vipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
        self.vipFrame = vipFrame;
    }
    
    // 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(iconFrame) +space;
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2*space;
    CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [status.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CHOITextFont} context:nil].size.height;
    CGRect textFrame = CGRectMake(textX, textY, textW, textH);
    self.textFrame = textFrame;
    // 配图
    if (status.picture) {
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + space;
        CGFloat pictureWH = 100;
        CGRect pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        self.pictureFrame = pictureFrame;
        
        _cellHeight = CGRectGetMaxY(pictureFrame) +space;
    } else {
        _cellHeight = CGRectGetMaxY(textFrame) +space;
    }
    
}

@end
