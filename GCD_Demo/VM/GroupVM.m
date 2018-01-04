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
    
//    [self dispatchWork];
    
//    [self groupSync2];
    
    [self dispatchNewwork];
}

#pragma mark -
-(void)dispatchWork {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group_t = dispatch_group_create();
    
    dispatch_group_async(group_t, queue_t, ^{
        sleep(2);
        NSLog(@"任务1完成");
    });
    
    dispatch_group_async(group_t, queue_t, ^{
        sleep(3);
        NSLog(@"任务2完成");
        
    });
    
    dispatch_group_async(group_t, queue_t, ^{
        NSLog(@"任务3完成");
    });
    
    //任务完成方式一
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_group_wait(group_t, DISPATCH_TIME_FOREVER);
        NSLog(@"任务完成通知 Wait");
    });
    
    //任务完成方式二
    dispatch_group_notify(group_t, dispatch_get_main_queue(), ^{
        NSLog(@"任务完成通知 Notify");
    });
    
}

- (void)groupSync2
{

    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue_global_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group_t = dispatch_group_create();
    
    dispatch_group_async(group_t, queue_t, ^{
        sleep(2);
        NSLog(@"任务1完成");
    });
    
    dispatch_group_async(group_t, queue_t, ^{
        sleep(3);
        NSLog(@"任务2完成");
    });

    //任务3 在系统的线程中执行
    dispatch_group_async(group_t, queue_global_t, ^{
        sleep(5);
        NSLog(@"任务3完成");
    });
    
    dispatch_group_notify(group_t, dispatch_get_main_queue(), ^(){
        NSLog(@"任务完成通知");
    });
}

#pragma mark  -

-(void)dispatchNewwork {
    dispatch_queue_t queue_t = dispatch_queue_create("gcd_demo_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group_t = dispatch_group_create();
    
    dispatch_group_enter(group_t);
    dispatch_async(queue_t, ^{
        sleep(5);
        NSLog(@"网络任务1完成");
        dispatch_group_leave(group_t);
    });
    
    dispatch_group_enter(group_t);
    dispatch_async(queue_t, ^{
        sleep(3);
        NSLog(@"网络任务2完成");
        dispatch_group_leave(group_t);
    });
    
    dispatch_group_enter(group_t);
    dispatch_async(queue_t, ^{
        sleep(4);
        NSLog(@"网络任务3完成");
        dispatch_group_leave(group_t);
    });
    
    dispatch_group_notify(group_t, dispatch_get_main_queue(), ^{
        NSLog(@"任务完成通知");
    });
    
}

@end
