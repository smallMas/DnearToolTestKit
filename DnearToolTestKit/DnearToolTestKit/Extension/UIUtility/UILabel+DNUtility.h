//
//  UILabel+DNUtility.h
//  DnaerApp
//
//  Created by 燕来秋 on 2018/11/1.
//  Copyright © 2018 燕来秋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DNUtility)

#pragma mark - 富文本
- (void)attributedWithString:(NSString *)string handleString:(NSString *)hString handleColor:(UIColor *)color;

/*!
 * 设置行间距
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/*!
 * 创建一个段落风格
 */
+ (NSMutableParagraphStyle *)createParagraphStyleWithLineSpacing:(CGFloat)lineSpacing;

#pragma mark - 快捷创建方法
+ (UILabel *)createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color;
+ (UILabel *)createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;
+ (UILabel *)createFont:(UIFont *)font color:(UIColor *)color;
+ (UILabel *)createFont:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
