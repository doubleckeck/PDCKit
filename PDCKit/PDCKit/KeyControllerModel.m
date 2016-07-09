//
//  KeyControllerModel.m
//  PDCKit
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "KeyControllerModel.h"

@implementation KeyControllerModel
+(NSArray <NSDictionary *>*)keyControllerModels
{
    NSMutableArray <NSDictionary *>*arr = [NSMutableArray<NSDictionary *> array];
    
    [arr addObject:@{@"name":@"button demo",@"controller":@"ButtonDemoController"}];
    [arr addObject:@{@"name":@"NStimer demo",@"controller":@"NSTimerDemoController"}];
    [arr addObject:@{@"name":@"NSAttributedString demo",@"controller":@"NSAttributedStringController"}];
    [arr addObject:@{@"name":@"string md5 sha1、sha2 demo",@"controller":@"StringDemoController"}];
    [arr addObject:@{@"name":@"PDCWaitGroup demo",@"controller":@"WaitGroupDemoController"}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
//    [arr addObject:@{@"name":@"",@"controller":@""}];
    
    return [arr copy];
}
@end
