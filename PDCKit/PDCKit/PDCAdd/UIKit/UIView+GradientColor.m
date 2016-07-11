//
//  UIView+GradientColor.m
//  渐变色
//
//  Created by KH on 16/7/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIView+GradientColor.h"
#import <objc/runtime.h>

@implementation UIView (GradientColor)
-(void )setDefaultColor:(UIColor *)defaultColor
{
    objc_setAssociatedObject(self, @selector(defaultColor), defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)defaultColor
{
    UIColor *color = objc_getAssociatedObject(self, _cmd);
    return color?:[UIColor whiteColor];
}

-(void )setGradientType:(GradientColorEnumType )gradientType
{
    objc_setAssociatedObject(self, @selector(gradientType), @(gradientType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(GradientColorEnumType )gradientType
{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void )setGradientColor:(UIColor *)gradientColor
{
    objc_setAssociatedObject(self, @selector(gradientColor), gradientColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        CGPoint start;
        CGPoint end;
        NSMutableArray *colors = [NSMutableArray array];
        switch (self.gradientType)
        {
            case TopToDown:
                start = CGPointMake(0, 0);
                end = CGPointMake(0, 1);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case DownToTop:
                start = CGPointMake(0, 1);
                end = CGPointMake(0, 0);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case LeftToRight:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 0);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case RightToLeft:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 0);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case TopLeftToDownRight:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 1);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case TopRightToDownLeft:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 1);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case DownRightToTopLeft:
                start = CGPointMake(0, 1);
                end = CGPointMake(1, 0);
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                break;
            case DownLeftToTopRight:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 1);
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                break;
            case CenterToLeftRight:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 0);
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case CenterToTopDown:
                start = CGPointMake(0, 1);
                end = CGPointMake(0, 0);
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                break;
            case LeftRightToCenter:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 0);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                break;
            case TopDownToCenter:
                start = CGPointMake(0, 0);
                end = CGPointMake(0, 1);
                [colors addObject:(id)gradientColor.CGColor];
                [colors addObject:(id)self.defaultColor.CGColor];
                [colors addObject:(id)gradientColor.CGColor];
                break;
            default:
                break;
        }
        gradientLayer.colors = [colors copy];
        gradientLayer.startPoint = start;
        gradientLayer.endPoint = end;
        [self.layer addSublayer:gradientLayer];
    });
}

-(UIColor *)gradientColor
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void )setCustomGradientColors:(NSArray<UIColor *> *)customGradientColors
{
    objc_setAssociatedObject(self, @selector(customGradientColors), customGradientColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        CGPoint start;
        CGPoint end;
        NSMutableArray *colors = [NSMutableArray array];
        [customGradientColors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [colors addObject:(id)obj.CGColor];
        }];
        switch (self.gradientType)
        {
            case TopToDown:
                start = CGPointMake(0, 0);
                end = CGPointMake(0, 1);
                break;
            case DownToTop:
                start = CGPointMake(0, 1);
                end = CGPointMake(0, 0);
                break;
            case LeftToRight:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 0);
                break;
            case RightToLeft:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 0);
                break;
            case TopLeftToDownRight:
                start = CGPointMake(0, 0);
                end = CGPointMake(1, 1);
                break;
            case TopRightToDownLeft:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 1);
                break;
            case DownRightToTopLeft:
                start = CGPointMake(0, 1);
                end = CGPointMake(1, 0);
                break;
            case DownLeftToTopRight:
                start = CGPointMake(1, 0);
                end = CGPointMake(0, 1);
                break;
            default:
                start = CGPointMake(0, 0);
                end = CGPointMake(0, 1);
                break;
        }
        gradientLayer.colors = [colors copy];
        gradientLayer.startPoint = start;
        gradientLayer.endPoint = end;
        [self.layer addSublayer:gradientLayer];
    });
}

-(NSArray<UIColor *> *)customGradientColors
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
