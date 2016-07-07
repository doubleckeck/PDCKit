//
//  UIViewController+Alert.h
//  AlertActionSheet
//
//  Created by KH on 16/7/7.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^click)(NSInteger index);
typedef void(^configuration)(UITextField *field, NSInteger index);
typedef void(^clickHaveField)(NSArray<UITextField *> *fields, NSInteger index);

/** ios8以上，未完善 */
@interface UIViewController (Alert)
/**
 *  use alert
 *
 *  @param title    title
 *  @param message  message
 *  @param others   other button title
 *  @param animated animated
 *  @param click    button action
 */
-(void)PDCAlertWithTitle:(NSString *)title
                 message:(NSString *)message
               andOthers:(NSArray <NSString *> *)others
                animated:(BOOL )animated
                  action:(click )click NS_AVAILABLE_IOS(8_0);


/**
 *  use action sheet
 *
 *  @param title             title
 *  @param message           message just system verson max or equal 8.0.
 *  @param destructive       button title is red color
 *  @param destructiveAction destructive action
 *  @param others            other button
 *  @param animated          animated
 *  @param click             other button action
 */
-(void)PDCActionSheetWithTitle:(NSString *)title
                       message:(NSString *)message
                   destructive:(NSString *)destructive
             destructiveAction:(click )destructiveAction
                     andOthers:(NSArray <NSString *> *)others
                      animated:(BOOL )animated
                        action:(click )click NS_AVAILABLE_IOS(8_0);


/**
 *  use alert include textField
 *
 *  @param title         title
 *  @param message       message
 *  @param buttons       buttons
 *  @param number        number of textField
 *  @param configuration configuration textField property
 *  @param animated      animated
 *  @param click         button action
 */
-(void)PDCAlertWithTitle:(NSString *)title
                 message:(NSString *)message
                 buttons:(NSArray<NSString *> *)buttons
         textFieldNumber:(NSInteger )number
           configuration:(configuration )configuration
                animated:(BOOL )animated
                  action:(clickHaveField )click NS_AVAILABLE_IOS(8_0);
@end
