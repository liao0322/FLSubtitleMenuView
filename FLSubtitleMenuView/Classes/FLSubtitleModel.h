//
//  FLSubtitleModel.h
//  DropDownMenuDemo
//
//  Created by liaoxf on 2018/4/16.
//  Copyright © 2018年 liaoxf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLSubtitleModel : NSObject

@property (copy, nonatomic) NSString *subtitle;
@property (copy, nonatomic) NSString *imageName;

- (instancetype)initWithSubtitle:(NSString *)subtitle
                       imageName:(NSString *)imageName;

+ (instancetype)modelWithSubtitle:(NSString *)subtitle
                        imageName:(NSString *)imageName;

@end
