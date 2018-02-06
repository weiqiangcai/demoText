//
//  ViewController.m
//  001-线程的安全
//
//  Created by virgilChoi on 2018/1/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 售票员01 */
@property(nonatomic,strong) NSThread *thread01;
/** 售票员02 */
@property(nonatomic,strong) NSThread *thread02;
/** 售票员03 */
@property(nonatomic,strong) NSThread *thread03;

@property(nonatomic,assign) NSInteger ticketCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketCount = 100;
    
    // 01
    self.thread01 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicks) object:nil];
    self.thread01.name = @"售票员01";
    
    // 02
    self.thread02 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicks) object:nil];
    self.thread02.name = @"售票员02";
    
    // 03
    self.thread03 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicks) object:nil];
    self.thread03.name = @"售票员03";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
    
}
-(void)saleTicks{
    
    while (1) {
        // 线程同步锁，互斥锁，苹果不推荐使用 消耗cup
        @synchronized(self){
        // 先取出总数
        NSInteger count = self.ticketCount;
        if (count > 0) {
            self.ticketCount = count -1;
            NSLog(@"%@卖了一张票，还剩下%zd张", [NSThread currentThread].name, self.ticketCount);
        } else {
            
            NSLog(@"票卖完了");
            break;
        }
    }
   }
    
}

@end
