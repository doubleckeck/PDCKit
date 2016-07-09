//
//  WaitGroupDemoController.m
//  PDCKit
//
//  Created by KH on 16/7/10.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "WaitGroupDemoController.h"
#import "PDCWaitGroup.h"

@interface WaitGroupDemoController ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *doneLabel;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) PDCWaitGroup *waitGroup;
@end

@implementation WaitGroupDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //view
    {
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
        self.doneLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.doneLabel.textAlignment = NSTextAlignmentCenter;
        
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(50, 200, 200, 30);
        [self.btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.btn setTitle:@"点我" forState:UIControlStateNormal];
        
        [self.view addSubview:self.label];
        [self.view addSubview:self.doneLabel];
        [self.view addSubview:self.btn];
    }
    
    //wait group
    self.waitGroup = [[PDCWaitGroup alloc] initWithWait:5];
    
    [self.waitGroup waitting:^(NSInteger waitCount) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text = [NSString stringWithFormat:@"还剩余几次：%@",@(waitCount)];
            self.doneLabel.text = @"未完成";
        });
    }];
    
    [self.waitGroup finish:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text = [NSString stringWithFormat:@"还剩余几次：%@",@(self.waitGroup.waitCount)];
            self.doneLabel.text = @"完成";
        });
    }];
}

- (void )click:(id)sender
{
    [self.waitGroup reduceCount];
}

@end
