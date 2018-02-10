//
//  ViewController.m
//  06-NSoperation基本使用
//
//  Created by virgilChoi on 2018/2/8.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "CHOIOperation.h"

@interface ViewController ()

@property(nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self muchDataExeample];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    if (self.queue.isSuspended) {
        // 不要挂起，继续执行
        self.queue.suspended = NO;

    } else {
        // 暂停队列，（挂起）队列
        self.queue.suspended = YES;
    }

    // 取消所有的队列
//    [self.queue cancelAllOperations];
    
}
#pragma mark - 掌握

/**
 * 耗时操作才可以更加的明显区别出来
 */
-(void)muchDataExeample{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    queue.maxConcurrentOperationCount = 1;
    
    [queue addOperationWithBlock:^{
        for (NSInteger i = 0; i< 5000; i++) {
             NSLog(@"download1 -%zd-- %@", i, [NSThread currentThread]);
        }
    }];
    
    [queue addOperationWithBlock:^{
        for (NSInteger i = 0; i< 1000; i++) {
             NSLog(@"download2 -%zd-- %@", i, [NSThread currentThread]);
        }
    }];
    
    [queue addOperationWithBlock:^{
        for (NSInteger i = 0; i< 1000; i++) {
             NSLog(@"download3 -%zd-- %@", i, [NSThread currentThread]);
        }
    }];
    
    [queue addOperationWithBlock:^{
        for (NSInteger i = 0; i< 1000; i++) {
             NSLog(@"download4 -%zd-- %@", i, [NSThread currentThread]);
        }
    }];
    
    self.queue = queue;
    // 结论: 当点击暂停的时候，只会暂停当前线程之后的子线程，当前线程的大量数据处理是不会被暂停的。eg：如果download1 正在进行的时候，
    
}

/**
 * NSOperation 常用的几个属性
 */
-(void)operationProperty{
    
    self.queue = [[NSOperationQueue alloc]init];
    
    // 控制队列数 默认为 -1 当为1是就变成串行队列了。
    self.queue.maxConcurrentOperationCount = 2;
    
    [_queue addOperationWithBlock:^{
        NSLog(@"download1 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [_queue addOperationWithBlock:^{
        NSLog(@"download2 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    
    // 挂起队列，暂停执行
    self.queue.suspended = YES;
    
    [_queue addOperationWithBlock:^{
        NSLog(@"download3 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [_queue addOperationWithBlock:^{
        NSLog(@"download4 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [_queue addOperationWithBlock:^{
        NSLog(@"download5 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    
}
/**
 * 几种创建队列的方式
 */
-(void)operationQueue{
    
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    // 控制队列数 默认为 -1 当为1是就变成串行队列了。
    //    queue.maxConcurrentOperationCount = 2;
    
    // 队列样式 1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download1-------%@",[NSThread currentThread]);
    }];
    
    
    // 队列样式 2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download2-------%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
       NSLog(@"download3-------%@",[NSThread currentThread]);
    }];
    
    
    // 队列样式 3
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(run:) object:@"小王"];
    
    // 队列样式 4
    // 这种是直接将队列和NSBlockOperation 合并到一起的
    [queue addOperationWithBlock:^{
       NSLog(@"合并队列-------%@",[NSThread currentThread]);
    }];
    
    // 队列样式 5
    // 继承nsoperation的队列
    CHOIOperation *op4 = [[CHOIOperation alloc]init];
    
    // 队列依赖
    [op4 addDependency:op3];
    [op4 addDependency:op2];
    
    
    // 添加队列
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    
}
#pragma mark -了解
/**
 * blockOperation 操作
 */
-(void)blockOperation{
    NSLog(@"%s",__func__);
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        //
        NSLog(@"下载1----%@",[NSThread currentThread]);
    }];
    
    // 添加额外的任务
    [op addExecutionBlock:^{
       
        NSLog(@"下载2------%@",[NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        
        NSLog(@"下载3------%@",[NSThread currentThread]);
    }];
    
    [op addExecutionBlock:^{
        
        NSLog(@"下载4------%@",[NSThread currentThread]);
    }];
    
    [op start];
}
-(void)invocationOperation{
    
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(run:) object:@"jack"];
    [op start];
}
-(void)run:(NSString *)name{
    
    NSLog(@"%s",__func__);
    
    NSLog(@"name-------%@",name);
}
@end
