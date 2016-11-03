//
//  UILabel+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "UILabel+HDCore.h"
#import "HDUtilsMacro.h"

@implementation UILabel (HDCore)

-(void)HDResizeToStretch{
    float width = [self expectedWidth];
    CGRect newFrame = [self frame];
    newFrame.size.width = width;
    [self setFrame:newFrame];
}

-(float)expectedWidth{
    [self setNumberOfLines:1];
    
    CGSize maximumLabelSize = CGSizeMake(9999,self.frame.size.height);
    
    CGSize expectedLabelSize = [[self text] sizeWithFont:[self font]
                                       constrainedToSize:maximumLabelSize
                                           lineBreakMode:[self lineBreakMode]];
    return expectedLabelSize.width;
}

- (void)HDResizeToHeight {
    CGSize labelsize = [self boundingRect];
    CGRect newFrame = self.frame;
    newFrame.size.height = labelsize.height;
    self.frame = newFrame;
}

- (CGSize)boundingRect
{
    return [UILabel HDCalculateHeightWithText:self.text font:self.font size:self.frame.size lineBreakMode:self.lineBreakMode];
}

+ (CGSize)HDCalculateHeightWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    CGSize retSize;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        NSDictionary *attribute = @{NSFontAttributeName:font};
        retSize = [text boundingRectWithSize:size
                                     options:
                   NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesFontLeading |
                   NSStringDrawingUsesLineFragmentOrigin                                              attributes:attribute
                                     context:nil].size;
    } else {
        retSize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
    }
    return retSize;
}

- (void)HDColorTextWithColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *title = self.attributedText;
    
    if (title.length == 0) {
        title = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    
    [title addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = title;
}

@end
