//
//  NSString+Extension.h
//  BuyVegetablesTreasure
//
//  Created by DamonLiao on 2017/1/13.
//  Copyright © 2017年 c521xiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSString *)clearAllSpace;
- (NSString *)clearLeadAndTailSpace;
- (NSString *)decimalNumber;
+ (NSString *)moneyStringWithString:(NSString *)string;

+ (NSString *)decimalNumberWithDouble:(double)conversionValue;

/// 阿拉伯数字金额转中文繁体
+ (NSString *)traditionalMoneyStringWithString:(NSString*)string;

/// 统计 某个字符在字符串中出现的次数
- (NSInteger)countOccurencesOfString:(NSString *)searchString;
@end
