//
//  UIFont+EXText.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (EXText)

/**
 * 粗体
 */
@property (nonatomic, readonly) BOOL bold;

/**
 * 斜体
 */
@property (nonatomic, readonly) BOOL italic;


/**
 * 字体
 */
@property (nonatomic, readonly) float fontSize;

+ (instancetype)xm_fontWithFontSize:(float)fontSize bold:(BOOL)bold italic:(BOOL)italic;

@end
