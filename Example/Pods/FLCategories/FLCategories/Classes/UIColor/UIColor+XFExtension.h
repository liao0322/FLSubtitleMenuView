//
//  UIColor+XFExtension.h
//  Treasure
//
//  Created by liaoxf on 2017/11/17.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XFExtension)

/// 随机颜色
+ (UIColor *)randomColor;
+ (UIColor *)colorWithHexString:(NSString *)string;
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;
+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(NSInteger)alpha;
+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue;
@end
