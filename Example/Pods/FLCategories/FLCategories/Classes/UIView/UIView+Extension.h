//
//  UIView+Extension.h
//  FengLei
//

//  Created by liaoxf on 2018/1/16.

//  Copyright © 2018年 com.mlj.FengLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


- (UIEdgeInsets)fl_safeAreaInsets;

- (UIView *)subViewOfClassName:(NSString *)className;


@end
