//
//  NSString+FriendExtenison.m
//  Friends
//
//  Created by TSM on 16/6/13.
//  Copyright © 2016年 shiqingming. All rights reserved.
//

#import "NSString+FriendExtenison.h"
#import <CommonCrypto/CommonDigest.h>
#define EmojiCodeToSymbol(c) ((((0x808080F0 | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)

@implementation NSString (FriendExtenison)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}
- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}
NSString *convertToString(id object){
    if ([object isKindOfClass:[NSNull class]]) {
        return @"";
    }else if(!object){
        return @"";
    }else if([object isKindOfClass:[NSNumber class]]) {
        return [object stringValue];
    }else{
        return [NSString stringWithFormat:@"%@",object];
    }
}
/**
 *   获取文件路径
 *
 *  @param fileName
 *
 *  @return
 */
NSString* getDocumentsFilePath(const NSString* fileName) {
    
    NSString* documenPath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"];
    
    return [documenPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@", fileName]];
}
/**
 *  判断文件是否存储
 *
 *  @param filePath
 *
 *  @return
 */

BOOL checkPathAndCreate(NSString *filePath){
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath]){
        return YES;
    }else{
        return [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

+ (NSString *)emojiWithIntCode:(int)intCode {
    int symbol = EmojiCodeToSymbol(intCode);
    NSString *string = [[NSString alloc] initWithBytes:&symbol length:sizeof(symbol) encoding:NSUTF8StringEncoding];
    if (string == nil) { // 新版Emoji
        string = [NSString stringWithFormat:@"%C", (unichar)intCode];
    }
    return string;
}

- (NSString *)emoji
{
    return [NSString emojiWithStringCode:self];
}

+ (NSString *)emojiWithStringCode:(NSString *)stringCode
{
    char *charCode = (char *)stringCode.UTF8String;
    int intCode = strtol(charCode, NULL, 16);
    return [self emojiWithIntCode:intCode];
}

// 判断是否是 emoji表情
- (BOOL)isEmoji
{
    BOOL returnValue = NO;
    
    const unichar hs = [self characterAtIndex:0];
    // surrogate pair
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (self.length > 1) {
            const unichar ls = [self characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                returnValue = YES;
            }
        }
    } else if (self.length > 1) {
        const unichar ls = [self characterAtIndex:1];
        if (ls == 0x20e3) {
            returnValue = YES;
        }
    } else {
        // non surrogate
        if (0x2100 <= hs && hs <= 0x27ff) {
            returnValue = YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            returnValue = YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            returnValue = YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            returnValue = YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            returnValue = YES;
        }
    }
    
    return returnValue;
}
/**
 *
 *
 *  @param object
 *
 *  @return
 */
BOOL is_null(id object) {
    return (nil == object || [@"" isEqual:object] || [object isKindOfClass:[NSNull class]]);
}

NSString *urlEncodedString(NSString *url){
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)url,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}
NSString* md5(NSString* input)
{
    if(isEmpty(input)){
        return @"";
    }
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}
NSString* trimString (NSString* input) {
    NSMutableString *mStr = [input mutableCopy];
    CFStringTrimWhitespace((CFMutableStringRef)mStr);
    NSString *result = [mStr copy];
    return result;
}

BOOL isEmpty(NSString* str) {
    
    if (is_null(str)) {
        return YES;
    }
    
    if([str isKindOfClass:[NSString class]]){
        return [trimString(str) length] <= 0;
    }
    
    return NO;
}
NSString * dateTransformString(NSString* fromate,NSDate*date){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fromate];
    //    NSString * dateString = [[NSString alloc] init];
    NSString * dateString = [dateFormatter stringForObjectValue:date];
    return dateString;
}

NSString * longdateTransformString(NSString* fromate,long long longdate){
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:longdate/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fromate];
    //    NSString * dateString = [[NSString alloc] init];
    NSString * dateString = [dateFormatter stringForObjectValue:date];
    return dateString;
}
NSDate * stringFormateDate(NSString * stringDate){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
    NSDate *dateFromString = [[NSDate alloc] init];
    // voila!
    dateFromString = [dateFormatter dateFromString:stringDate];
    return dateFromString;
}

NSString *intervalSinceNow(NSString *theDate){
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    theDate=[timeArray objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        if([timeString isEqualToString:@"0"]){
            timeString=[NSString stringWithFormat:@"刚刚"];
        }else{
            timeString=[NSString stringWithFormat:@"%@%@", timeString,@"分钟前"];
        }
        
    }else if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@%@", timeString,@"小时前"];
    }else if (cha/86400>1 && cha/86400<=7)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@%@", timeString,@"天前"];
    }else if(getDataYear(dat)- getDataYear(d)==0){
        // 同一年
        //        timeString=dateTransformStringAsYMDByFormate(d,@"MM月dd日 HH:mm");
        timeString=dateTransformString(@"MM-dd HH:mm",d);
    }else{
        timeString=dateTransformString(@"yyyy-MM-dd",d);//[NSString stringWithFormat:@"%@",theDate];
    }
    return timeString;
}
/**
 解析听写json格式的数据
 params例如：
 {"sn":1,"ls":true,"bg":0,"ed":0,"ws":[{"bg":0,"cw":[{"w":"白日","sc":0}]},{"bg":0,"cw":[{"w":"依山","sc":0}]},{"bg":0,"cw":[{"w":"尽","sc":0}]},{"bg":0,"cw":[{"w":"黄河入海流","sc":0}]},{"bg":0,"cw":[{"w":"。","sc":0}]}]}
 ****/
