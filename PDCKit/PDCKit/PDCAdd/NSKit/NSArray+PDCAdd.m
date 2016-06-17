//
//  NSArray+PDCAdd.m
//  PDCKit
//
//  Created by KH on 16/6/17.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSArray+PDCAdd.h"

@implementation NSArray (PDCAdd)
-(void )asynParallelEnumerateObjectsUsingBlock:(block_array )block
{
    [self pr_enumerateObjectsUsingQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:block];
}

-(void )asynSerialEnumerateObjectsUsingBlock:(block_array )block
{
    [self pr_enumerateObjectsUsingQueue:dispatch_queue_create("pdc.array.enumerate", DISPATCH_QUEUE_SERIAL) block:block];
}

-(void )pr_enumerateObjectsUsingQueue:(dispatch_queue_t )queue block:(block_array )block
{
    dispatch_apply(self.count, queue, ^(size_t index) {
        block(index,self[index]);
    });
}
@end
