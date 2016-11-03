//
//  UIImage+HDAdditions.m
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-7-22.
//  Copyright (c) 2014年 YH. All rights reserved.
//

#import "UIImage+HDCore.h"

@implementation UIImage (HDCore)

//有损缩放图片
- (UIImage *)HDScaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage*)HDImageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (NSData *)HDDataTurn {
    NSData *data;
    if (UIImagePNGRepresentation(self) == nil) {
            data = UIImageJPEGRepresentation(self, 1.0);
        } else {
            data = UIImagePNGRepresentation(self);
        }
    return data;
}


@end
