//
//  NSDictionary+VTUtility.m
//  DnaerApp
//
//  Created by love on 2018/9/26.
//  Copyright © 2018年 love. All rights reserved.
//

#import "NSDictionary+VTUtility.h"

@implementation NSDictionary (VTUtility)
- (NSString *)toJsonString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
