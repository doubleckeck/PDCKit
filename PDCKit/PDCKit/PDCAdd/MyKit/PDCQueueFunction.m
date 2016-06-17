//
//  PDCQueueFuntion.m
//  PDCQueue
//
//  Created by KH on 16/6/3.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "PDCQueueFunction.h"

dispatch_queue_t queue_serial_funtion = NULL;   //创建串行队列

void gcd_safeQueue1(dispatch_queue_t queue,pdc_block set,pdc_block get)
{
    dispatch_async(queue, ^{
        set();
    });
    
    /* 等待queue里面的block执行才会执行这里 */
    dispatch_barrier_async(queue, ^{
        get();
    });
}


void gcd_safeQueue2(dispatch_queue_t queue,dispatch_semaphore_t semaphore,pdc_block set,pdc_block get)
{
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);  //等待下次信号
    dispatch_async(queue, ^{
        set();
        dispatch_semaphore_signal(semaphore);   //发送信号，取消等待
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);   //等待下次信号
    dispatch_async(queue, ^{
        get();
        dispatch_semaphore_signal(semaphore);   //发送信号，取消等待
    });
}

void gcd_asynSerialQueueBlocks(pdc_block block1, pdc_block block2)
{
    if (!queue_serial_funtion)
    {
        @autoreleasepool {
            queue_serial_funtion = dispatch_queue_create("doublecheck.pdc.serial.queue", DISPATCH_QUEUE_SERIAL);
        }
    }
    
    /* 串行队列按顺序执行 */
    dispatch_async(queue_serial_funtion, ^{
        block1();
    });
    
    dispatch_async(queue_serial_funtion, ^{
        block2();
    });
}


void gcd_asynSerialQueue(NSTimeInterval block_next_time, pdc_block_bool block)
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        //异步线程需要手动添加port跟设置mode
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        BOOL finish = NO;
        while (!finish)
        {
            @autoreleasepool {
                block(&finish);
                [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:block_next_time]];
            }
        }
    });
}