//
//  FLSubtitleMenuView.h
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FLSubtitleModel;

@interface FLSubtitleMenuView : UIView

- (instancetype)initWithSubtitles:(NSArray<FLSubtitleModel *> *)subtitles;

- (void)setTopSeparatorLineHidden:(BOOL)hidden;
- (void)setBottomSeparatorLineHidden:(BOOL)hidden;

@property (assign, nonatomic) NSInteger selectedIndex;

/**
 *  点击蒙版调用
 */
@property (copy, nonatomic) void(^clickedDimmingViewBlock)(void);


@property (copy, nonatomic) void (^buttonClickedBlock)(NSString *text);

@end
