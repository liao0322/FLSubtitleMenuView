//
//  NSString+DES.h
//  FengLei
//
//  Created by liaoxf on 2017/12/11.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

+ (NSString*)encrypt:(NSString*)plainText;
+ (NSString*)decrypt:(NSString*)encryptText;


@end
