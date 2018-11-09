//
//  UIButton+DNUtility.m
//  DnaerApp
//
//  Created by 燕来秋 on 2018/11/2.
//  Copyright © 2018 燕来秋. All rights reserved.
//

#import "UIButton+DNUtility.h"

@implementation UIButton (DNUtility)

+ (UIButton *)createWithType:(UIButtonType)type target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:type];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton *)createWithFrame:(CGRect)frame type:(UIButtonType)type target:(id)target action:(SEL)action {
    UIButton *btn = [self createWithType:type target:target action:action];
    return btn;
}

@end
