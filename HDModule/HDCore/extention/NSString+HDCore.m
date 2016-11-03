//
//  NSString+HDAdditions.m
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-9-5.
//  Copyright (c) 2014年 HD. All rights reserved.
//

#import "NSString+HDCore.h"

#pragma mark - NSString(HDCore)

@implementation NSString (HDCore)

+ (NSString *)HDUuid{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
    CFRelease(strUuid);
    CFRelease(uuid);
    return  str;
}

- (BOOL)HDIsNull {
    
    if (self.length == 0 || [self isEqual:[NSNull null]] || [self isEqualToString:@"null"]) {
        return YES;
    }
    
    //判断是否全为空格
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)nullToEmpty {
    if ([self HDIsNull]) {
        return @"";
    }
    
    return self;
}

- (NSString *)HDFloatValue {
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet]] componentsJoinedByString:@""];
}


@end

#pragma mark - NSString(HDFilePath)

@implementation NSString (HDFilePath)

+ (NSString *)HDTemporaryPath
{
    return NSTemporaryDirectory();
}

+ (NSString *)HDCachePath
{
    NSArray *CachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString  *directory = [CachePaths objectAtIndex:0];
    
    return directory;
}

@end

#pragma mark - NSString(URL)

@implementation NSString (URL)

- (NSString*)HDStringByURLEncodingStringParameter
{
    NSString *resultStr = self;
    
    CFStringRef originalString = (__bridge CFStringRef) self;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
    
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                         originalString,
                                                         leaveUnescaped,
                                                         forceEscaped,
                                                         kCFStringEncodingUTF8);
    
    if( escapedStr )
    {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
        
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" "
                                    withString:@"%20"
                                       options:0
                                         range:NSMakeRange(0, [mutableStr length])];
        resultStr = mutableStr;
    }
    return resultStr;
}


@end


@implementation NSString (call)

- (void)HDCall {
    NSString *urlStr = [NSString stringWithFormat:@"tel:%@", self];
    UIWebView *callWebView = [[UIWebView alloc] init];
    [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    [[UIApplication sharedApplication].keyWindow addSubview:callWebView];
}

@end
