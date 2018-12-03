//
//  DES.h
//  DES
//
//  Created by ifuwo on 2018/11/20.
//  Copyright © 2018 ifuwo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DES : NSObject

/// DES加密
+(NSString*)DESEncrypt:(NSString*)str;

/// DES解密
+(NSString*)DESDecrypt:(NSString*)str;

@end

NS_ASSUME_NONNULL_END
