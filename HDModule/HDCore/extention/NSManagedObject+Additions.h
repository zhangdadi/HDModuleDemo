//
//  NSManagedObject+Additions.h
//  demo2
//
//  Created by 张达棣 on 14-5-14.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Additions)

/**
 *  添加新对象
 *
 *  @return 新对象的实例
 */
+ (instancetype)addNewObject;

/**
 *  查询数据
 *
 *  @param format 查询条件
 *
 *  @return 查询的结果数组
 */
+ (NSArray *)queryWithFormat:(NSString *)format;

/**
 *  查询数据
 *
 *  @param format 查询条件
 *  @param sortDescriptorKey 排序实体key
 *  @param ascending YES if the receiver specifies sorting in ascending order, otherwise NO.
 *
 *  @return 查询的结果数组
 */

+ (NSArray *)queryWithFormat:(NSString *)format sortDescriptorKey:(NSString *)sortDescriptorKey ascending:(BOOL)ascending;

//查询最后一条记录
+ (instancetype)queryWithFormat:(NSString *)format maxKey:(NSString *)maxKey;

//查询数量
+ (NSInteger)queryCountWithFormat:(NSString *)format;

/**
 *  删除对象
 *
 *  @param format 删除条件
 */
+ (void)delObjectFormat:(NSString *)format;

/**
 *  分页查询
 *
 *  @param format            查询条件
 *  @param pageCount         一页大小
 *  @param pageNumber         页码
 *  @param isLast            是否从最后面查询
 *  @param sortDescriptorKey 排序实体key
 *  @param ascending         YES if the receiver specifies sorting in ascending order, otherwise NO.
 *
 *  @return 记录数组
 */
+ (NSArray *)queryWithFormat:(NSString *)format PageCount:(NSInteger)pageCount pageNumber:(NSInteger)pageNumber isLast:(BOOL)isLast sortDescriptorKey:(NSString *)sortDescriptorKey ascending:(BOOL)ascending;

/**
 *  保存
 */
+ (void)saveContext;

@end
