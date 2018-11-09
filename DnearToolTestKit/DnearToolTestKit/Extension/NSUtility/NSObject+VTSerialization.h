//
//  NSObject+VTSerialization.h
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (VTSerialization)

#pragma mark - 归档
/*! 序列化,解档 */
- (void)decode:(NSCoder *)aDecoder;
/*! 序列化,归档 */
- (void)encode:(NSCoder *)aCoder;

#pragma mark - 空判断
/*!
 *  判断是否是nil、null
 *
 *  @return 是否是nil、null
 */
- (BOOL)isNull;

/*!
 *  判断是否是nil、null、@""
 *
 *  @return 是否是nil、null、@""
 */
- (BOOL)isNullAndEmpty;

@end
