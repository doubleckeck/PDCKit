//
//  NSAttributedStringController.m
//  PDCKit
//
//  Created by KH on 16/7/8.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSAttributedStringController.h"
#import "NSAttributedString+PDCAdd.h"

@implementation NSAttributedStringController
-(void )viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 80,  300, 30)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 300, 30)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 300, 30)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 240, 300, 30)];
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 300, 30)];
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 300, 30)];
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 300, 30)];
    UILabel *label9 = [[UILabel alloc] initWithFrame:CGRectMake(20, 400, 300, 30)];
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:label6];
    [self.view addSubview:label7];
    [self.view addSubview:label8];
    [self.view addSubview:label9];
    
    {
        label1.attributedText = [NSAttributedString linkString:@"这个是带部分下划线的label" range:NSMakeRange(3,6)];
        
        NSMutableAttributedString *aStr2 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体会变大"];
        aStr2.font = [UIFont systemFontOfSize:21.0];
        label2.attributedText = [aStr2 copy];
        
        NSMutableAttributedString *aStr3 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体会变变粗"];
        aStr3.strokeWidth = @(3);
        label3.attributedText = [aStr3 copy];
        
        NSMutableAttributedString *aStr4 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体间距会变大"];
        aStr4.kern = @(8);
        label4.attributedText = [aStr4 copy];
        
        NSMutableAttributedString *aStr5 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体颜色是红色的"];
        aStr5.color = [UIColor redColor];
        label5.attributedText = [aStr5 copy];
        
        NSMutableAttributedString *aStr6 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体带删除线"];
        aStr6.strikethroughStyle = NSUnderlineStyleThick;
        label6.attributedText = [aStr6 copy];
        
        NSMutableAttributedString *aStr7 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体带不同下划线"];
        aStr7.underlineStyle = NSUnderlineStyleDouble;
        label7.attributedText = [aStr7 copy];
        
        NSMutableAttributedString *aStr8 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体带阴影"];
        NSShadow *shadow = [NSShadow new];
        shadow.shadowColor = [UIColor greenColor];
        shadow.shadowBlurRadius = 2.0;
        aStr8.shadow = shadow;
        label8.attributedText = [aStr8 copy];
        
        NSMutableAttributedString *aStr9 = [[NSMutableAttributedString alloc] initWithString:@"这个label字体会变胖"];
        aStr9.expansion = @(0.5);
        label9.attributedText = [aStr9 copy];
    }
}
@end
