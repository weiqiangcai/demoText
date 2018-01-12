//
//  CHOINewLuckyViewController.m
//  彩票
//
//  Created by cai on 17/11/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOINewLuckyViewController.h"

@interface CHOINewLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *luckImage;

@end

@implementation CHOINewLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image2 = [UIImage imageNamed:@"lucky_entry_light1"];
    _luckImage.animationImages = @[image1,image2];
    
    _luckImage.animationDuration = 1.0;
    
    [_luckImage startAnimating];
    
    
    
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
