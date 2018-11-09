//
//  NSString+VTUtility.h
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VTUtility)

#pragma mark - json转换
/*! 字符串转json对象 dictionary/array */
- (id)toJsonObject;

#pragma mark - 计算文本长度
/*! 计算文本宽度 */
- (CGFloat)calculateWidthWithFont:(UIFont *)font size:(CGSize)size;

/*! 计算文本rect */
- (CGRect)calculateRectWithFont:(UIFont *)font size:(CGSize)size;

/*! 计算段落的rect */
//- (CGRect)calculateParagraphStyle:(NSMutableParagraphStyle *)paragraphStyle font:(UIFont *)font size:(CGSize)size;

/*! 计算段落的高度 lineSpacing:行高 */
- (CGFloat)cal_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

#pragma mark - 加密
/*!
 *  获取字符串的MD5编码 16位
 *
 *  @return MD5编码
 */
- (NSString *)MD5_16;

/*!
 *  获取字符串的MD5编码 32位
 *
 *  @return MD5编码
 */
- (NSString *)MD5_32;

#pragma mark - 校验

/*!
 *  使用正则表达式校验字符串
 *
 *  @return 使用正则表达式，校验是否通过
 */
- (BOOL)checkWithPredicate:(NSString *)preStr;

/*!
 *  判断是否是email
 *
 *  @return 是否是email
 */
- (BOOL)isEmail;

/*!
 *  判断是否是手机号
 *
 *  @return 是否是手机号
 */
- (BOOL)isMobilePhone;

@end
