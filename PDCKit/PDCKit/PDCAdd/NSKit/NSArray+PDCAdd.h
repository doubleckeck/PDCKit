//
//  NSArray+PDCAdd.h
//  PDCKit
//
//  Created by KH on 16/6/17.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^block_array)(NSInteger index,id obj);

@interface NSArray (PDCAdd)
/**
 *  异步队列遍历数组，遍历结果是无序的
 *
 *  @param block callback
 */
-(void )asynParallelEnumerateObjectsUsingBlock:(block_array )block;

/**
 *  同步队列遍历数组，遍历结果是有序的
 *
 *  @param block callback
 */
-(void )asynSerialEnumerateObjectsUsingBlock:(block_array )block;
@end
