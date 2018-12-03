//
//  DES.m
//  DES
//
//  Created by ifuwo on 2018/11/20.
//  Copyright © 2018 ifuwo. All rights reserved.
//

#import "DES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "MyGTMBase64.h"
#import "NSData+Compression.h"

#define KEY @"f056380ed970b169"
#define IV @"912467427a354o9x"

@implementation DES

// DES加密
+(NSString*)DESEncrypt:(NSString*)str
{
    NSString *result = @"";
    NSData *tempSrc = [str dataUsingEncoding:NSUTF8StringEncoding];
    tempSrc = [tempSrc zlibDeflate];
    NSUInteger dataLength = [tempSrc length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [KEY UTF8String], kCCBlockSizeDES,
                                          [IV UTF8String],
                                          [tempSrc bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess)
    {
        NSData *temp =[NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        temp = [MyGTMBase64 encodeData:temp];
        result = [[NSString alloc] initWithData:temp encoding:NSASCIIStringEncoding];
    }
    
    if(buffer == NULL || buffer == nil)
    {
        free(buffer);
    }
    
    return result;
}

// DES解密
+(NSString*)DESDecrypt:(NSString*)str
{
    NSString *result = @"";
    NSData *tempSrc = [MyGTMBase64 decodeString:str];
    NSUInteger dataLength = [tempSrc length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [KEY UTF8String], kCCBlockSizeDES,
                                          [IV UTF8String],
                                          [tempSrc bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess)
    {
        NSData *temp =[NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        temp = [temp zlibInflate];
        result = [[NSString alloc] initWithData:temp encoding:NSUTF8StringEncoding];
    }
    
    if(buffer == NULL || buffer == nil)
    {
        free(buffer);
    }
    return result;
}

@end
