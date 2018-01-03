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
    [self dispatchSignal];
}

-(void)dispatchSignal{
    //value 有几个车道
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //任务1
    dispatch_async(quene, ^{
//        NSLog(@"车1 发动");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"车1 开始通过");
        sleep(2);
        NSLog(@"车1 已通过");
        dispatch_semaphore_signal(semaphore);
    });
    //任务2
    dispatch_async(quene, ^{
//        NSLog(@"车2 发动");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"车2 开始通过");
        sleep(3);
        NSLog(@"车2 已通过");
        dispatch_semaphore_signal(semaphore);
    });
    //任务3
    dispatch_async(quene, ^{
//        NSLog(@"车3 发动");
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"车3 开始通过");
        sleep(1);
        NSLog(@"车3 已通过");
        dispatch_semaphore_signal(semaphore);
    });

}

@end
