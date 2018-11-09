//
//  UIImageView+VTUtil.m
//  DnaerApp
//
//  Created by love on 2018/10/10.
//  Copyright © 2018年 love. All rights reserved.
//

#import "UIImageView+VTUtil.h"
#import "DNServiceUrl.h"

@implementation UIImageView (VTUtil)

- (NSURL *)getUrl:(NSString *)string {
    NSString *str = interfaceFileUrl(string);
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:str];
    return url;
}

- (void)setImageWithUrl:(NSString *)url {
    [self sd_setImageWithURL:[self getUrl:url]];
}

- (void)setImageWithUrl:(NSString *)url
       placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:[self getUrl:url] placeholderImage:placeholder];
}

- (void)setImageWithUrl:(NSString *)url
       placeholderImage:(UIImage *)placeholder
              completed:(SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:[self getUrl:url] placeholderImage:placeholder completed:completedBlock];
}
@end