NSString *stringFromJson(NSString* params)
{
    if (params == NULL) {
        return nil;
    }
    
    NSMutableString *tempStr = [[NSMutableString alloc] init];
    NSDictionary *resultDic  = [NSJSONSerialization JSONObjectWithData:    //返回的格式必须为utf8的,否则发生未知错误
                                [params dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    
    if (resultDic!= nil) {
        NSArray *wordArray = [resultDic objectForKey:@"ws"];
        
        for (int i = 0; i < [wordArray count]; i++) {
            NSDictionary *wsDic = [wordArray objectAtIndex: i];
            NSArray *cwArray = [wsDic objectForKey:@"cw"];
            
            for (int j = 0; j < [cwArray count]; j++) {
                NSDictionary *wDic = [cwArray objectAtIndex:j];
                NSString *str = [wDic objectForKey:@"w"];
                [tempStr appendString: str];
            }
        }
    }
    return tempStr;
}



NSString *intervalSinceSimpleNow(NSString *theDate){
    if(is_null(theDate)){
        //        return @"";
        theDate=dateTransformString(@"yyyy-MM-dd HH:mm:ss", [NSDate date]);
    }
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    theDate=[timeArray objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString=dateTransformString(@"HH:mm",d);
    }else if (cha/3600>1&&cha/86400<1) {
        if(getDataDay(dat) == getDataDay(d)){
            timeString=dateTransformString(@"HH:mm",d);
        }else{
            timeString=dateTransformString(@"昨天 HH:mm",d);
        }
    }else if (cha/86400>1 && cha/86400<=7)
    {
        timeString=dateTransformString(@"MM-dd",d);
    }else if(getDataYear(dat)- getDataYear(d)==0){
        // 同一年
        timeString=dateTransformString(@"MM-dd",d);
    }else{
        timeString=dateTransformString(@"MM-dd",d);
    }
    return timeString;
}
#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]
NSInteger getDataYear(NSDate *date){
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
    return components.year;
}
NSInteger getDataDay(NSDate *date){
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
    return components.day;
}
//是否是真正的手机号
BOOL validateMobile(NSString* mobile) {
    //    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[0,0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
BOOL validatePassword(NSString *password){
        NSString *regex =@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:password];
}

//是否是验证码
BOOL validateEcode(NSString* code) {
    
    NSString *phoneRegex = @"^\\d{6}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:code];
}
/**
 *  计算大小
 *
 *  @param contentLength <#contentLength description#>
 *
 *  @return <#return value description#>
 */
NSString * calculateFileSizeInUnit(unsigned long long contentLength)

{
    if(contentLength >= pow(1024, 3))
        return [NSString stringWithFormat:@"%2.fGB",(float) (contentLength / (float)pow(1024, 3))];
    else if(contentLength >= pow(1024, 2))
        return [NSString stringWithFormat:@"%2.f MB",(float) (contentLength / (float)pow(1024, 2))];
    else if(contentLength >= 1024)
        return [NSString stringWithFormat:@"%2.f KB",(float) (contentLength / (float)1024)];
    else
        return [NSString stringWithFormat:@"%2.f Bytes",(float) (contentLength)];
}

/**
 *  <#Description#>
 *
 *  @param phoneNumber <#phoneNumber description#>
 *
 *  @return <#return value description#>
 */
NSString *stringFromPhoneNumberHidden(NSString *phoneNumber){
    
    if (phoneNumber.length==0) {
        
        return  nil;
    }
    return  [phoneNumber stringByReplacingOccurrencesOfString:[phoneNumber substringWithRange:NSMakeRange(3, 4)] withString:@"****"];
}

NSString *timestampConversion(NSString *time){

    if (time.length==0) {

        return  nil;
    }

    CGFloat cha =[time floatValue];

    NSString *timeString =@"";

    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%.f", cha/60.0];
        timeString=[NSString stringWithFormat:@"%@%@", timeString,@"分钟"];

    }else if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%.f", cha/3600];
        timeString=[NSString stringWithFormat:@"%@%@", timeString,@"小时"];
    }else{
         timeString=[NSString stringWithFormat:@"%f%@", cha,@"秒"];
    }
    return timeString;
}

NSString *DistanceConversion(NSString *distance){

    if (distance.length==0) {

        return  nil;
    }

    CGFloat cha =[distance floatValue];

    NSString *distanceString =@"";

     if(cha /1000>1){
        distanceString = [NSString stringWithFormat:@"%.2f", cha/1000.0];
        distanceString=[NSString stringWithFormat:@"%@%@", distanceString,@"公里"];
     }else{
         distanceString=[NSString stringWithFormat:@"%.3f%@", cha,@"米"];
     }
    return distanceString;


}
NSString *http_URLEncode(NSString *url)
{

    NSString *newString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)url,NULL,CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));

    if (newString) {

        return newString;
    }

    return url;

}

NSString *URLDecodeString(NSString*encodedString)

{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];

    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

/**
 <#Description#>

 @param url <#url description#>
 @return <#return value description#>
 */
NSString *URLEncodeUsingWithString(NSString *url){
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)url,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

NSString *base64EncodeWith(NSString * content){

    NSData *dataTake2 =
    [content dataUsingEncoding:NSUTF8StringEncoding];

    NSData *base64Data = [dataTake2 base64EncodedDataWithOptions:0];

    return [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
}

NSString *base64DecodeWith(NSString * content){

    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:content options:0];
    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    return decodeStr;
}

+ (NSString *)stringWithTime:(NSTimeInterval)time{
    NSInteger min = time / 60;
    NSInteger second = (NSInteger)time % 60;

    return [NSString stringWithFormat:@"%02ld:%02ld", min, second];
    
}


@end
