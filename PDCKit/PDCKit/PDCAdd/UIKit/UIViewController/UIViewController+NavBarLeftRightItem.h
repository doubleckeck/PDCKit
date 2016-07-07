//
//  UIViewController+NavBarLeftRightItem.h
//  PDCKit
//
//  Created by KH on 16/7/7.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callBack)();

@interface UIViewController (NavBarLeftRightItem)
/**
 *  设置标题颜色，默认黑色
 */
@property (strong, nonatomic) UIColor *pdc_titleColor;
/**
 *  设置标题字体大小
 */
@property (strong, nonatomic) UIFont *pdc_font;

/**
 *  导航栏最左按钮
 *
 *  @param image    image
 *  @param callback 回调
 */
-(void )leftBarItemImage:(UIImage *)image callback:(callBack )callback;
-(void )leftBarItemTitle:(NSString *)title callback:(callBack)callback;

/**
 *  导航栏最右按钮
 *
 *  @param image    image
 *  @param callback 回调
 */
-(void )rightBarItemImage:(UIImage *)image callback:(callBack )callback;
-(void )rightBarItemTitle:(NSString *)title callback:(callBack)callback;
@end
