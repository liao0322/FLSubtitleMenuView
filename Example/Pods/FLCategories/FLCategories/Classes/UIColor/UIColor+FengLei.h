//
//  UIColor+FengLei.h
//  FengLei
//
//  Created by liaoxf on 2017/11/21.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FengLei)

/// 导航栏背景色
+ (UIColor *)FLNavBarBackgroundColor;
+ (UIColor *)FLNavBarBackgroundWhiteColor;
+ (UIColor *)FLNavBarTintColor;
+ (UIColor *)FLNavBarTitleTextColor;
/// 页面背景色
+ (UIColor *)FLPageBackgroundColor;
/// 文字主色
+ (UIColor *)FLMainTextColor;
/// 文字副色暗
+ (UIColor *)FLDarkTextColor;
/// 文字副色亮
+ (UIColor *)FLLightTextColor;
/// 整体主色
+ (UIColor *)FLMainTintColor;
/// 分隔线颜色
+ (UIColor *)FLSeparatorColor;

+ (UIColor *)FLDisabledButtonColor;


@end
