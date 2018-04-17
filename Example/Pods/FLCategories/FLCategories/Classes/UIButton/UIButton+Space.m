//
//  UIButton+Space.m
//  FengLei
//
//  Created by 惊蛰 on 17/6/13.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "UIButton+Space.h"
#import <objc/runtime.h>
#import <objc/message.h>

static const char alertKey;
@implementation UIButton (Space)
- (id)indexPath {
    return objc_getAssociatedObject(self, @selector(indexPath));
}

- (void)setIndexPath:(id)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setSpace:(NSNumber*)space
{
    objc_setAssociatedObject(self, &alertKey, space, OBJC_ASSOCIATION_ASSIGN);
    [self btnEdgeInsets];
}
-(NSNumber *)space
{
    return  objc_getAssociatedObject(self, &alertKey);
}
-(void)btnEdgeInsets
{
    UIImage *img=self.imageView.image;
    NSString *title=self.titleLabel.text;
    UIFont *font=self.titleLabel.font;
    CGRect titleRect=[title boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
#pragma mark 修正图片宽高 按imageview的tag  这个tag有影响
    CGFloat imageHeight = titleRect.size.height+self.imageView.tag;
    if (imageHeight>img.size.height) {
        imageHeight=img.size.height;
    }
    CGFloat imageWidth = imageHeight*(img.size.width)/(img.size.height);
    CGFloat leftSpace = (self.bounds.size.width-(titleRect.size.width)-self.space.floatValue-imageWidth)*0.5;
    CGFloat middle = (self.bounds.size.height-imageHeight)*0.5;
    CGFloat left = (titleRect.size.width)+self.space.floatValue+leftSpace;
    self.imageEdgeInsets=UIEdgeInsetsMake(middle, leftSpace, middle, left);
    self.titleEdgeInsets=UIEdgeInsetsMake(0.5*(self.bounds.size.height-(titleRect.size.height)), leftSpace+self.space.floatValue+imageWidth-(img.size.width), 0.5*(self.bounds.size.height-(titleRect.size.height)),0);

}
@end
