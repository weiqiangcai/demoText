//
//  TwoViewController.m
//  内存分析
//
//  Created by 蔡伟强 on 2018/4/8.
//  Copyright © 2018年 蔡伟强. All rights reserved.
//

/**
 imageName和imageWithContentsOfFile
 
 imageName:加载图片
 1.当对象销毁，图片对象不会随着一起销毁
 2.加载的图片占据的内存较大
 3.相同的图片只会一份到内存中，如果同时使用，使用一份即可
 
 imageWithContenfsOfFile
 1.当对象销毁的时候图片会跟着一起销毁
 2.加载图片占据的内存较小
 3.相同的图片会多次加载到内存中，如果同时使用图片，使用的是不同的对象
 
 总结：
 imageName:如果一些图片在多个界面都会使用，并且图片较小，使用频率高（图片/小的背景图片）
 imageWithContensOfFile:只在一个地方使用，并且图片较大，使用频率不高.(版本新特性/相册)
 
 */

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    self.image1.image = [UIImage imageNamed:@"2"];
    
    
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"2.png" ofType:nil];
    
    self.image1.image = [UIImage imageWithContentsOfFile:imagePath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
