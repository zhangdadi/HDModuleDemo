//
//  HUDCenter.m
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-6-26.
//  Copyright (c) 2014年 yh. All rights reserved.
//

#import "HDHUDCenter.h"
#import "MBProgressHUD.h"
#import "HDUtilsMacro.h"

static MBProgressHUD *_hud;

@interface HUDOvertime : NSObject

@end

@implementation HUDOvertime

- (void)startOvertime:(NSTimeInterval)delay {
    [self performSelector:@selector(overtime) withObject:nil afterDelay:delay];
}

- (void)stopOvertime {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)overtime {
    [HDHUDCenter showErrorText:@"请求超时" delay:1.5];
}
@end

static HUDOvertime *_overtime = [[HUDOvertime alloc] init];

void addsubWin() {
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
        _hud.backgroundColor = HDColorFromRGBA(0, 0, 0, .5);
        _hud.color = [UIColor whiteColor];
        _hud.labelColor = HDColorFromHexadecimalRGB(0x171717);
        _hud.labelFont = [UIFont systemFontOfSize:14];
    }
    if ([_hud superclass] != [UIApplication sharedApplication].keyWindow) {
        [[UIApplication sharedApplication].keyWindow addSubview:_hud];
    }
}

void addsubView(UIView *view) {
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithView:view];
    }
    if ([_hud superclass] != view) {
        [view addSubview:_hud];
    }
}

void HUD_show(NSTimeInterval time) {
    addsubWin();
    [_hud show:YES];
    [HDHUDCenter hideWithDelay:time];
}
void HUD_show() {
    [_overtime stopOvertime];
    addsubWin();
    [_hud show:YES];
}


@implementation HDHUDCenter

//权限提示时使用
+ (void)showPermissionsText:(NSString *)text
{
    addsubWin();
    _hud.mode = MBProgressHUDModeText;
    _hud.labelText = text;
    HUD_show();
}

+ (void)showPermissionsText:(NSString *)text delay:(NSTimeInterval)delay {
    [HDHUDCenter showPermissionsText:text];
    [HDHUDCenter hideWithDelay:delay];
    [_overtime startOvertime:delay];
}

//网络请求时使用
+ (void)showLoadText:(NSString *)text {
    addsubWin();
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.labelText = text;
    HUD_show();
}
+ (void)showLoadText:(NSString *)text delay:(NSTimeInterval)delay {
    [HDHUDCenter showLoadText:text];
    [HDHUDCenter hideWithDelay:delay];
    [_overtime startOvertime:delay];
}


//网络错误提示时使用
+ (void)showErrorText:(NSString *)text {
    addsubWin();
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = text;
//    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"warning"]];
    HUD_show();
}
+ (void)showErrorText:(NSString *)text delay:(NSTimeInterval)delay {
    [HDHUDCenter showErrorText:text];
    [HDHUDCenter hideWithDelay:delay];
    
}
+ (void)showErrorText:(NSString *)text delay:(NSTimeInterval)delay completionBlock:(HDHUDCompletionBlock)completionBlock {
    [HDHUDCenter showErrorText:text delay:delay];
    [_hud setCompletionBlock:completionBlock];
}


//网络请求成功时使用
+ (void)showSucceedText:(NSString *)text {
    addsubWin();
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = text;
//    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"succeed"]];
    HUD_show();
}
+ (void)showSucceedText:(NSString *)text delay:(NSTimeInterval)delay {
    [HDHUDCenter showSucceedText:text];
    [HDHUDCenter hideWithDelay:delay];
}
+ (void)showSucceedText:(NSString *)text delay:(NSTimeInterval)delay completionBlock:(HDHUDCompletionBlock)completionBlock {
    [HDHUDCenter showSucceedText:text delay:delay];
    [_hud setCompletionBlock:completionBlock];
}

//隐藏hud
+ (void)hide {
    [HDHUDCenter hideWithDelay:0];
}
+ (void)hideWithDelay:(NSTimeInterval)delay {
    [_overtime stopOvertime];
    [_hud hide:YES afterDelay:delay];
}

+ (BOOL)getHide {
    return _hud.hidden;
}


@end

