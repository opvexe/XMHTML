//
//  CommonTools.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#ifndef CommonTools_h
#define CommonTools_h

///MARK: 屏幕宽高
#define  X_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  X_ScreenHeight  [UIScreen mainScreen].bounds.size.height

///MARK: iphone X
#define  X_iPhoneX (X_ScreenWidth == 375.f && X_ScreenHeight == 812.f ? YES : NO)

///MARK: 状态栏高度
#define  X_StatusBarHeight      (X_iPhoneX ? 44.f : 20.f)
///MARK: 导航栏高度
#define  X_NavigationBarHeight  44.f

///MARK: 底部abbar 高度
#define  X_TabbarHeight         (X_iPhoneX ? (49.f+34.f) : 49.f)

///MARK: tabbar底部安全区域
#define  X_TabbarSafeBottomMargin         (X_iPhoneX ? 34.f : 0.f)

///MARK: 状态栏高度+导航栏高度
#define  X_StatusBarAndNavigationBarHeight  (X_iPhoneX ? 88.f : 64.f)

///MARK: 视图的安全区
#define X_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})


///MARK: APPDelegate Window
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
#define LAPPLICATION [UIApplication sharedApplication]
#define LAPPDELEGATE (AppDelegate *)[UIApplication sharedApplication].delegate


#endif /* CommonTools_h */
