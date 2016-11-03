//
//  NSString+HDAdditions.h
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-9-5.
//  Copyright (c) 2014年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (HDCore)

/**
 *  获取uuid
 *
 *  @return uuid
 */
+ (NSString *)HDUuid;

/**
 *  判断字符串是否为空,YES表示为空,否则为不空.
 *
 *  @return YES表示为空,否则为不空.
 */
- (BOOL)HDIsNull;

/**
 *  把null等空字符转化成@""
 *
 *  @return 如果为空则返回@"",否则返回原字符
 */
- (NSString *)HDNullToEmpty;

/**
 *  提取字符串里的数字和小数点
 *
 *  @return 只包含数字和小数点的字符
 */
- (NSString *)HDFloatValue;



@end

@interface NSString (HDFilePath)

/**
 *  获取获取临时目录
 *
 *  @return 临时目录
 */
+ (NSString *)HDTemporaryPath;

/**
 *  获取缓存目录
 *
 *  @return 缓存目录
 */
+ (NSString *)HDCachePath;

@end

@interface NSString (URL)

- (NSString*)HDStringByURLEncodingStringParameter;

@end

@interface NSString (call)

/**
 *  打电话
 */
- (void)HDCall;

@end
