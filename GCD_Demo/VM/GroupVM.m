//
//  GroupVM.m
//  GCD_Demo
//
//  Created by bdkj on 2018/1/3.
//  Copyright © 2018年 bdkj_wangguofeng. All rights reserved.
//

#import "GroupVM.h"

@implementation GroupVM


- (NSString *)vmTitle {
    return @"任务组(Group)";
}

- (void)testVM {
    [self dispatchGroup];
}

-(void)dispatchGroup {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group_t = dispatch_group_create();
    
    dispatch_group_enter(group_t);
    dispatch_group_async(group_t, queue_t, ^{
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(5);
            
            NSLog(@"网络任务1完----%@", [NSThread currentThread]);
            dispatch_group_leave(group_t);
        });
        sleep(2);
        NSLog(@"任务1完成---%@", [NSThread currentThread]);
    });
    
//    dispatch_group_wait(group_t, DISPATCH_TIME_FOREVER);
    dispatch_group_enter(group_t);
    dispatch_group_async(group_t, queue_t, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(5);
            
            NSLog(@"网络任务2完成----%@", [NSThread currentThread]);
            dispatch_group_leave(group_t);
        });
        sleep(2);
        NSLog(@"任务2完成---%@", [NSThread currentThread]);
        
    });
    
//     (group_t, DISPATCH_TIME_FOREVER);
    dispatch_group_enter(group_t);
    dispatch_group_async(group_t, queue_t, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(5);
            
            NSLog(@"网络任务3完成 --- %@", [NSThread currentThread]);
            dispatch_group_leave(group_t);
        });
        sleep(2);
        NSLog(@"任务3完成---- %@", [NSThread currentThread]);
    });
    
    
    
    dispatch_group_notify(group_t, dispatch_get_main_queue(), ^{
        NSLog(@"任务完成通知");
    });
    
}

@end
