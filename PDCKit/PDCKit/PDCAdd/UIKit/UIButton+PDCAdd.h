//
//  UIButton+PDCAdd.h
//  Button_demo
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonClick)(UIButton *button);

@interface UIButton (PDCAdd)
/**
 *  Events is TouchUpInside
 *
 *  @param block action
 */
-(void )actionWithBlock:(buttonClick )block;
@end
