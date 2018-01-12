//
//  CHOINewFeatureCell.h
//  彩票
//
//  Created by cai on 17/11/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHOINewFeatureCell : UICollectionViewCell

@property(nonatomic,strong)UIImage *image;


-(void)setupIndexPath:(NSIndexPath *)indexPath pageCounts:(NSInteger )couns;

@end
