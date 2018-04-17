//
//  FLTagSelectDropDownView.m
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import "FLTagSelectDropDownView.h"
#import "NoHighlightButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface FLTagSelectDropDownView ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (strong, nonatomic) IBOutletCollection(NoHighlightButton) NSArray *tagButtonsArray;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *btnWidthCons;

@property (strong, nonatomic) UIButton *selectedButton;

@end

@implementation FLTagSelectDropDownView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.stackView.spacing = 15 * SCREEN_WIDTH / 375;
    [self.tagButtonsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NoHighlightButton *button = obj;
        [button addTarget:self action:@selector(tagButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0f green:179/255.0f blue:15/255.0f alpha:1]] forState:UIControlStateSelected];
        [button setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.layer.cornerRadius = 3.0f;
        button.layer.masksToBounds = YES;
        
    }];
    
    [self.btnWidthCons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLayoutConstraint *widthCons = obj;
        widthCons.constant = 55 * SCREEN_WIDTH / 375;
    }];
}

- (void)setSelectedString:(NSString *)selectedString {
    _selectedString = selectedString;
    [self.tagButtonsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NoHighlightButton *button = obj;
        if ([[button currentTitle] isEqualToString:selectedString]) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }];
}

- (void)tagButtonClicked:(NoHighlightButton *)sender {
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    if (self.buttonClickedBlock) {
        self.buttonClickedBlock([sender currentTitle]);
    }

}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}





@end
