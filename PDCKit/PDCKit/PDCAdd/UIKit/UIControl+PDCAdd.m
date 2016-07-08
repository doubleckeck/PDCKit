//
//  UIControl+PDCAdd.m
//  PDCKit
//
//  Created by KH on 16/6/17.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIControl+PDCAdd.h"
#import <objc/runtime.h>

@interface UIControl ()
@property (nonatomic, copy) action block;

@end

@implementation UIControl (PDCAdd)
-(void )setBlock:(action )block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(action )block
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void )actionWithBlock:(action )block
{
    [self actionWithControlEvents:UIControlEventTouchUpInside block:block];
}

-(void )actionWithControlEvents:(UIControlEvents )events block:(action )block
{
    self.block = block;
    [self addTarget:self action:@selector(pr_clickButton:) forControlEvents:events];
}

-(void )pr_clickButton:(UIControl *)sender
{
    if (self.block)
    {
        self.block(self);
    }
}
@end

