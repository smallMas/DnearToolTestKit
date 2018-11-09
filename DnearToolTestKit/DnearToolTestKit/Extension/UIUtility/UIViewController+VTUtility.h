//
//  UIViewController+VTUtility.h
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (VTUtility)

#pragma mark - Controller 生成
/*! 使用类字符串push Controller */
- (void)pushControllerWithClassString:(NSString *)classString;
/*! 使用类字符串push Controller 带参数[] */
- (void)pushControllerWithClassString:(NSString *)classString params:(NSDictionary *)params;
/*！使用类字符串生成类对象 */
- (UIViewController *)createControllerWithClassString:(NSString *)classString;

#pragma mark - 导航栏按钮生成
/*! 使用button生成 title ButtonItem */
- (UIBarButtonItem *)createBarItemWithTitle:(NSString *)title action:(SEL)action;
/*! 使用button生成 image ButtonItem */
- (UIBarButtonItem *)createBarItemWithImage:(UIImage *)image hightImage:(UIImage *)higthImage action:(SEL)action;
/*! 快速创建image的button */
- (UIButton *)createButtonWithImage:(UIImage *)image hightImage:(UIImage *)higthImage action:(SEL)action;
/*! 快速创建image的button rightMargin：右边距 ，一般用于最右侧导航按钮 */
- (UIButton *)createButtonWithImage:(UIImage *)image hightImage:(UIImage *)higthImage rightMargin:(CGFloat)rightMargin action:(SEL)action;
/*! 使用View 生成 ButtonItem */
- (UIBarButtonItem *)createBarItemCustomView:(UIView *)view;

#pragma mark - tabbar按钮生成
/*! title image生成tabbaritem */
- (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image;
/*! title image sImage生成tabbaritem */
- (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage;

@end
