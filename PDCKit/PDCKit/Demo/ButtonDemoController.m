//
//  ButtonDemoController.m
//  PDCKit
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ButtonDemoController.h"
#import "UIControl+PDCAdd.h"

@implementation ButtonDemoController
{
    UIButton *_button1;
}

-(void )viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void )viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_button1 == nil)
    {
        _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button1 setTitle:@"click me" forState:UIControlStateNormal];
        _button1.frame = CGRectMake(50, 100, 80, 40);
        
        [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button1.backgroundColor = [UIColor colorWithRed:0.3 green:0.5 blue:0.7 alpha:1.0];
        
        [self.view addSubview:_button1];
    }
    
    [_button1 actionWithBlock:^(UIControl *sender) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"tip" message:@"click me button" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

@end
