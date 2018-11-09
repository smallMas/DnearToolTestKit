//
//  UILabel+DNUtility.m
//  DnaerApp
//
//  Created by 燕来秋 on 2018/11/1.
//  Copyright © 2018 燕来秋. All rights reserved.
//

#import "UILabel+DNUtility.h"

@implementation UILabel (DNUtility)

- (void)attributedWithString:(NSString *)string handleString:(NSString *)hString handleColor:(UIColor *)color {
    NSRange range = [string rangeOfString:hString];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:string];
    [content addAttribute:NSFontAttributeName
                    value:self.font
                    range:range];
    [content addAttribute:NSForegroundColorAttributeName
                    value:color
                    range:range];
    
    self.attributedText = content;
}

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}

// 创建一个默认的段落风格
+ (NSMutableParagraphStyle *)createParagraphStyleWithLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setAlignment:NSTextAlignmentNatural];
    return paragraphStyle;
}

#pragma mark - 快捷创建方法
+ (UILabel *)createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.textColor = color;
    return label;
}

+ (UILabel *)createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    UILabel *label = [self createFrame:frame font:font color:color];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

+ (UILabel *)createFont:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    return label;
}

+ (UILabel *)createFont:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    UILabel *label = [self createFont:font color:color];
    label.textAlignment = alignment;
    return label;
}

@end
