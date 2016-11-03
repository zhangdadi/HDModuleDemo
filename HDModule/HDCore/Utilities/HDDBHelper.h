//
//  HDDBKeyValue.h
//  HDCore
//
//  Created by 张达棣 on 16/6/20.
//  Copyright © 2016年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  方便操作的数据本地保存,用于代替系统的
 */
@interface HDDBHelper : NSObject

/**
 *  保存数据
 *
 *  @param value 数据
 *  @param key   key
 */
+ (void)setValue:(id)value forKey:(NSString *)key;
+ (id)valueForKey:(NSString *)key;

@end
