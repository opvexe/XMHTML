//
//  ColorDefines.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#ifndef ColorDefines_h
#define ColorDefines_h

// 字体
#define FontPingFangSC(Size) [UIFont fontWithName:@"PingFangSC-Regular" size:Size*HSYSCALWIDTH]

#define FontPingFangBoldSC(Size) [UIFont fontWithName:@"PingFangSC-Bold" size:Size*HSYSCALWIDTH]

#define FontPingFangLG(Size) [UIFont fontWithName:@"PingFangSC-Light" size:Size*HSYSCALWIDTH]

#define FontHelFont(Size) [UIFont fontWithName:@"Helvetica" size:Size*HSYSCALWIDTH]

#define FontNormal(Size) [UIFont systemFontOfSize:Size*HSYSCALWIDTH]

//颜色
#define  ColorRandom  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#define RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f                                                                                                       alpha:a]

#define RGB(r,g,b)                                                                                                                                                                        RGBA(r,g,b,1.0f)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//设备尺寸相关
#define HSYSCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define HSYSCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// 主要字体颜色
#define PriceTextColor UIColorFromRGB(0xff758c)

#define BaseContenTextColor UIColorFromRGB(0x323232)

#define TitleColor UIColorFromRGB(0x000000)

#define SubheadTitleColor UIColorFromRGB(0x909090)

#define BaseTitleColor UIColorFromRGB(0x323232)

//自定义颜色
#define  HSYColor323232     [UIColor colorWithHexString:@"#323232"]
#define  HSYColore1e1e1     [UIColor colorWithHexString:@"#e1e1e1"]
#define  HSYColoreeeeee     [UIColor colorWithHexString:@"#eeeeee"]
#define  HSYColor646464     [UIColor colorWithHexString:@"#646464"]
#define  HSYColor909090     [UIColor colorWithHexString:@"#909090"]
#define  HSYColorf4f2ef     [UIColor colorWithHexString:@"#f4f2ef"]
#define  HSYColor000000     [UIColor colorWithHexString:@"#000000"]
#define  HSYColorffffff     [UIColor colorWithHexString:@"#ffffff"]
#define  HSYColorf5f5f5     [UIColor colorWithHexString:@"#f5f5f5"]
#define  HSYColor444444     [UIColor colorWithHexString:@"#444444"]
#define  HSYColorfafafa     [UIColor colorWithHexString:@"#fafafa"]
#define  HSYColorf75555     [UIColor colorWithHexString:@"#f75555"]
#define  HSYColorfcfbf9     [UIColor colorWithHexString:@"#fcfbf9"]
#define  HSYColorababab     [UIColor colorWithHexString:@"#ababab"]
#define  HSYColorf1f1f1     [UIColor colorWithHexString:@"#f1f1f1"]
#define  HSYColorfcfafb     [UIColor colorWithHexString:@"#fcfafb"]
#define  HSYColorea68a2     [UIColor colorWithHexString:@"#ff758c"]
#define  HSYColor00a0e9     [UIColor colorWithHexString:@"#00A0E9"]
#define  HSYColorD6D7DC     [UIColor colorWithHexString:@"#D6D7DC"]
#define  HSYColorD8D8D8     [UIColor colorWithHexString:@"#D8D8D8"]
#define  HSYColorf0f0f0     [UIColor colorWithHexString:@"#f0f0f0"]
#define  ColorRGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  HSYBGColor255    ColorRGBA(255, 255, 255, 1.0)
#define  HSYBGColor250    ColorRGBA(250, 250, 250, 1.0)
#define  HSYColor246106159 ColorRGBA(246, 106, 159, 1.0)
#define  HSYBGColor135    ColorRGBA(135, 135, 135, 1.0)
#define  HSYBGColor237 ColorRGBA(237, 237, 237, 1.0)
#define  HSYUserBGColor255    ColorRGBA(255, 255, 255, 1.0)
#define  HSYUserBGColor250    ColorRGBA(250, 250, 250, 1.0)
#define  HSYUserColor246106159 ColorRGBA(246, 106, 159, 1.0)

#endif /* ColorDefines_h */
