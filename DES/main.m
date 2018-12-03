//
//  main.m
//  DES
//
//  Created by ifuwo on 2018/11/20.
//  Copyright © 2018 ifuwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DES.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *encryStr = [DES DESEncrypt:@"abcdef"];
        NSString *decryStr = [DES DESDecrypt:encryStr];
        NSLog(@"%@", decryStr);
    }
}
