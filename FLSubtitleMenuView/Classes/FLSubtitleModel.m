//
//  FLSubtitleModel.m
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import "FLSubtitleModel.h"

@implementation FLSubtitleModel

- (instancetype)initWithSubtitle:(NSString *)subtitle
                       imageName:(NSString *)imageName {
    if (self = [super init]) {
        _subtitle = subtitle;
        _imageName = imageName;
    }
    return self;
}

+ (instancetype)modelWithSubtitle:(NSString *)subtitle
                        imageName:(NSString *)imageName {
    return [[self alloc] initWithSubtitle:subtitle imageName:imageName];
}

@end
