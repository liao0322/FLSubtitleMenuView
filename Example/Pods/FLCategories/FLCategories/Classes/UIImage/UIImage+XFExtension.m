//
//  UIImage+XFExtension.m
//  FengLei
//
//  Created by liaoxf on 2017/11/23.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "UIImage+XFExtension.h"

@implementation UIImage (XFExtension)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)imageWithName:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass {
    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:targetClass];
    NSString *name = [NSString stringWithFormat:@"%@@%zdx", imageName, scale];
    NSString *dir = [NSString stringWithFormat:@"%@.bundle", bundle];
    NSString *path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
    return path ? [UIImage imageWithContentsOfFile:path] : nil;
}

@end
