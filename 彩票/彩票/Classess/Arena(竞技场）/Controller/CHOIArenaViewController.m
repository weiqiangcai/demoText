//
//  CHOIArenaViewController.m
//  彩票
//
//  Created by cai on 17/10/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "CHOIArenaViewController.h"
#import "CHOINextViewController.h"
@interface CHOIArenaViewController ()

@end

@implementation CHOIArenaViewController

-(void)loadView{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CHOIScrreenBouns];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage ImageWithStretchableImage:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    
    seg.width += 40;
    
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:15];
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    seg.selectedSegmentIndex = 0;
    self.navigationItem.titleView = seg;
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CHOINextViewController *vc = [[CHOINextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
