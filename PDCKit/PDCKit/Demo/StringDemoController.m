//
//  StringDemoController.m
//  PDCKit
//
//  Created by KH on 16/7/8.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "StringDemoController.h"
#import "NSString+PDCAdd.h"

@implementation StringDemoController
-(void )viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"123456789";
    NSLog(@"%@",[str md5]);
    NSLog(@"%@",[str SHA1]);
    NSLog(@"%@",[str SHA224]);
    NSLog(@"%@",[str SHA256]);
    NSLog(@"%@",[str SHA384]);
    NSLog(@"%@",[str SHA512]);
    NSLog(@"\n");
    NSLog(@"%@",[str HmacMd5WithKey:@"123"]);
    NSLog(@"%@",[str HmacSHA1WithKey:@"123"]);
    NSLog(@"%@",[str HmacSHA224WithKey:@"123"]);
    NSLog(@"%@",[str HmacSHA256WithKey:@"123"]);
    NSLog(@"%@",[str HmacSHA384WithKey:@"123"]);
    NSLog(@"%@",[str HmacSHA512WithKey:@"123"]);
}

@end
