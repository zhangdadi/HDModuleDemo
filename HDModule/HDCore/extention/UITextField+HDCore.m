//
//  UITextField+HDCore.m
//  YMYG
//
//  Created by 张达棣 on 16/6/13.
//  Copyright © 2016年 HD. All rights reserved.
//

#import "UITextField+HDCore.h"
#import <objc/runtime.h>


static char HDMaxLenghtKey;

@implementation UITextField (HDCore)

- (void)setHDMaxLenght:(NSInteger)HDMaxLenght {
    objc_setAssociatedObject(self, &HDMaxLenghtKey, @(HDMaxLenght), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HDTextFieldEditChanged:)
                                                 name:UITextFieldTextDidChangeNotification object:self];
}

- (NSInteger)HDMaxLenght {
    return [objc_getAssociatedObject(self, &HDMaxLenghtKey) integerValue];
}


- (void)dealloc {
//     NSLog(@"%@被销毁了", self);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self];
}

-(void)HDTextFieldEditChanged:(NSNotification *)obj {
   UITextField *textField = (UITextField *)obj.object;
    if (textField != self) {
        return;
    }
    
    [self HDTextMaxLenght];
}

//最大长度限制
- (void)HDTextMaxLenght {
    if (self.HDMaxLenght == 0) { //最大长度为0时不限制
        return;
    }
    
    NSString *toBeString   = self.text;
    NSString *lang         = [self.textInputMode primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入
        //获取高亮部分
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position   = [self positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > self.HDMaxLenght) {
                self.text = [toBeString substringToIndex:self.HDMaxLenght];
            }
        }
        
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else {
        if (toBeString.length > self.HDMaxLenght) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.HDMaxLenght];
            if (rangeIndex.length == 1) {
                self.text = [toBeString substringToIndex:self.HDMaxLenght];
            } else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.HDMaxLenght)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}


@end
