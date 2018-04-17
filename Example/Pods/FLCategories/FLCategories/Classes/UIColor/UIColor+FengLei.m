//
//  UIColor+FengLei.m
//  FengLei
//
//  Created by liaoxf on 2017/11/21.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "UIColor+FengLei.h"
#import "UIColor+XFExtension.h"

@implementation UIColor (FengLei)

+ (UIColor *)FLNavBarBackgroundColor {
    return [UIColor colorWithHex:0xfdd100];
}

+ (UIColor *)FLNavBarBackgroundWhiteColor {
    return [UIColor colorWithHex:0xffffff];
}

+ (UIColor *)FLNavBarTintColor {
    return [UIColor colorWithHex:0x999999];
}

+ (UIColor *)FLNavBarTitleTextColor {
    return [UIColor colorWithHex:0x333333];
}

+ (UIColor *)FLDarkTextColor {
    return [UIColor colorWithHex:0x666666];
}

+ (UIColor *)FLPageBackgroundColor {
    return [UIColor colorWithHex:0xf6f6f6];
}

+ (UIColor *)FLMainTextColor {
    return [UIColor colorWithHex:0x333333];
}

+ (UIColor *)FLLightTextColor {
    return [self FLNavBarTintColor]; // 999999
}

+ (UIColor *)FLMainTintColor {
    return [UIColor colorWithHex:0xFEAB2C];
}

+ (UIColor *) FLSeparatorColor {
    return [UIColor colorWithHex:0xe5e5e5];
}

+ (UIColor *)FLDisabledButtonColor {
    return [self FLSeparatorColor];
}
@end
