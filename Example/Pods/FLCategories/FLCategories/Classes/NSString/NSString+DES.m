//
//  NSString+DES.m
//  FengLei
//
//  Created by liaoxf on 2017/12/11.
//  Copyright © 2017年 com.mlj.FengLei. All rights reserved.
//

#import "NSString+DES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

#define gkey @"Feng@Lei"

@implementation NSString (DES)

+ (NSString*)encrypt:(NSString*)plainText {
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];  //注意空间大小
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [gkey UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,  //注意空间大小
                                          &numBytesEncrypted);
    plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
        
    }else{
        //        NSLog(@"DES加密失败");
    }
    return plainText;
    
}

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText {
    
    // 利用 GTMBase64 解碼 Base64 字串
    NSData *cipherData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    unsigned char buffer[1024];  //注意空间大小
    memset(buffer, 0, sizeof(char));  
    size_t numBytesDecrypted = 0;  
    
    // IV 偏移量不需使用  
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,  
                                          kCCAlgorithmDES,  
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,  
                                          [gkey UTF8String],
                                          kCCKeySizeDES,  
                                          nil,  
                                          [cipherData bytes],  
                                          [cipherData length],  
                                          buffer,  
                                          1024,  //注意空间大小
                                          &numBytesDecrypted);  
    NSString* plainText = nil;  
    if (cryptStatus == kCCSuccess) {  
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];  
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }  
    return plainText;
}


@end
