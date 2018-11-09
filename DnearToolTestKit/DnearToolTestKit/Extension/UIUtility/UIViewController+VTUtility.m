//
//  UIViewController+VTUtility.m
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import "UIViewController+VTUtility.h"

@implementation UIViewController (VTUtility)

#pragma mark - Controller 生成
- (void)pushControllerWithClassString:(NSString *)classString {
    UIViewController *obj = [self createControllerWithClassString:classString];
    if ([obj isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (void)pushControllerWithClassString:(NSString *)classString params:(NSDictionary *)params {
    UIViewController *obj = [self createControllerWithClassString:classString];
    for (NSString *key in params) {
        [obj setValue:params[key] forKey:key];
    }
    if ([obj isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (UIViewController *)createControllerWithClassString:(NSString *)classString {
    Class cls = NSClassFromString(classString);
    UIViewController *obj = [cls new];
    return obj;
}

#pragma mark - 导航栏按钮生成
- (UIBarButtonItem *)createBarItemWithTitle:(NSString *)title action:(SEL)action {
    UIFont *titleFont = [UIFont systemFontOfSize:17];
    NSDictionary *dic = @{NSFontAttributeName:titleFont};
    CGRect rect = CGRectMake(0, 0, 44, 44);
    if (title) {
        CGRect r = [title boundingRectWithSize:CGSizeMake(0, 44)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic
                                       context:nil];
        CGFloat w = r.size.width+5;
        if (w > 80) {
            rect.size.width = 80;
        }else if (w < 44) {
            rect.size.width = 44;
        }else {
            rect.size.width = w;
        }
    }
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.frame = rect;
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton.titleLabel setFont:titleFont];
    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

- (UIBarButtonItem *)createBarItemWithImage:(UIImage *)image hightImage:(UIImage *)higthImage action:(SEL)action {
    UIButton *barButton = [self createButtonWithImage:image hightImage:higthImage action:action];
    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

- (UIButton *)createButtonWithImage:(UIImage *)image hightImage:(UIImage *)higthImage action:(SEL)action {
    UIButton *barButton = [self createButtonWithImage:image hightImage:higthImage rightMargin:0 action:action];
    return barButton;
}

- (UIButton *)createButtonWithImage:(UIImage *)image hightImage:(UIImage *)higthImage rightMargin:(CGFloat)rightMargin action:(SEL)action {
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.frame = CGRectMake(0, 0, 44, 44);
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton setImage:higthImage forState:UIControlStateHighlighted];
    CGFloat item_right = 8; //FKBarItem中 总体的偏移量
    CGFloat end_right = rightMargin;
    CGFloat right_margin = end_right-item_right;
    barButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -right_margin);
    return barButton;
}

- (UIBarButtonItem *)createBarItemCustomView:(UIView *)view {
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}


#pragma mark - tabbar按钮生成
- (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage tag:0];
    return item;
}

- (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *osImage = [sImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage selectedImage:osImage];
    return item;
}

@end
