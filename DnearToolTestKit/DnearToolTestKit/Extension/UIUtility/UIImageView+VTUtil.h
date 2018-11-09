//
//  UIImageView+VTUtil.h
//  DnaerApp
//
//  Created by love on 2018/10/10.
//  Copyright © 2018年 love. All rights reserved.
//  图片加载

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"
#import "UIImageview+WebCache.h"

@interface UIImageView (VTUtil)

/*!
 * @brief 图片下载
 *
 * @param url 图片url
 */
- (void)setImageWithUrl:(NSString *)url;

/*!
 * @brief 图片下载
 *
 * @param url 图片url
 * @param placeholder 默认图
 */
- (void)setImageWithUrl:(NSString *)url
       placeholderImage:(UIImage *)placeholder;

/*!
 * @brief 图片下载
 *
 * @param url 图片url
 * @param placeholder 默认图
 * @param completedBlock 下载完成回调
 */
- (void)setImageWithUrl:(NSString *)url
       placeholderImage:(UIImage *)placeholder
              completed:(SDExternalCompletionBlock)completedBlock;

@end
