// 总结 NSOperation
/**
 NSOperation的属性：
 1. suspended 挂起，暂停属性。暂停当前线程之后的其他子线程的问题。如果当前线程正在处理耗时操作的话，不会立即处理，需要等到当前线程的事情处理完成后。才会，暂停。
 2. maxConcurrentOperationCount 控制可以开启的线程数量。默认为-1 ，当为1时，相当于是串行队列。
 3.addDependency 依赖。 A个线程依赖于B线程。
 4. if (self.isCancelled) return 当如果自定义自己的线程是。在处理一个比较耗时的操作后，尽量进行一次isCancelled的判断。苹果官方建议。
 
 二 : 创建NSOperation线程的几种方法。
 1.  NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(run:) object:@"jack"];
 [op start];
 
 2.NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
 NSLog(@"download1-------%@",[NSThread currentThread]);
 }];
 
 3. 继承NSOperaton 创建的线程
 
 */
