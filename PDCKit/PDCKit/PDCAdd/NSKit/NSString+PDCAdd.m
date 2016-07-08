//
//  NSString+PDCAdd.m
//  NSString_PDC
//
//  Created by KH on 16/7/7.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "NSString+PDCAdd.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (PDCAdd)

-(NSString *)pr_md5ByLower:(BOOL )lower
{
    const char *str = [self UTF8String];
    unsigned char md[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)self.length, md);
    NSMutableString *result = [NSMutableString string];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        if (lower)
        {
            [result appendFormat:@"%02x", md[i]];
        }
        else
        {
            [result appendFormat:@"%02X", md[i]];
        }
    }
    return [result copy];
}

-(NSString *)md5Lower
{
    return [self pr_md5ByLower:YES];
}

-(NSString *)md5
{
    return [self pr_md5ByLower:NO];
}


-(NSString *)SHA1
{
    return [self SHAByType:CC_SHA1_DIGEST_LENGTH];
}

-(NSString *)SHA224
{
    return [self SHAByType:CC_SHA224_DIGEST_LENGTH];
}

-(NSString *)SHA256
{
    return [self SHAByType:CC_SHA256_DIGEST_LENGTH];
}

-(NSString *)SHA384
{
    return [self SHAByType:CC_SHA384_DIGEST_LENGTH];
}

-(NSString *)SHA512
{
    return [self SHAByType:CC_SHA512_DIGEST_LENGTH];
}

-(NSString *)SHAByType:(NSInteger )type
{
    NSMutableString *result = [NSMutableString string];
    const char *str = [self UTF8String];
    unsigned char md[type];
    
    switch (type) {
        case CC_SHA1_DIGEST_LENGTH:
            CC_SHA1(str, (CC_LONG)self.length, md);
            break;
        case CC_SHA224_DIGEST_LENGTH:
            CC_SHA224(str, (CC_LONG)self.length, md);
            break;
        case CC_SHA256_DIGEST_LENGTH:
            CC_SHA256(str, (CC_LONG)self.length, md);
            break;
        case CC_SHA384_DIGEST_LENGTH:
            CC_SHA384(str, (CC_LONG)self.length, md);
            break;
        case CC_SHA512_DIGEST_LENGTH:
            CC_SHA512(str, (CC_LONG)self.length, md);
            break;
        default:
            break;
    }
    for(int i = 0; i < type; i++)
        [result appendFormat:@"%02X", md[i]];
    return [result copy];
}


-(NSString *)HmacMd5WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgMD5 size:CC_MD5_DIGEST_LENGTH];
}

-(NSString *)HmacSHA1WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgSHA1 size:CC_SHA1_DIGEST_LENGTH];
}

-(NSString *)HmacSHA224WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgSHA224 size:CC_SHA224_DIGEST_LENGTH];
}

-(NSString *)HmacSHA256WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgSHA256 size:CC_SHA256_DIGEST_LENGTH];
}

-(NSString *)HmacSHA384WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgSHA384 size:CC_SHA384_DIGEST_LENGTH];
}
-(NSString *)HmacSHA512WithKey:(NSString *)key
{
    return [self HmacWithKey:key type:kCCHmacAlgSHA512 size:CC_SHA512_DIGEST_LENGTH];
}

-(NSString *)HmacWithKey:(NSString *)key type:(CCHmacAlgorithm )type size:(size_t )size
{
    NSMutableString *result = [NSMutableString string];
    unsigned char md[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    CCHmac(type,cKey,key.length,data.bytes,data.length,md);
    for(int i = 0; i < size; i++)
        [result appendFormat:@"%02X", md[i]];
    return [result copy];
}
@end
