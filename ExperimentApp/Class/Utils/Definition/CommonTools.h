//
//  CommonTools.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#ifndef CommonTools_h
#define CommonTools_h

//消除黄色警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

// 格式化字符串
#define FormatString(string, args...)       [NSString stringWithFormat:string, args]

#define URLFromString(str)                      [NSURL URLWithString:str]

#define UTF8Data(str) [str dataUsingEncoding:NSUTF8StringEncoding]

//防止循环引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define WYSTRONG(strongSelf) __strong typeof(weakSelf) strongSelf = weakSelf;

// iphone x 适配

#define iOS7                                ((floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)? NO:YES)

#define HSYSCALWIDTH (HSYSCREEN_WIDTH/375.0)

#define HSYSCALHEIGHT (HSYSCREEN_HEIGHT/667.0)

#define StatusBar_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

#define HSYSCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

#define HSYSCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width

#define  HS_iPhoneX (HSYSCREEN_WIDTH == 375.f && HSYSCREEN_HEIGHT == 812.f ? YES : NO)

#define  HS_TabbarHeight         (HS_iPhoneX ? (49.f+34.f) : 49.f)

#define  HS_TabbarSafeBottomMargin         (HS_iPhoneX ? 34.f : 0.f)

#define NavBarHeight                        (iOS7 ? (HS_iPhoneX ? 88.f : 64.f) : 44.0)

#define HS_iPhoneXStatusBarHeight                      (HS_iPhoneX ? 44.f : 0)

#define StatusBarHeight                     (iOS7 ? (HS_iPhoneX ? 44.f : 20.f) : 0.0)

#define Number(num)                      (num*HSYSCALWIDTH)

#define NumberHeight(num)                      (num*HSYSCALHEIGHT)

#define AutomaticallyAdjustsScrollViewInsetsNO(view) if (@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;}else{self.automaticallyAdjustsScrollViewInsets = NO;}

#define HS_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

// 工具
#define  HSYFont(font)  [UIFont systemFontOfSize:font]

#define  HSYImage(imageName)  [UIImage imageNamed:imageName]

#define  HSYMainBoundle ([NSBundle mainBundle])

#define  HSYCOLOR(color) [UIColor colorWithHexString:color]

//iphone 类型
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


//APPDelegate
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define KEY_WINDOW [UIApplication sharedApplication].keyWindow

#define LAPPLICATION [UIApplication sharedApplication]

#define LAPPDELEGATE (AppDelegate *)[UIApplication sharedApplication].delegate



#endif /* CommonTools_h */
