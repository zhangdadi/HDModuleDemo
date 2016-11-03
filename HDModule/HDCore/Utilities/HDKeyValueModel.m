//
//  HDKeyValueModel.m
//  HDCore
//
//  Created by 张达棣 on 16/6/20.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDKeyValueModel.h"
#import "LKDBHelper.h"

@implementation HDKeyValueModel

static LKDBHelper* HDKDB = nil;
+(LKDBHelper *)getUsingLKDBHelper {
    if(HDKDB==nil){
        NSString *sqlitePath = [HDKeyValueModel getSqlitePath];
        NSString* dbpath     = [sqlitePath stringByAppendingPathComponent:@"AppKeyValue.db"];
        HDKDB              = [[LKDBHelper alloc] initWithDBPath:dbpath];
    }
    return HDKDB;
}

/**
 *  @brief  路径
 *  @return sql
 */
+ (NSString *)getSqlitePath{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *sqlitePath   = [documentPath stringByAppendingPathComponent:@"sqlite"];
//    NSLog(@"%@", sqlitePath);
    return sqlitePath;
}

+ (NSString *)getPrimaryKey{
    return @"key";
}

@end
