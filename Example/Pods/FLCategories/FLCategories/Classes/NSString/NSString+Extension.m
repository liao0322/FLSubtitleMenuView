//
//  NSString+Extension.m
//  BuyVegetablesTreasure
//
//  Created by DamonLiao on 2017/1/13.
//  Copyright © 2017年 c521xiong. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)clearLeadAndTailSpace {
    if(self.length == 0){
        return @"";
    }
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return string;
}

- (NSString *)clearAllSpace {
    if(self.length == 0){
        return @"";
    }
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
}

- (NSString *)decimalNumber {
    double ds = [self doubleValue];
    return [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf", ds]].stringValue;
}

+ (NSString *)decimalNumberWithDouble:(double)conversionValue {
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

+ (NSString *)moneyStringWithString:(NSString *)string {
    
    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    //    moneyFormatter.positiveFormat = @"###,##0.00";
    moneyFormatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    return [moneyFormatter stringFromNumber:[NSNumber numberWithFloat:[string doubleValue]]];
    /*
     NSNumberFormatter类有个属性numberStyle，是一个枚举型，设置不同的值可以输出不同的数字格式。该枚举包括：
     enum{
     NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
     NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
     NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
     NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
     NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
     NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
     };
     各个枚举对应输出数字格式的效果如下：
     123456789
     123,456,789
     ￥123,456,789.00
     -539,222,988%
     1.23456789E8
     */
}

/*
 *字符串转化成double类型
 */
- (double)StringChangeToDoubleForJingdu:(NSString *)textString
{
    if (textString == nil || [textString isEqualToString:@""]) {
        return 0.0;
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    return  [[formatter numberFromString:textString]doubleValue];
    
}

+ (NSString *)traditionalMoneyStringWithString:(NSString*)string {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setMaximumFractionDigits:6];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[string doubleValue]]];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"一" withString:@"壹"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"二" withString:@"贰"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"三" withString:@"叁"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"四" withString:@"肆"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"五" withString:@"伍"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"六" withString:@"陆"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"七" withString:@"柒"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"八" withString:@"捌"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"九" withString:@"玖"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"〇" withString:@"零"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"千" withString:@"仟"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"百" withString:@"佰"];
    formattedNumberString = [formattedNumberString stringByReplacingOccurrencesOfString:@"十" withString:@"拾"];
    if ([formattedNumberString rangeOfString:@"点"].length>0) {
        NSArray *arr = [formattedNumberString componentsSeparatedByString:@"点"];
        NSMutableString *lastStr = [[arr lastObject] mutableCopy];
        if (lastStr.length>=2) {
            [lastStr insertString:@"分" atIndex:lastStr.length];
        }
        if (![[lastStr substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"零"]) {
            [lastStr insertString:@"角" atIndex:1];
        }
        formattedNumberString = [[arr firstObject] stringByAppendingFormat:@"圆%@",lastStr];
    }
    else {
        formattedNumberString = [formattedNumberString stringByAppendingString:@"圆整"];
    }
    return formattedNumberString;
}

- (NSInteger)countOccurencesOfString:(NSString *)searchString {
    NSInteger strCount = [self length] - [[self stringByReplacingOccurrencesOfString:searchString withString:@""] length];
    return strCount / [searchString length];
}
@end
