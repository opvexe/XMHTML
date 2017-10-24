//
//  NSString+FriendExtenison.h
//  Friends
//
//  Created by TSM on 16/6/13.
//  Copyright © 2016年 shiqingming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (FriendExtenison)

/**
 Description

 @param font font description
 @param maxW maxW description
 @return return value description
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 Description

 @param font font description
 @return return value description
 */
- (CGSize)sizeWithFont:(UIFont *)font;


/**
 Description

 @param object object description
 @return return value description
 */
NSString *convertToString(id object);


/**
 Description

 @param fileName fileName description
 @return return value description
 */
NSString* getDocumentsFilePath(const NSString* fileName);

/**
 Description

 @param filePath filePath description
 @return return value description
 */
BOOL checkPathAndCreate(NSString *filePath);
/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
/**
 *
 *
 *  @return return value description
 */
- (NSString *)emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;

/**
 Description

 @param object object description
 @return return value description
 */
BOOL is_null(id object);

/**
 Description

 @param str str description
 @return return value description
 */
BOOL isEmpty(NSString* str);
/**
 *  MD5
 *
 *  @param input input description
 *
 *  @return return value description
 */
NSString* md5(NSString* input);
/**
 *
 *
 *  @param url url description
 *
 *  @return return value description
 */
NSString *urlEncodedString(NSString *url);

/**
 Description

 @param input input description
 @return return value description
 */
NSString* trimString (NSString* input);

/**
 *  日期格式
 *
 *  @param fromate 格式
 *  @param date    要格式的日期
 *
 *  @return 格式化后的字符串
 */
NSString * dateTransformString(NSString* fromate,NSDate*date);
/**
 *  longlong类型日期，转换为字符串
 *
 *  @param fromate  格式
 *  @param longdate 转换的类型，
 *
 *  @return 日期字符串
 */
NSString * longdateTransformString(NSString* fromate,long long longdate);


/**
 Description

 @param stringDate stringDate description
 @return return value description
 */
NSDate * stringFormateDate(NSString * stringDate);

/**
 *  计算日期与当前时间的差
 *
 *  @param theDate 要对比的日期
 *
 *  @return 刚刚、几分钟前、几小时前、几天前、日期
 */
NSString *intervalSinceNow(NSString *theDate);


NSString *intervalSinceSimpleNow(NSString *theDate);


/**
 *  获取日期的年
 *
 *  @param date 要获取的日期
 *
 *  @return 返回哪一年
 */
NSInteger getDataYear(NSDate *date);

/**
 *  获取日期的天
 *
 *  @param date 要获取的日期
 *
 *  @return 返回哪一天
 */
NSInteger getDataDay(NSDate *date);
/**
 *  判断是否是手机号码
 *
 *  @param mobile mobile description
 *
 *  @return return value description
 */
BOOL validateMobile(NSString* mobile);

/**
 *  验证密码规则
 *
 *  @param password password description
 *
 *  @return return value description
 */
BOOL validatePassword(NSString *password);

/**
 *  验证验证码 6位
 *
 *  @param code code description
 *
 *  @return return value description
 */
BOOL validateEcode(NSString* code);


/**
 Description

 @param params params description
 @return return value description
 */
NSString *stringFromJson(NSString* params);
/**
 *  计算文件大小 
 *
 *  @param contentLength contentLength description
 *
 *  @return return value description
 */
NSString *calculateFileSizeInUnit(unsigned long long contentLength);
/**
 *  136****8888
 *
 *  @param phoneNumber phoneNumber description
 *
 *  @return return value description
 */
NSString *stringFromPhoneNumberHidden(NSString *phoneNumber);


NSString *timestampConversion(NSString *time);

NSString *DistanceConversion(NSString *distance);

NSString *http_URLEncode(NSString *url);

/**
 *  URLDecodeString
 *
 *  @param encodedString encodedString description
 *
 *  @return return value description
 */
NSString *URLDecodeString(NSString*encodedString);


/**
 Description

 @param content content description
 @return return value description
 */
NSString *base64EncodeWith(NSString * content);

/**
 Description

 @param content content description
 @return return value description
 */
NSString *base64DecodeWith(NSString * content);

/**
 Description

 @param time time description
 @return return value description
 */
+ (NSString *)stringWithTime:(NSTimeInterval)time;


/**
 Description

 @param string string description
 @param myColor myColor description
 @param font font description
 @param originalString originalString description
 @param newString newString description
 @return return value description
 */
+(NSMutableAttributedString *)lineStyleSingleString:(NSString *)string Color:(UIColor *)myColor font:(UIFont *)font  withString:(NSString *)originalString newString:(NSString *)newString;

/**
 Description

 @param string string description
 @param font font description
 @param myColor myColor description
 @param originalString originalString description
 @return return value description
 */
+(NSMutableAttributedString *)getOtherColorString:(NSString *)string  font:(UIFont *)font Color:(UIColor *)myColor withString:(NSString *)originalString;
@end
