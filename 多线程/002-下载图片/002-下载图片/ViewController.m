//
//  ViewController.m
//  002-下载图片
//
//  Created by virgilChoi on 2018/1/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self performSelectorInBackground:@selector(downLoadImage1) withObject:nil];
}

-(void)downLoadImage{
    
    NSURL *url = [NSURL URLWithString:@"https://img.pconline.com.cn/images/photoblog/9/9/8/1/9981681/200910/11/1255259355826.jpg"];
    NSDate *start = [NSDate date];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDate *end = [NSDate date];
    
    NSLog(@"%f",[end timeIntervalSinceDate:start]);
    
    UIImage *image = [UIImage imageWithData:data];
    
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    
    //    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
    //    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
    
    
}
-(void)downLoadImage1{
    
   NSURL *url = [NSURL URLWithString:@"https://img.pconline.com.cn/images/photoblog/9/9/8/1/9981681/200910/11/1255259355826.jpg"];
    
    CFTimeInterval begin = CFAbsoluteTimeGetCurrent();
    
   NSData *data = [NSData dataWithContentsOfURL:url];
    
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"%f",end - begin);
    
    self.imageView.image = [UIImage imageWithData:data];
    
}

@end
