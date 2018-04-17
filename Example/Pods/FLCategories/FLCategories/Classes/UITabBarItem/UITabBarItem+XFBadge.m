//
//  UITabBarItem+XFBadge.m
//  Treasure
//
//  Created by liaoxf on 2017/11/21.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import "UITabBarItem+XFBadge.h"

@implementation UITabBarItem (XFBadge)

- (void)showBadge {
    UIView *barButtonView = [self valueForKey:@"view"];
    UIView *swappableImageView = [barButtonView.subviews firstObject];
    
    CGFloat badgeWidth = 7;
    UIView *badgeView = [[UIView alloc] initWithFrame:CGRectMake(swappableImageView.frame.size.width - badgeWidth / 2, - badgeWidth / 2, badgeWidth, badgeWidth)];
    badgeView.backgroundColor = [UIColor redColor];
    badgeView.layer.masksToBounds = YES;
    badgeView.layer.cornerRadius = badgeWidth / 2;
    [swappableImageView addSubview:badgeView];
    
}

- (void)hideBadge {
    UIView *barButtonView = [self valueForKey:@"view"];
    UIView *swappableImageView = [barButtonView.subviews firstObject];
    [[swappableImageView.subviews lastObject] removeFromSuperview];
}

@end
