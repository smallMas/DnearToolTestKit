//
//  NSArray+VTUtility.h
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import <Foundation/Foundation.h>

// 拼音的字段
extern NSString *const SmFirstLetter;
extern NSString *const SmContent;

@interface NSArray (VTUtility)

/*! array转json字符串 */
- (NSString *)toJsonString;

/*!
 * @brief 按拼音首字母分类
 *
 * @param key model的属性名
 */
- (NSArray *)arrayWithPinYinFirstCharWithKey:(NSString *)key;

@end
