//
//  ViewController.m
//  03-GCD的基本使用
//
//  Created by virgilChoi on 2018/2/1.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

/**
  多线程中的队列有：串行队列，并行队列，全局队列，主队列
  多线程有四种：pthread ,NSthread,GCD ,NSOperation
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    [self downloadImage];
}

/**
 * 实战异步下载任务
 */
-(void)downloadImage{
    
    NSLog(@"%s",__func__);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517548325443&di=8b1c5912f25900d7718bd279c3754f54&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dpixel_huitu%252C0%252C0%252C294%252C40%2Fsign%3Decfe83b9042442a7ba03f5e5b83bc827%2F728da9773912b31bc2fe74138d18367adab4e17e.jpg"];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.imageView.image = image;
            
        });
        
    });

}

/**
 * 同步任务的使用场景
 */
-(void)serialSync{
    
    NSLog(@"-----begin");
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.queue", DISPATCH_QUEUE_CONCURRENT);
    // 1. 用户登录，必须要第一个执行
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"用户登录-----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"下载-----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"收费-----%@",[NSThread currentThread]);
    });

    NSLog(@"-----end%@",[NSThread currentThread]);

    /**
     2018-02-01 17:26:19.292298+0800 03-GCD的基本使用[51389:1242650] -----begin
     2018-02-01 17:26:22.294146+0800 03-GCD的基本使用[51389:1242650] 用户登录-----<NSThread: 0x604000260000>{number = 1, name = main}
     2018-02-01 17:26:22.294555+0800 03-GCD的基本使用[51389:1242740] 下载-----<NSThread: 0x6040004624c0>{number = 4, name = (null)}
     2018-02-01 17:26:22.294560+0800 03-GCD的基本使用[51389:1242650] -----end<NSThread: 0x604000260000>{number = 1, name = main}
     2018-02-01 17:26:22.294599+0800 03-GCD的基本使用[51389:1242923] 收费-----<NSThread: 0x60400066bd40>{number = 5, name = (null)}
     */
    
      //结果显示，“用户登陆”在主线程打印，后两个在异步线程打印。上面的“用户登陆”使用同步执行，后面的扣费和下载都是异步执行。所以“用户登陆”必须第一个打印出来不管等多久，然后后面的两个异步和主线程打印会不确定顺序的打印。这就是日常开发中，那些后面对其有依赖的必须要先执行的任务使用同步执行，然后反正都要执行先后顺序无所谓的使用异步执行。
}

/**
 * block 异步任务包裹同步任务
 */
-(void)blockSync{
    
    dispatch_queue_t queue = dispatch_queue_create("cqe.ll", DISPATCH_QUEUE_CONCURRENT);
//    __block typeof(queue)weakq = queue;
    void (^task)(void) = ^ {
        // 1. 用户登录
        dispatch_sync(queue, ^{
            NSLog(@"用户登录----%@",[NSThread currentThread]);
        });
        // 2.扣费
        dispatch_async(queue, ^{
            NSLog(@"扣费----%@",[NSThread currentThread]);
        });
        
        // 3. 下载
        dispatch_async(queue, ^{
             NSLog(@"下载----%@",[NSThread currentThread]);
        });
        
    };
    
    dispatch_sync(queue, task);
    
    [NSThread sleepForTimeInterval:1.0];
    
    NSLog(@"-----end");
    
    /**
     2018-02-01 17:29:16.309404+0800 03-GCD的基本使用[51413:1244135] 用户登录----<NSThread: 0x604000262a40>{number = 1, name = main}
     2018-02-01 17:29:16.309830+0800 03-GCD的基本使用[51413:1244737] 下载----<NSThread: 0x604000663580>{number = 5, name = (null)}
     2018-02-01 17:29:16.309831+0800 03-GCD的基本使用[51413:1244342] 扣费----<NSThread: 0x6000006678c0>{number = 4, name = (null)}
     2018-02-01 17:29:17.310790+0800 03-GCD的基本使用[51413:1244135] -----end
     */
    
    // 因为整个block是在异步执行的，所以即使里面“用户登陆”是同步执行，那也无法在主线程中执行，只能开一条异步线程执行，因为是同步的所以必须等他先执行，后面的“扣费”和“下载”在上面同步执行结束之后，不确定顺序的打印。
    
}
#pragma mark -----xmg

/**
 * 异步函数+并发队列 可以同时开启多条线程
 */
-(void)asyncConcurrent{
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 获取全局队列
    dispatch_queue_t gloable = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(gloable, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"1-----%@", [NSThread currentThread]);
        }
        
    });
    
    dispatch_async(queue, ^{

        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"2-----%@", [NSThread currentThread]);
        }

    });
//
    dispatch_async(queue, ^{

        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"3-----%@", [NSThread currentThread]);
        }

    });
     NSLog(@"asyncConcurrent--------end");
}

/**
 * 同步函数+并发队列 不会开启新的线程
 */
-(void)syncConcurrent{
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
    NSLog(@"1-------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2-------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3-------%@",[NSThread currentThread]);
    });
    
}

/**
 * 异步函数+串行队列 会开启新的线程，但是任务是串行的，执行完一个，在执行另一个
 */
-(void)asyncSerial{
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        
      NSLog(@"1-------%@",[NSThread currentThread]);
        
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"2-------%@",[NSThread currentThread]);
        
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"3-------%@",[NSThread currentThread]);
        
    });
    
}

/**
 * 同步函数+串行队列 不会开启新的线程，在当前线程执行任务。任务是串行的，执行完一个任务后，在执行另一个任务
 */
-(void)syncSerial{
    
    //1 创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("cwq.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        
        NSLog(@"1-------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        
        NSLog(@"2-------%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        
        NSLog(@"3-------%@",[NSThread currentThread]);
    });
    
}

/**
 * 异步函数+主队列 不开启线程，只在主队列中执行任务
 */
-(void)asyncMain{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
       
         NSLog(@"1-----%@", [NSThread currentThread]);
        
    });
    dispatch_async(queue, ^{
        
        NSLog(@"2-----%@", [NSThread currentThread]);
        
    });
}

/**
 * 同步函数+主队列 会卡死，原因是循环等待，主队列的东西要等主线程执行完，而因为是同步执行不能开线程，所以下面的任务要等上面的执行完。
 */
-(void)syncMain{
    
    NSLog(@"syncMain-----begin");
    
    // 1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.将任务加入队列
    dispatch_sync(queue, ^{
       
        NSLog(@"1-----%@",[NSThread currentThread]);
        
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"2-----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        
        NSLog(@"3-----%@",[NSThread currentThread]);
    });
    
    NSLog(@"syncMain-------end");
}

@end
