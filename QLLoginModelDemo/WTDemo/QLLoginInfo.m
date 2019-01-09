//
//  QLLoginInfo.m
//  QLBusiness
//
//  Created by jienliang on 14-4-28.
//  Copyright (c) 2014年 jienliang. All rights reserved.
//

#import "QLLoginInfo.h"
#import "WTBaseCore.h"

@implementation QLLoginInfo
+ (QLLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo{
    QLLoginInfo *loginInfo = [[QLLoginInfo alloc] init];
    loginInfo.phone = [WTUtil strRelay:dInfo[@"phone"]];
    loginInfo.name = [WTUtil strRelay:dInfo[@"name"]];
    return loginInfo;
}

+ (NSString *)getUserInfoFile {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:@"user.txt"];
    return path;
}

+ (void)writeUserInfo:(NSDictionary *)dic {
    NSString *fileName = [QLLoginInfo getUserInfoFile];
    if ([WTFile fileExistAtPath:fileName]) {
        [WTFile fileDel:fileName];
    }
    dic = [self processDictionaryIsNSNull:dic];
    NSString *str = [WTJsonUtil jsonStringWithObject:dic];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:fileName atomically:YES];
}

+ (NSDictionary *)getUserDic {
    NSString *fileName = [QLLoginInfo getUserInfoFile];
    NSString *version = [WTUtil getAppVersion];
    if ([WTFile fileExistAtPath:fileName]) {
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        if (data) {
            NSDictionary *d = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSMutableDictionary *dic = nil;
            if (d!=nil) {
                dic = [[NSMutableDictionary alloc] init];
                [dic addEntriesFromDictionary:d];
                if (![[WTUtil strRelay:dic[@"appVersion"]] isEqualToString:version]) {
                    return nil;
                }
            }
            return dic;
        }
    }
    return nil;
}

+ (QLLoginInfo *)getUserInfo {
    NSDictionary *dic = [QLLoginInfo getUserDic];
    NSLog(@"%@",dic);
    if (dic==nil) {
        return nil;
    }
    QLLoginInfo *loginInfo = [QLLoginInfo loginInfoWithDict:dic];
    return loginInfo;
}

+ (BOOL)isLogin {
//    if ([WSLUtil appDelegate].loginInfo==nil||
//        [WSLUtil strNilOrEmpty:[WSLUtil appDelegate].loginInfo.userId]) {
//        return NO;
//    }
//    NSString *str = [WTUtil getAppVersion];
//    if (![[WTUtil strRelay:[WSLUtil appDelegate].loginInfo.appVersion] isEqualToString:str]) {
//        return NO;
//    }
    return YES;
}

+ (id) processDictionaryIsNSNull:(id)obj {
    const NSString *blank = @"";
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dt = [(NSMutableDictionary*)obj mutableCopy];
        for(NSString *key in [dt allKeys]) {
            id object = [dt objectForKey:key];
            if([object isKindOfClass:[NSNull class]]) {
                [dt setObject:blank
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSString class]]){
                NSString *strobj = (NSString*)object;
                if ([strobj isEqualToString:@"<null>"]) {
                    [dt setObject:blank
                           forKey:key];
                }
            }
            else if ([object isKindOfClass:[NSNumber class]]){
                NSString *strobj = (NSString*)object;
                [dt setObject:[NSString stringWithFormat:@"%@",strobj]
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSArray class]]){
                NSArray *da = (NSArray*)object;
                da = [self processDictionaryIsNSNull:da];
                [dt setObject:da
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSDictionary class]]){
                NSDictionary *ddc = (NSDictionary*)object;
                ddc = [self processDictionaryIsNSNull:ddc];
                [dt setObject:ddc forKey:key];
            }
        }
        return [dt copy];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *da = [(NSMutableArray*)obj mutableCopy];
        for (int i=0; i<[da count]; i++) {
            NSDictionary *dc = [obj objectAtIndex:i];
            dc = [self processDictionaryIsNSNull:dc];
            [da replaceObjectAtIndex:i withObject:dc];
        }
        return [da copy];
    }
    else{
        return obj;
    }
}

@end
