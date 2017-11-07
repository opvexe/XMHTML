//
//  MyKit.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#ifndef MyKit_h
#define MyKit_h


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "AppDelegate.h"

//BaseView
#import "EX_BaseTbaleViewCell.h"
#import "EX_BaseCollectionViewCell.h"
#import "EX_BaseViewController.h"
#import "EX_BaseView.h"
#import "EX_BaseView.h"
#import "EX_BaseModel.h"
#import "EXShopInfoModel.h"

///MARK: 扩展
#import "UIView+WY_Extenison.h"
#import "UIImage+Category.h"
#import "UIBarButtonItem+Category.h"
#import "NSString+FriendExtenison.h"
#import "UILabel+ZDKExtent.h"
#import "UIColor+Category.h"
#import "RewriteButton.h"
#import "UIFont+EXText.h"

///MARK: 宏定义
#import "CommonTools.h"
#import "ColorDefines.h"
#import "EXStyleSettings.h"     ///文字格式

//工具
#import "EXSeviceRequestManger.h"
#import "EXCommonTools.h"

//第三方
#import <Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <MCDownloader.h>

#endif /* MyKit_h */
