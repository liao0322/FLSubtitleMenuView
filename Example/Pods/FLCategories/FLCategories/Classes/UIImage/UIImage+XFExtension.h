//
//  UIImage+XFExtension.h
//  FengLei
//
//  Created by liaoxf on 2017/11/23.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XFExtension)

/// 根据颜色生成纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (instancetype)imageWithName:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass;

@end
