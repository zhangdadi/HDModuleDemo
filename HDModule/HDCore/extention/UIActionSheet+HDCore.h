//
//  UIActionSheet+HDCore.h
//  HDCore
//
//  Created by 张达棣 on 16/7/11.
//  Copyright © 2016年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIActionSheet按钮点击时回调block
 *
 *  @param buttonIndex 按钮索引
 */
typedef void(^HDActionSheetBlock)(NSInteger buttonIndex);


@interface UIActionSheet (HDCore)

+ (instancetype)HDCreatWithTitle:(NSString *)title
                      clickBlock:(HDActionSheetBlock)clickBlock
               cancelButtonTitle:(NSString *)cancelButtonTitle
          destructiveButtonTitle:(NSString *)destructiveButtonTitle
               otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
