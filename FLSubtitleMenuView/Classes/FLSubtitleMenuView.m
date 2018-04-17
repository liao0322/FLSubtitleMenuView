//
//  FLSubtitleMenuView.m
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import "FLSubtitleMenuView.h"
#import "FLSubtitleModel.h"
#import "FLTagSelectDropDownView.h"
#import "NSString+UINib.h"
#import "UIImage+XFExtension.h"

@interface FLSubtitleMenuView ()

@property (copy, nonatomic) NSArray<FLSubtitleModel *> *subtitles;

@property (strong, nonatomic) NSMutableArray<UIButton *> *buttons;

@property (strong, nonatomic) UIButton *selectedButton;

@property (strong, nonatomic) UIView *topSeparatorLine;
@property (strong, nonatomic) UIView *bottomSeparatorLine;
@property (strong, nonatomic) UIView *indecatorLine;

@property (strong, nonatomic) UIView *dimmingView;

@property (strong, nonatomic) FLTagSelectDropDownView *tagSelectView;

@property (assign, nonatomic, getter=isExpanding) BOOL expanding;

@end

@implementation FLSubtitleMenuView

- (instancetype)initWithSubtitles:(NSArray<FLSubtitleModel *> *)subtitles {
    if (self = [super init]) {
        _selectedIndex = 0;
        _subtitles = subtitles;
        _buttons = [NSMutableArray arrayWithCapacity:subtitles.count];
        self.backgroundColor = [UIColor whiteColor];
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    [self addSubview:self.topSeparatorLine];
    [self addSubview:self.bottomSeparatorLine];
    [self createButtons];
    
    [self addSubview:self.indecatorLine];
    
}

- (void)createButtons {
    [self.subtitles enumerateObjectsUsingBlock:^(FLSubtitleModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:obj.subtitle forState:UIControlStateNormal];
        [btn setImage:[UIImage imageWithName:obj.imageName bundle:@"FLSubtitleMenuView" targetClass:[self class]] forState:UIControlStateNormal];
        
        
        
        [btn setTitleColor:[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(subtitleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (idx == self.selectedIndex) {
            btn.selected = YES;
            self.selectedButton = btn;
        }
        btn.tag = idx;
        
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.topSeparatorLine.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5);
    self.bottomSeparatorLine.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5);
    
    CGFloat btnWidth = CGRectGetWidth(self.frame) / self.buttons.count;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(idx * btnWidth, 5, btnWidth, 30);
    }];
    
    CGFloat indecatorLineX = CGRectGetMinX(self.selectedButton.frame) +
    CGRectGetWidth(self.selectedButton.frame) * 0.5 - 25 * 0.5;
    self.indecatorLine.frame = CGRectMake(indecatorLineX, CGRectGetMaxY(self.selectedButton.frame), 25, 1);
    
}

- (void)subtitleButtonClicked:(UIButton *)sender {
    
    NSString *subtitle = [sender currentTitle];
    
    if (sender.tag == 3) { // 点击了最后一个按钮
        if (self.isExpanding) {
            [self dismissDimmingView];
            return;
        }
        [self funnelButtonClicked:sender];
        return;

    }
    
    
    if (self.isExpanding) {
        [self dismissDimmingView];
    }
    if (sender == self.selectedButton) {
        return;
    }
    
    if (self.selectedButton.tag == 3) { // 上一个按钮是最后一个
        [self.selectedButton setTitle:nil forState:UIControlStateNormal];
        [self.selectedButton setImage:[UIImage imageWithName:@"sort_choose" bundle:@"FLSubtitleMenuView" targetClass:[self class]] forState:UIControlStateNormal];
        
    }
    
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    
    CGFloat indecatorLineX = CGRectGetMinX(self.selectedButton.frame) +
    CGRectGetWidth(self.selectedButton.frame) * 0.5 - 25 * 0.5;
    CGRect indecatorLineF = self.indecatorLine.frame;
    indecatorLineF.origin.x = indecatorLineX;
    [UIView animateWithDuration:0.2f animations:^{
        self.indecatorLine.frame = indecatorLineF;
    }];
    
    
    if (self.buttonClickedBlock) {
        self.buttonClickedBlock([self.selectedButton currentTitle]);
    }

    
}

// 点击了漏斗按钮
- (void)funnelButtonClicked:(UIButton *)sender {

    self.expanding = YES;
    

    UIView *controllerView = [self viewController].view;
    [controllerView addSubview:self.dimmingView];
    
    CGFloat selfBottom = CGRectGetMaxY([self convertRect:self.bounds toView:controllerView]);
    CGFloat dimmingViewHeight = CGRectGetHeight(controllerView.frame) - selfBottom;

    self.dimmingView.frame = CGRectMake(0, selfBottom, CGRectGetWidth(self.frame), dimmingViewHeight);
    
    NSString *subtitle = [sender currentTitle];
    if (subtitle != nil || subtitle.length > 0) { // 无标题
        self.tagSelectView.selectedString = subtitle;
    } else {
        self.tagSelectView.selectedString = nil;
    }
    
    [self.dimmingView addSubview:self.tagSelectView];
    __weak typeof(self) weakSelf = self;
    self.tagSelectView.buttonClickedBlock = ^(NSString *text) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        [sender setTitle:text forState:UIControlStateNormal];
        [sender setImage:nil forState:UIControlStateNormal];
        
        strongSelf.selectedButton.selected = NO;
        sender.selected = YES;
        strongSelf.selectedButton = sender;
        
        CGFloat indecatorLineX = CGRectGetMinX(strongSelf.selectedButton.frame) +
        CGRectGetWidth(strongSelf.selectedButton.frame) * 0.5 - 25 * 0.5;
        CGRect indecatorLineF = strongSelf.indecatorLine.frame;
        indecatorLineF.origin.x = indecatorLineX;
        [UIView animateWithDuration:0.2f animations:^{
            strongSelf.indecatorLine.frame = indecatorLineF;
        }];
        
        [strongSelf dismissDimmingView];
        
        if (strongSelf.buttonClickedBlock) {
            strongSelf.buttonClickedBlock(text);
        }
    };
    
    
    
    self.tagSelectView.frame = CGRectMake(0, -60, CGRectGetWidth(self.dimmingView.frame), 60);
    
    [UIView animateWithDuration:0.2f animations:^{
        self.tagSelectView.transform = CGAffineTransformMakeTranslation(0, 60);
    }];


}

