//
//  UIViewController+NavBarLeftRightItem.m
//  PDCKit
//
//  Created by KH on 16/7/7.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIViewController+NavBarLeftRightItem.h"
#import <objc/runtime.h>

@interface UIViewController()
@property (nonatomic, copy) callBack callLeft;
@property (nonatomic, copy) callBack callRight;
@end

@implementation UIViewController (NavBarLeftRightItem)
#pragma settter getter
-(void )setPdc_titleColor:(UIColor *)pdc_titleColor
{
    objc_setAssociatedObject(self, @selector(pdc_titleColor), pdc_titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)pdc_titleColor
{
    UIColor *color = objc_getAssociatedObject(self, _cmd);
    if (color == nil)
    {
        color = [UIColor blackColor];
    }
    return color;
}

-(void )setPdc_font:(UIFont *)pdc_font
{
    objc_setAssociatedObject(self, @selector(pdc_font), pdc_font, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)pdc_font
{
    UIFont *font = objc_getAssociatedObject(self, _cmd);
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:13];
    }
    return font;
}

-(void )setCallLeft:(callBack)callLeft
{
    objc_setAssociatedObject(self, @selector(callLeft), callLeft, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (callBack )callLeft
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void )setCallRight:(callBack)callRight
{
    objc_setAssociatedObject(self, @selector(callRight), callRight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (callBack )callRight
{
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark method
-(void )leftBarItemImage:(UIImage *)image callback:(callBack )callback
{
    UIButton *btn = [self pr_setTitleOrImage:image callback:callback left:YES];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void )leftBarItemTitle:(NSString *)title callback:(callBack)callback
{
    UIButton *btn = [self pr_setTitleOrImage:title callback:callback left:YES];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void )rightBarItemImage:(UIImage *)image callback:(callBack )callback
{
    UIButton *btn = [self pr_setTitleOrImage:image callback:callback left:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void )rightBarItemTitle:(NSString *)title callback:(callBack)callback
{
    UIButton *btn = [self pr_setTitleOrImage:title callback:callback left:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  返回一个button
 *
 *  @param param    title或者image
 *  @param callback 回调
 *  @param left     是否是左边
 *
 *  @return button
 */
-(UIButton *)pr_setTitleOrImage:(id )param callback:(callBack)callback left:(BOOL )left
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:self.pdc_titleColor forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = self.pdc_font;
    
    if ([param isKindOfClass:[NSString class]])
    {
        NSString *title = param;
        [btn setTitle:title forState:UIControlStateNormal];
        CGRect rect = [btn.titleLabel textRectForBounds:CGRectMake(0, 0, 999, 30) limitedToNumberOfLines:1];
        btn.frame = rect;
    }
    else if([param isKindOfClass:[UIImage class]])
    {
        UIImage *image = param;
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    }
    
    if (left)
    {
        [btn addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
        self.callLeft = callback;
    }
    else
    {
        [btn addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
        self.callRight = callback;
    }
    return btn;
}


#pragma mark - action

-(void )left:(id )sender
{
    if (self.callLeft)
    {
        self.callLeft();
    }
}

-(void )right:(id )sender
{
    if (self.callRight)
    {
        self.callRight();
    }
}

@end
