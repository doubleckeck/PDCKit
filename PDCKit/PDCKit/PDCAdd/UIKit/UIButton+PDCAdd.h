//
//  UIButton+PDCAdd.h
//  PDCKit
//
//  Created by KH on 16/6/24.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, PDCButtonStyle){
    PDCButtonStyleDefault,
    PDCButtonStyleRight,
    PDCButtonStyleTop,
    PDCButtonStyleBottom
};

@interface UIButton (PDCAdd)
@property (nonatomic, assign) PDCButtonStyle pdc_style;
@end
