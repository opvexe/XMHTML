//
//  UIColor+Category.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/*
 *将十六进制的颜色字符串 转换成 uicolor
 *  C99
 */
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
@end
