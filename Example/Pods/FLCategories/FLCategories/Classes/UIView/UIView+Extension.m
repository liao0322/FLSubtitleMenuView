//
//  UIView+Extension.m
//  FengLei
//

//  Created by liaoxf on 2018/1/16.

//  Copyright © 2018年 com.mlj.FengLei. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


- (UIEdgeInsets)fl_safeAreaInsets {
    if (@available(iOS 11.0, *)) {
        return self.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}


- (UIView *)subViewOfClassName:(NSString *)className {
    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView *resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;

}

@end
