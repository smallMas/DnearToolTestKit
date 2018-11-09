//
//  NSObject+VTSerialization.m
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import "NSObject+VTSerialization.h"
#import <objc/runtime.h>

@implementation NSObject (VTSerialization)

#pragma mark - 归档
- (void)decode:(NSCoder *)aDecoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
}

- (void)encode:(NSCoder *)aCoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

#pragma mark - 空判断
- (BOOL)isNull {
    if ([self isEqual:[NSNull null]] ||
        self == nil) {
        return YES;
    }
    return NO;
}

- (BOOL)isNullAndEmpty {
    if ([self isEqual:[NSNull null]] ||
        self == nil ||
        [self isEqual:@""]) {
        return YES;
    }
    return NO;
}

@end
