//
//  CHOITabBar.h
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHOITabBar;

@protocol CHOITabBarDelegate <NSObject>
@required
-(void)CHOITabBar:(CHOITabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface CHOITabBar : UIView

/** UITabBarItem */
@property(nonatomic,strong)NSArray *tabBarItems;

@property(nonatomic,weak)id <CHOITabBarDelegate>delegate;

@end
