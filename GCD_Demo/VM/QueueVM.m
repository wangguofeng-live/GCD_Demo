//
//  QueueVM.m
//  GCD_Demo
//
//  Created by bdkj on 2018/1/4.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import "QueueVM.h"
#import <CoreFoundation/CoreFoundation.h>

@implementation QueueVM


- (NSString *)vmTitle {
    return @"队列(Queue)";
}

- (void)testVM {
    
//    [self dispatchQueue];
    
//    [self dispatchBarrierQueue];
    
    [self dispatchSpecific];
}

#pragma mark -
- (void)dispatchQueue {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue_t, ^{
        
        sleep(3);
        NSLog(@"Async Block ---%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue_t, ^{
        NSLog(@"Async2 Block ---%@",[NSThread currentThread]);
    });

    dispatch_apply(5, queue_t, ^(size_t size) {
        NSLog(@"Apply --%zd",size);
    });
    
//    dispatch_sync(queue_t, ^{
//        sleep(3);
//        NSLog(@"Sync Block ---%@",[NSThread currentThread]);
//    });
//
//    dispatch_sync(queue_t, ^{
//        NSLog(@"Sync2 Block ---%@",[NSThread currentThread]);
//    });
    
    
}

- (void)dispatchBarrierQueue {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue_t, ^{
        
        sleep(3);
        NSLog(@"Async Block ---%@",[NSThread currentThread]);
    });
    
//    dispatch_barrier_async(queue_t, ^{
//        NSLog(@"Async Barrier Block ---%@",[NSThread currentThread]);
//    });
    
    dispatch_barrier_sync(queue_t, ^{
        NSLog(@"Sync Barrier Block ---%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue_t, ^{
        NSLog(@"Async2 Block ---%@",[NSThread currentThread]);
    });
    
    dispatch_apply(5, queue_t, ^(size_t size) {
        NSLog(@"Apply --%zd",size);
    });
    
    
}

- (void)dispatchSpecific {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    
    static void *vmKey = "vmKey";
    dispatch_suspend(), dispatch_resume(), dispatch_set_context()
    dispatch_queue_set_specific(queue_t, vmKey, (__bridge void *)self, NULL);
    
    dispatch_async(queue_t, ^{
        NSLog(@"Async2 Block ---%@",[NSThread currentThread]);
        
        QueueVM *value = (__bridge QueueVM *)dispatch_queue_get_specific(queue_t, vmKey);
        QueueVM *value1 = (__bridge QueueVM *)dispatch_get_specific(vmKey);
        
        NSLog(@"value %@",value);
        NSLog(@"value1 %@",value1);
    });
    
}

@end
