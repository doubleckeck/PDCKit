//
//  UIButton+PDCAdd.m
//  PDCKit
//
//  Created by KH on 16/6/24.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIButton+PDCAdd.h"
#import <objc/runtime.h>

@implementation UIButton (PDCAdd)

-(void )setPdc_style:(PDCButtonStyle)pdc_style
{
    CGRect imageViewFrame = self.imageView.frame;
    CGRect titleLabelFrame = self.titleLabel.frame;
    switch (pdc_style)
    {
        case PDCButtonStyleRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(titleLabelFrame), 0,-CGRectGetWidth(titleLabelFrame));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(imageViewFrame), 0,CGRectGetWidth(imageViewFrame));
            break;
        case PDCButtonStyleTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(titleLabelFrame)*0.5, 0, -CGRectGetWidth(titleLabelFrame)*0.5);
            self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(imageViewFrame), -CGRectGetWidth(imageViewFrame) * 0.5, -CGRectGetHeight(titleLabelFrame)*0.5 - CGRectGetHeight(titleLabelFrame), CGRectGetWidth(imageViewFrame) * 0.5);
            break;
        case PDCButtonStyleBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetWidth(titleLabelFrame)*0.5, 0, -CGRectGetWidth(titleLabelFrame)*0.5);
            self.titleEdgeInsets = UIEdgeInsetsMake(-CGRectGetHeight(imageViewFrame) - CGRectGetHeight(titleLabelFrame), -CGRectGetWidth(imageViewFrame) * 0.5, CGRectGetHeight(titleLabelFrame)*0.5 , CGRectGetWidth(imageViewFrame) * 0.5);
            break;
        default:
            break;
    }
    objc_setAssociatedObject(self, _cmd, @(pdc_style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(PDCButtonStyle )pdc_style
{
    return [objc_getAssociatedObject(self, @selector(setPdc_style:)) integerValue];
}
@end
