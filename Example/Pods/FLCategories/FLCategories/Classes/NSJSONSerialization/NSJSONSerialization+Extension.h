//
//  NSJSONSerialization+Extension.h
//  FengLei
//
//  Created by liaoxf on 2017/11/25.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (Extension)

/// 字典转json带转义
+ (NSString *)jsonStringWithDict:(NSDictionary *)dict;
/// 字典转json不带转义
+ (NSString *)noEscapeToJsonStringWithDict:(NSDictionary *)dict;

@end
