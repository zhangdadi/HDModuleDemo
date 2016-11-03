//
//  HUDCenter.h
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-6-26.
//  Copyright (c) 2014年 yh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^HDHUDCompletionBlock)();

/**
 *  提示框显示
 */
@interface HDHUDCenter : NSObject

/**
 *  权限提示时使用
 *
 *  @param text  要显示的内容
 *  @param delay 延时消失时间
 */
+ (void)showPermissionsText:(NSString *)text delay:(NSTimeInterval)delay;


/**
 *  网络请求时使用
 *
 *  @param text 内容
 */
+ (void)showLoadText:(NSString *)text;

/**
 *  网络请求时使用
 *
 *  @param text  显示的内容
 *  @param delay 延时消失时间
 */
+ (void)showLoadText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 *  网络错误提示时使用
 *
 *  @param text 内容
 */
+ (void)showErrorText:(NSString *)text;

/**
 *  网络错误提示时使用
 *
 *  @param text  显示的内容
 *  @param delay 延时消失时间
 */
+ (void)showErrorText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 *  网络错误提示时使用
 *
 *  @param text  显示的内容
 *  @param delay 延时消失时间
 *  @param completionBlock 提示框消失时回调
 */
+ (void)showErrorText:(NSString *)text delay:(NSTimeInterval)delay completionBlock:(HDHUDCompletionBlock)completionBlock;

/**
 *  网络请求成功时使用
 *
 *  @param text  显示的内容
 */
+ (void)showSucceedText:(NSString *)text;

/**
 *  网络请求成功时使用
 *
 *  @param text  显示的内容
 *  @param delay 延时消失时间
 */
+ (void)showSucceedText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 *  网络请求成功时使用
 *
 *  @param text  显示的内容
 *  @param delay 延时消失时间
 *  @param completionBlock 提示框消失时回调
 */
+ (void)showSucceedText:(NSString *)text delay:(NSTimeInterval)delay completionBlock:(HDHUDCompletionBlock)completionBlock;

/**
 *  隐藏hud
 */
+ (void)hide;

/**
 *  延时隐藏hud
 *
 *  @param delay 延时时间
 */
+ (void)hideWithDelay:(NSTimeInterval)delay;

/**
 *  获取提示框隐藏状态
 *
 *  @return YES为已消失,NO为正在显示
 */
+ (BOOL)getHide;

@end
