//
//  NSString+VTUtility.m
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import "NSString+VTUtility.h"
#import "CommonCrypto/CommonDigest.h"
#import <CommonCrypto/CommonCryptor.h>  //DES 加密

@implementation NSString (VTUtility)

#pragma mark - json转换
- (id)toJsonObject {
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
}

#pragma mark - 计算文本长度
/*! 计算文本宽度 */
- (CGFloat)calculateWidthWithFont:(UIFont *)font size:(CGSize)size {
    CGRect rect = [self calculateRectWithFont:font size:size];
    return rect.size.width;
}

/*! 计算文本rect */
- (CGRect)calculateRectWithFont:(UIFont *)font size:(CGSize)size {
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil];
    return rect;
}

//- (CGRect)calculateParagraphStyle:(NSMutableParagraphStyle *)paragraphStyle font:(UIFont *)font size:(CGSize)size {
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
//    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [self length])];
////    CGRect rect = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
//    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];//,NSParagraphStyleAttributeName:paragraphStyle
//    return rect;
//}


- (CGFloat)cal_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing  = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    
    return ceil(textSize.height);
}

#pragma mark - 加密
- (NSString *)MD5_16 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X",
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11]
             ] lowercaseString];
}

/*!
 *  获取字符串的MD5编码 32位
 *
 *  @return MD5编码
 */
- (NSString *)MD5_32 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

#pragma mark - 校验
/*!
 *  使用正则表达式校验字符串
 *
 *  @return 使用正则表达式，校验是否通过
 */
- (BOOL)checkWithPredicate:(NSString *)preStr {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", preStr];
    
    return [predicate evaluateWithObject:self];
}

/*!
 *  判断是否是email
 *
 *  @return 是否是email
 */
- (BOOL)isEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    return [self checkWithPredicate:regex];
}

/*!
 *  判断是否是手机号
 *
 *  @return 是否是手机号
 */
- (BOOL)isMobilePhone {
    NSString *regex = @"^1[3|4|5|6|7|8|9][0-9]\\d{8}";
    
    return [self checkWithPredicate:regex];
}

@end
