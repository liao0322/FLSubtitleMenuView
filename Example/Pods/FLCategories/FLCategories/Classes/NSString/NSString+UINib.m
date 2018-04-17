//
//  NSString+UINib.m
//  FLCategories
//
//  Created by liaoxf on 2018/3/22.
//

#import "NSString+UINib.h"

@implementation NSString (UINib)

+ (instancetype)nibNameWithTargetClass:(Class)targetClass {
    NSBundle *currentBundle = [NSBundle bundleForClass:targetClass];
    NSString *bundleName = currentBundle.infoDictionary[@"CFBundleName"];
    bundleName = [NSString stringWithFormat:@"%@.bundle", bundleName];
    NSString *nibName = [NSString stringWithFormat:@"%@/%@", bundleName, NSStringFromClass(targetClass)];
    return nibName;
}

@end
