//
//  UIControl+PDCAdd.h
//  PDCKit
//
//  Created by KH on 16/6/17.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^action)(UIControl *sender);

@interface UIControl (PDCAdd)
/**
 *  Events is TouchUpInside
 *
 *  @param block action
 */
-(void )actionWithBlock:(action )block;

/**
 *  custom UIControl
 *
 *  @param events UIControlEvents
 *  @param block  action
 */
-(void )actionWithControlEvents:(UIControlEvents )events block:(action )block;
@end
