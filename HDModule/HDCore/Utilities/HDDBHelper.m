//
//  HDDBKeyValue.m
//  HDCore
//
//  Created by 张达棣 on 16/6/20.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "HDDBHelper.h"
#import "HDKeyValueModel.h"
#import "LKDBHelper.h"


@implementation HDDBHelper

static dispatch_queue_t db_queue()
{
    static dispatch_queue_t db_queue = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db_queue = dispatch_queue_create("HD.share.keyValue", NULL);
    });
    return db_queue;
}

+ (void)setValue:(id)value forKey:(NSString *)key {
    if (key && key.length > 0) {
        HDKeyValueModel *model = [[HDKeyValueModel alloc] init];
        model.key = key;
        if (value) {
            model.value = @{@"key": value};
            
            dispatch_async(db_queue(), ^{
                [model updateToDB];
            });
        } else {
            [model deleteToDB];
        }
    }
}

+ (id)valueForKey:(NSString *)key {
    if (key && key.length > 0){
        HDKeyValueModel *model = [HDKeyValueModel searchSingleWithWhere:@{@"key":key} orderBy:nil];
        if(model && model.value){
            return [model.value objectForKey:@"key"];
        }
    }

    return nil;
}

@end
