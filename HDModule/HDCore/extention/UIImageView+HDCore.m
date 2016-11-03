//
//  UIImageView+HDCore.m
//  HDCore
//
//  Created by 张达棣 on 16/7/7.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "UIImageView+HDCore.h"

@implementation UIImageView (HDCore)

/**
 *  通过UIImage初始化UIImageView
 *
 *  @param image UIImage
 *
 */
+ (instancetype)HDImageViewWithImage:(UIImage *)image {
    return [[self alloc] initWithImage:image];
}

/**
 *  通过图片名字生成UIImageView
 *
 *  @param imageName 图片名字
 *
 *  @return UIImageView对象
 */
+ (instancetype)HDImageViewWithImageName:(NSString *)imageName {
    return [self HDImageViewWithImage:[UIImage imageNamed:imageName]];
}


@end
