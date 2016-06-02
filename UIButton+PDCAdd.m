//
//  UIButton+PDCAdd.m
//  Button_demo
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIButton+PDCAdd.h"
#import <objc/runtime.h>

static const char *blk = "blk_adress";

@interface UIButton ()
@property (nonatomic, copy) buttonClick block;

@end

@implementation UIButton (PDCAdd)
-(void )setBlock:(buttonClick )block
{
    objc_setAssociatedObject(self, blk, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(buttonClick )block
{
    return objc_getAssociatedObject(self, blk);
}

-(void )actionWithBlock:(buttonClick )block
{
    self.block = block;
    [self addTarget:self action:@selector(pr_clickButton:) forControlEvents:UIControlEventTouchUpInside];
}

-(void )pr_clickButton:(UIButton *)sender
{
    if (self.block)
    {
        self.block(self);
    }
}
@end
