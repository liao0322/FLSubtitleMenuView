//
//  UIView+Fillet.h
//  FengLei
//
//  给某个角添加圆角
//
//  Created by liaoxf on 2017/12/12.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Fillet)


/**
 给某个角添加圆角

 @param radius 角度
 @param corners UIRectCornerTopLeft | UIRectCornerBottomRight
 */
- (void)setCornerRadiusWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;

@end
