//
//  CHOINewFeatureViewController.m
//  彩票
//
//  Created by cai on 17/11/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOINewFeatureViewController.h"
#import "CHOINewFeatureCell.h"

@interface CHOINewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;

@end

@implementation CHOINewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

// uicollectionviewcontoller 的层次结构: 控制器view上面 UIcollectionview
// self.view != self.collectionview
// cell必须通过注册
// 自定义cell
-(instancetype)init{
 
    // 流水布局对象 设置cell的尺寸和位置
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    //
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 这只cell的尺寸
    layout.itemSize = CHOIScrreenBouns.size;
    // 设置间距
    layout.minimumInteritemSpacing = 0;
    // 这只行距
    layout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.bounces = NO;

    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    // 注册cell
    [self.collectionView registerClass:[CHOINewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setUpAllChildView];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

#define CHOIPages 4
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return CHOIPages;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    CHOINewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setupIndexPath:indexPath pageCounts:CHOIPages];
    return cell;
    
}
- (void)setUpAllChildView
{
    // guide1
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    _guideView = guide;
    guide.centetX = self.view.centetX;
    
    
    [self.collectionView addSubview:guide];
    
    // guideLine
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 170;
    
    [self.collectionView addSubview:guideLine];
    
    // largerText
    UIImageView *largerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largerText.centetX = self.view.centetX;
    largerText.centetY = self.view.height * 0.7;
    _guideLargetView = largerText;
    [self.collectionView addSubview:largerText];
    
    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _guideSmallView = smallText;
    smallText.centetX = self.view.centetX;
    smallText.centetY = self.view.height * 0.8;
    [self.collectionView addSubview:smallText];
}

// 减速完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 获取当前x偏移量
    CGFloat curOffsetX = scrollView.contentOffset.x;
    
    // 获取差值
    CGFloat delta = curOffsetX - _lastOffsetX;
    
    _guideView.x += 2 *  delta;
    _guideLargetView.x += 2 * delta;
    _guideSmallView.x +=  2 * delta;
    
    [UIView animateWithDuration:0.25 animations:^{
        _guideView.x -=  delta;
        _guideLargetView.x -= delta;
        _guideSmallView.x -=   delta;
    }];
    
    int page = curOffsetX / self.view.width + 1;
    
    // 修改控件的内容
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    _lastOffsetX = curOffsetX;
    
}

@end