// 点击了蒙版
- (void)dimmingViewClicked {
    [self dismissDimmingView];
    if (self.clickedDimmingViewBlock) {
        self.clickedDimmingViewBlock();
    }
}

- (void)dismissDimmingView {
    self.expanding = NO;
    [UIView animateWithDuration:0.2f animations:^{
        self.tagSelectView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.tagSelectView removeFromSuperview];
        self.tagSelectView = nil;
        [self.dimmingView removeFromSuperview];
        self.dimmingView = nil;
    }];
    
}

- (void)setTopSeparatorLineHidden:(BOOL)hidden {
    self.topSeparatorLine.hidden = hidden;
}

- (void)setBottomSeparatorLineHidden:(BOOL)hidden {
    self.bottomSeparatorLine.hidden = hidden;
}

// 获取该视图的控制器
- (UIViewController *)viewController{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

#pragma mark - Setters

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
}


#pragma mark - LazyLoad

- (UIView *)topSeparatorLine {
    if (!_topSeparatorLine) {
        _topSeparatorLine = [[UIView alloc] init];
        _topSeparatorLine.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1];
    }
    return _topSeparatorLine;
}

- (UIView *)bottomSeparatorLine {
    if (!_bottomSeparatorLine) {
        _bottomSeparatorLine = [[UIView alloc] init];
        _bottomSeparatorLine.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1];
    }
    return _bottomSeparatorLine;
}

- (UIView *)indecatorLine {
    if (!_indecatorLine) {
        _indecatorLine = [[UIView alloc] init];
        _indecatorLine.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    }
    return _indecatorLine;
}

- (UIView *)dimmingView {
    if (!_dimmingView) {
        _dimmingView = [[UIView alloc] init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewClicked)];
        [_dimmingView addGestureRecognizer:tap];
        
        _dimmingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _dimmingView.clipsToBounds = YES;
    }
    return _dimmingView;
}

- (FLTagSelectDropDownView *)tagSelectView {
    if (!_tagSelectView) {
        _tagSelectView = [[[NSBundle bundleForClass:[FLTagSelectDropDownView class]] loadNibNamed:[NSString nibNameWithTargetClass:[FLTagSelectDropDownView class]] owner:nil options:nil] lastObject];
        
    }
    return _tagSelectView;
}


@end
