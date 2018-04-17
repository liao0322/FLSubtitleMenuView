//
//  NSJSONSerialization+Extension.m
//  FengLei
//
//  Created by liaoxf on 2017/11/25.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "NSJSONSerialization+Extension.h"

@implementation NSJSONSerialization (Extension)

+ (NSString *)jsonStringWithDict:(NSDictionary *)dict {
    NSError *error;
    NSString *jsonString;
    NSData *jsonData = [self dataWithJSONObject:dict options:kNilOptions error:&error];
    if (!jsonData) {
        NSLog(@"字典转json错误：%@",error);
        return nil;
    }else{
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    // 中文用 utf-8 编码
//    jsonString = [jsonString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    // 去掉字符串中的空格
//    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 去掉字符串中的换行符
//    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return jsonString;
}

+ (NSString *)noEscapeToJsonStringWithDict:(NSDictionary *)dict {
    NSError *error;
    NSString *jsonString;
    NSData *jsonData = [self dataWithJSONObject:dict options:kNilOptions error:&error];
    if (!jsonData) {
        NSLog(@"字典转json错误：%@",error);
        return nil;
    }else{
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    // 去掉字符串中的空格
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 去掉字符串中的换行符
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return jsonString;
}

@end
