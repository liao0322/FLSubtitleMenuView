//
//  FLTagSelectDropDownView.h
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLTagSelectDropDownView : UIView
@property (copy, nonatomic) void (^buttonClickedBlock)(NSString *text);
@property (copy, nonatomic) NSString *selectedString;
@end
