//
//  UILabel+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HDCore)

/**
 *  根据内容调整宽度
 */
-(void)HDResizeToStretch;

/**
 *  根据内容调整高度
 */
- (void)HDResizeToHeight;


/**
 *  计算高度
 *
 *  @param text          内容
 *  @param font          字体
 *  @param size          大小
 *  @param lineBreakMode 类型
 *
 *  @return <#return value description#>
 */
+ (CGSize)HDCalculateHeightWithText:(NSString *)text
                             font:(UIFont *)font
                             size:(CGSize)size
                    lineBreakMode:(NSLineBreakMode)lineBreakMode;

/**
 *  设置UILabel的内容不同颜色
 *
 *  @param color 颜色值
 *  @param range 范围
 */
- (void)HDColorTextWithColor:(UIColor *)color range:(NSRange)range;

@end
