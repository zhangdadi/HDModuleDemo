//
//  UIImage+HDAdditions.h
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-7-22.
//  Copyright (c) 2014年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HDCore)

/**
 *  有损缩放图片
 *
 *  @param size 缩放后的大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)HDScaleToSize:(CGSize)size;

/**
 *  通过颜色值创建图片
 *
 *  @param color 颜色值
 *
 *  @return 图片
 */
+ (UIImage*)HDImageWithColor:(UIColor*)color;

/**
 *  把图片转成data
 *
 *  @return 图片的data数据
 */
- (NSData *)HDDataTurn;

@end
