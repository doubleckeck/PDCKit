//
//  NSTimerDemoController.m
//  PDCKit
//
//  Created by KH on 16/7/8.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSTimerDemoController.h"
#import "NSTimer+PDCAdd.h"

@implementation NSTimerDemoController
-(void )viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 80,  300, 30)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 300, 30)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 300, 30)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    
    __block NSInteger i1 = 0;
    __block NSInteger i2 = 0;
    __block NSInteger i3 = 0;
    __block NSInteger i4 = 0;
    
    //sleep 定时器
    [NSTimer sleep_scheduledTimerWithTimerInterval:1 repeat:YES action:^(BOOL *stop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            i1++;
            label1.text = [NSString stringWithFormat:@"sleep 定时器：%@",@(i1)];
        });
    }];
    
    //runloop定时器
    [NSTimer runloop_scheduledTimerWithTimerInterval:2 repeat:YES action:^(BOOL *stop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            i2++;
            label2.text = [NSString stringWithFormat:@"runloop 定时器：%@",@(i2)];
        });
    }];

    //gcd定时器，只能有一个
    [NSTimer gcd_scheduledTimerWithTimerInterval:3 repeat:YES action:^(BOOL *stop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            i3++;
            label3.text = [NSString stringWithFormat:@"gcd 定时器1：%@",@(i3)];
        });
    }];

    //gcd定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    [NSTimer gcd_scheduledTimerWithSource:timer timerInterval:4.0 repeat:YES action:^(BOOL *stop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            i4++;
            label4.text = [NSString stringWithFormat:@"gcd 定时器2：%@",@(i4)];
        });
    } end:^(dispatch_source_t source) {
        
    }];
}

@end
