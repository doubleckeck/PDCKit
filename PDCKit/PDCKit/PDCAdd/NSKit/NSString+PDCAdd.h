//
//  NSString+PDCAdd.h
//  NSString_PDC
//
//  Created by KH on 16/7/7.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PDCAdd)

-(NSString *)md5Lower;  //lower letter

-(NSString *)md5;

/**
 *  SHA需要编译器支持c99
 */
-(NSString *)SHA1;

-(NSString *)SHA224;

-(NSString *)SHA256;

-(NSString *)SHA384;

-(NSString *)SHA512;

//Hmac
-(NSString *)HmacMd5WithKey:(NSString *)key;

-(NSString *)HmacSHA1WithKey:(NSString *)key;

-(NSString *)HmacSHA224WithKey:(NSString *)key;

-(NSString *)HmacSHA256WithKey:(NSString *)key;

-(NSString *)HmacSHA384WithKey:(NSString *)key;

-(NSString *)HmacSHA512WithKey:(NSString *)key;
@end
