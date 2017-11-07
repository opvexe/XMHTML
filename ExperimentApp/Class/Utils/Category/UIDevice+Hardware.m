//
//  UIDevice+Hardware.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/6.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//
#include <sys/sysctl.h>
#import <SSKeychain.h>
#import "UIDevice+Hardware.h"


@interface UIDevice (Hardward)

//- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

@end
@implementation UIDevice (Hardware)

//- (NSString *)getSysInfoByName:(char *)typeSpecifier
//{
//    size_t size;
//    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
//
//    char *answer = malloc(size);
//    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
//
//    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
//
//    free(answer);
//    return results;
//}
//
//- (NSString *)modelIdentifier
//{
//    return [self getSysInfoByName:"hw.machine"];
//}
//
//-(NSString *)userAgentName{
//    return [self modelIdentifier];
//}
//
//- (NSString *)modelName
//{
//    return [self modelNameForModelIdentifier:[self modelIdentifier]];
//}
//
//- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
//{
//    // iPhone http://theiphonewiki.com/wiki/IPhone
//
//    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
//    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
//    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
//    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
//    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
//    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
//    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
//    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
//    if ([modelIdentifier isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
//    if ([modelIdentifier isEqualToString:@"iPhone9,1"]||[modelIdentifier isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
//    if ([modelIdentifier isEqualToString:@"iPhone9,2"]||[modelIdentifier isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
//
//
//    if ([modelIdentifier isEqualToString:@"iPhone10,1"]||[modelIdentifier isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
//
//    if ([modelIdentifier isEqualToString:@"iPhone10,2"]||[modelIdentifier isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
//
//    if ([modelIdentifier isEqualToString:@"iPhone10,3"]||[modelIdentifier isEqualToString:@"iPhone10,6"])    return @"iPhone X";
//    // https://www.theiphonewiki.com/wiki/List_of_iPhones  // 相关设备
//
//    // iPad http://theiphonewiki.com/wiki/IPad
//
//    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
//    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
//    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
//    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
//
//    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
//
//    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
//
//    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
//    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
//    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (WiFi)";
//    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
//    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
//    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3";
//    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3";
//    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
//    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad air 2";
//    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad air 2";
//
//    if ([modelIdentifier isEqualToString:@"iPad6,7"]||[modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro";
//
//    if ([modelIdentifier isEqualToString:@"iPad6,3"]||[modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro (9.7-inch)";
//
//    if ([modelIdentifier isEqualToString:@"iPad6,11"]||[modelIdentifier isEqualToString:@"iPad6,12"])      return @"iPad (5th generation)";
//
//    if ([modelIdentifier isEqualToString:@"iPad7,1"]||[modelIdentifier isEqualToString:@"iPad7,2"])      return @"iPad Pro (12.9-inch, 2nd generation)";
//
//    if ([modelIdentifier isEqualToString:@"iPad7,3"]||[modelIdentifier isEqualToString:@"iPad7,4"])      return @"iPad Pro (10.5-inch)";
//
//    // iPod http://theiphonewiki.com/wiki/IPod
//
//    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
//    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
//    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
//    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
//    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
//
//    // Simulator
//    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
//    {
//        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
//
//        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
//    }
//
//    return modelIdentifier;
//}
//
//- (UIDeviceFamily) deviceFamily
//{
//    NSString *modelIdentifier = [self modelIdentifier];
//    if ([modelIdentifier hasPrefix:@"iPhone"]) return UIDeviceFamilyiPhone;
//    if ([modelIdentifier hasPrefix:@"iPod"]) return UIDeviceFamilyiPod;
//    if ([modelIdentifier hasPrefix:@"iPad"]) return UIDeviceFamilyiPad;
//    return UIDeviceFamilyUnknown;
//}
//
//-(NSString *) getIOSUUID
//{
//    NSString *retrieveuuid = [SSKeychain passwordForService:@"www.91shiwan.com" account:@"uuid"];
//    if ( retrieveuuid == nil || [retrieveuuid isEqualToString:@""])
//    {
//        CFUUIDRef uuid = CFUUIDCreate(NULL);
//        assert(uuid != NULL);
//        CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
//        retrieveuuid = [NSString stringWithFormat:@"%@", uuidStr];
//        [SSKeychain setPassword: retrieveuuid forService:@"www.91shiwan.com"account:@"uuid"];
//    }
//
//    if(retrieveuuid==nil){
//        return @"null";
//    }
//    return retrieveuuid;
//}
@end
