//
//  SemaphoreVM.m
//  GCD_Demo
//
//  Created by bdkj on 2018/1/2.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import "SemaphoreVM.h"

@implementation SemaphoreVM

- (NSString *)vmTitle {
    return @"信号量(Semaphore)";
}

- (void)testVM {
    
//    dispatch_semaphore_t semaphore_t = dispatch_semaphore_create(1);
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"123");
//        NSLog(@"信号量- %zd", dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER));
//        NSLog(@"任务1开始");
//        sleep(5);
//        NSLog(@"任务1完成");
//        dispatch_semaphore_signal(semaphore_t);
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"123");
//        NSLog(@"信号量- %zd", dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER));
//        NSLog(@"任务2开始");
//        sleep(3);
//        NSLog(@"任务2完成");
//        dispatch_semaphore_signal(semaphore_t);
//    });
//
//
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"123");
//        NSLog(@"信号量- %zd", dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER));
//        NSLog(@"任务3开始");
//        sleep(1);
//        NSLog(@"任务3完成");
//        dispatch_semaphore_signal(semaphore_t);
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"信号量- %zd", dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER));
//        NSLog(@"任务ALL完成---- %@", [NSThread currentThread]);
//        dispatch_semaphore_signal(semaphore_t);
//    });
//
    [self dispatchSignal];
}

-(void)dispatchSignal{
    //crate的value表示，最多几个资源可访问
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //任务1
    dispatch_async(quene, ^{
        NSLog(@"A");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 1");
        sleep(1);
        NSLog(@"complete task 1");
        dispatch_semaphore_signal(semaphore);
    });
    //任务2
    dispatch_async(quene, ^{
        NSLog(@"A");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 2");
        sleep(1);
        NSLog(@"complete task 2");
        dispatch_semaphore_signal(semaphore);
    });
    //任务3
    dispatch_async(quene, ^{
        NSLog(@"A");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 3");
        sleep(1);
        NSLog(@"complete task 3");
        dispatch_semaphore_signal(semaphore);
    });
}

@end
