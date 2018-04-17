//
//  UIView+Fillet.m
//  FengLei
//
//  Created by liaoxf on 2017/12/12.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "UIView+Fillet.h"

@implementation UIView (Fillet)

- (void)setCornerRadiusWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners {
    // 左上角和右下角添加圆角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
//    UIColor *color = [UIColor redColor];
//    [color setStroke];
//    // 如果要显示描边，可以添加以下代码
//    maskPath.lineWidth = 0.5f;
//
//    [maskPath stroke];
}

@end
