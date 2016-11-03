//
//  NSManagedObject+Additions.m
//  demo2
//
//  Created by 张达棣 on 14-5-14.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "NSManagedObject+Additions.h"
#import "AppDelegate.h"

@implementation NSManagedObject (Additions)

+ (NSManagedObjectContext *)managedObjectContext {
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
}

+ (instancetype)addNewObject {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:[self managedObjectContext]];
}

+ (NSArray *)queryWithFormat:(NSString *)format {
    return [self queryWithFormat:format sortDescriptorKey:nil ascending:YES];
}

+ (NSArray *)queryWithFormat:(NSString *)format sortDescriptorKey:(NSString *)sortDescriptorKey ascending:(BOOL)ascending {
    NSFetchRequest *request = [self setFetchRequest:format];
    
    if (sortDescriptorKey != nil) {
        NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:sortDescriptorKey ascending:ascending];
        NSArray * sortDescriptors = [NSArray arrayWithObject:sort];
        [request setSortDescriptors:sortDescriptors]; //设置查询结果的排序方法
    }
    
    NSError *error = nil;
    NSMutableArray *resultArray=[[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    if (resultArray == nil) {
        DLog(@"CoreData Error === 查询%@：%@", NSStringFromClass([self class]), error);
    }
    return resultArray;
}

+ (instancetype)queryWithFormat:(NSString *)format maxKey:(NSString *)maxKey {
    NSFetchRequest *request = [self setFetchRequest:format];
    
    [request setResultType:NSDictionaryResultType]; //必须设置为这个类型
    //构造用于sum的ExpressionDescription
    NSExpression *theMaxExpression = [NSExpression expressionForFunction:@"max:" arguments:[NSArray arrayWithObject:[NSExpression expressionForKeyPath:maxKey]]];
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName:@"mid"];
    [expressionDescription setExpression:theMaxExpression];
    [expressionDescription setExpressionResultType:NSInteger32AttributeType];
    
    //加入Request
    [request setPropertiesToFetch:[NSArray arrayWithObjects:expressionDescription,nil]];
    
    NSError* error;
    id result = [[self managedObjectContext] executeFetchRequest:request error:&error];
    NSNumber *maxId = [[result objectAtIndex:0] objectForKey:@"mid"];
    if (maxId.integerValue == 0) {
        return nil;
    }
    NSArray *array = [self queryWithFormat:[NSString stringWithFormat:@"%@=%@", maxKey, maxId]];
    if (array.count > 0) {
        return array[0];
    } else {
        return nil;
    }
}

+ (NSInteger)queryCountWithFormat:(NSString *)format {
    NSFetchRequest *request = [self setFetchRequest:format];
    
    [request setResultType:NSCountResultType]; //关键是这步
    NSError* error1;
    id result = [[self managedObjectContext] executeFetchRequest:request error:&error1];
    return [[result objectAtIndex:0] integerValue];
}

+ (NSArray *)queryWithFormat:(NSString *)format PageCount:(NSInteger)pageCount pageNumber:(NSInteger)pageNumber isLast:(BOOL)isLast sortDescriptorKey:(NSString *)sortDescriptorKey ascending:(BOOL)ascending {
    NSFetchRequest *request = [self setFetchRequest:format];
    NSInteger count = 0;
    if (isLast) {
        count = [self queryCountWithFormat:format];
    }
    request.fetchLimit = pageCount;
    if (isLast) {
        request.fetchOffset = count - request.fetchLimit * pageNumber;
    } else {
        request.fetchOffset = request.fetchLimit * pageNumber;
    }
    
    if (sortDescriptorKey != nil) {
        NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:sortDescriptorKey ascending:ascending];
        NSArray * sortDescriptors = [NSArray arrayWithObject:sort];
        [request setSortDescriptors:sortDescriptors]; //设置查询结果的排序方法
    }
    
    NSError *error = nil;
    NSMutableArray *resultArray=[[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    if (resultArray == nil) {
        DLog(@"CoreData Error === 查询%@：%@", NSStringFromClass([self class]), error);
    }
    return resultArray;
}

+ (void)delObjectFormat:(NSString *)format {
    NSArray *resultArray = [self queryWithFormat:format];
    for (NSManagedObject *obj in resultArray) {
        [[self managedObjectContext] deleteObject:obj];
    }
    [self saveContext];
}

+ (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            DLog(@"CoreData Error === 保存%@, %@", error, [error userInfo]);
//            abort();
        }
    }

}


+ (NSFetchRequest *)setFetchRequest:(NSString *)format {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    if (format != nil) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:format]; //设置查询条件
        [request setPredicate:predicate];
    }
    return request;
}

@end
