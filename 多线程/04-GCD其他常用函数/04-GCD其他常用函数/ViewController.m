//
//  ViewController.m
//  04-GCD其他常用函数
//
//  Created by virgilChoi on 2018/2/2.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIImage *image1;
@property(nonatomic,strong) UIImage *image2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]init];
    self.imageView.backgroundColor = [UIColor orangeColor];
    self.imageView.frame = CGRectMake(100, 100, 200, 200);
    self.imageView.center = self.view.center;
    
    [self.view addSubview:self.imageView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self group];
}
-(void)group{
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.quue", DISPATCH_QUEUE_CONCURRENT);
    
    // 创建一个队列
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        
        // 图片的网络路径
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517558141400&di=0595cf8f943b571b4d6640327a3a03a4&imgtype=0&src=http%3A%2F%2Fimage.tianjimedia.com%2FuploadImages%2F2014%2F064%2F3U89BB790PE7.jpg"];
        
        // 加载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 生成图片
        self.image1 = [UIImage imageWithData:data];
    });
    
    dispatch_group_async(group, queue, ^{
        
        // 图片的网络路径
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517558123781&di=f914ecdfe7d44dc07763a2b62786a8ce&imgtype=0&src=http%3A%2F%2Fpic28.photophoto.cn%2F20130725%2F0036036348828174_b.jpg"];
        
        // 加载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 生成图片
        self.image2 = [UIImage imageWithData:data];
    });
    
    dispatch_group_notify(group, queue, ^{
       
        // 开启新的图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        
        // 绘制图片
        [self.image1 drawInRect:CGRectMake(0, 0, 100, 200)];
        [self.image2 drawInRect:CGRectMake(100, 0, 100, 200)];
        
        // 取得上下文中的图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 结束上下文
        UIGraphicsEndImageContext();
        
        // 回到主线程显示图片
        dispatch_async(dispatch_get_main_queue(), ^{
            // 4.将新图片显示出来
            self.imageView.image = image;
        });
        
    });
    
}
/**
 * 快速迭代
 */
-(void)apply{
    
   dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    NSString *from = @"/Users/Mac/Desktop/From";
    NSString *to = @"/Users/Mac/Desktop/To";
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSArray *subPaths = [mgr subpathsAtPath:from];
    
    dispatch_apply(subPaths.count, queue, ^(size_t index) {
        NSString *subPath = subPaths[index];
        NSString *fromPath = [from stringByAppendingPathComponent:subPath];
        NSString *toPath = [to stringByAppendingPathComponent:subPath];
        NSError *error;
        [mgr moveItemAtPath:fromPath toPath:toPath error:&error];
        NSLog(@"%@",error);
        
    });
}

/**
 * 传统文件剪贴
 * /Users/Mac/Desktop/from
 */
-(void)moveFile{
    
    NSString *from = @"/Users/Mac/Desktop/From1";
    NSString *to = @"/Users/Mac/Desktop/To";
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSArray *subpaths = [mgr subpathsAtPath:from];
    
    for (NSString *subpath in subpaths) {
        NSLog(@"%@",subpath);
        NSString *fromPath = [from stringByAppendingPathComponent:subpath];
        NSString *toPath = [to stringByAppendingPathComponent:subpath];
        NSLog(@"fromPath---%@",fromPath);
        NSLog(@"toPath---%@",toPath);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
            NSError *error;
            BOOL success = [mgr moveItemAtPath:fromPath toPath:toPath error:&error];
            NSLog(@"success--%d--%@",success,error);
            
        });
        
        
    }
}

/**
 * 延迟执行
 */
-(void)delay{

    NSLog(@"%s",__func__);
    
    [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
}
-(void)delay1{
    NSLog(@"1---%s",__func__);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"%s",__func__);
        
    });
    
}
-(void)delay2{
    NSLog(@"%s",__func__);
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:NO];
}
//-(void)run{
//
//    NSLog(@"%s",__func__);
//}
/**
 * 栅栏 阻挡
 */
-(void)barrier{
    
    
    dispatch_queue_t queue = dispatch_queue_create("cwq.quque", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"1------%@",[NSThread currentThread]);
    });
    
    
    
    dispatch_async(queue, ^{
        NSLog(@"2------%@",[NSThread currentThread]);
    });
    

    dispatch_async(queue, ^{
        NSLog(@"3------%@",[NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier-----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"4------%@",[NSThread currentThread]);
    });
    
    /**
     2018-02-02 10:53:01.122628+0800 04-GCD其他常用函数[53142:1627919] 1------<NSThread: 0x600000473e80>{number = 4, name = (null)}
     2018-02-02 10:53:01.122635+0800 04-GCD其他常用函数[53142:1627922] 3------<NSThread: 0x60000027f480>{number = 6, name = (null)}
     2018-02-02 10:53:01.122664+0800 04-GCD其他常用函数[53142:1627923] 2------<NSThread: 0x60000027ee80>{number = 5, name = (null)}
     2018-02-02 10:53:01.122984+0800 04-GCD其他常用函数[53142:1627919] barrier-----<NSThread: 0x600000473e80>{number = 4, name = (null)}
     2018-02-02 10:53:01.123208+0800 04-GCD其他常用函数[53142:1627919] 4------<NSThread: 0x600000473e80>{number = 4, name = (null)}
     */
    // 从结果可以分析到 barrier相当于一个栅栏，只有barrier线程之前的先通过了，才可以让后面的通过。
    
}
@end
