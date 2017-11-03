//
//  EXTextStyle.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,EXTextStyleType ) {
    EXTextStyleFormatNormal = 0,            //普通
    EXTextStyleFormatTitleSmall,            //小标题
    EXTextStyleFormatTitleMedium,           //中标题
    EXTextStyleFormatTitleLarge,            //大标题
};

@interface EXTextStyle : NSObject

/**
 * 粗体
 */
@property (nonatomic, assign) BOOL bold;

/**
 * 斜体
 */
@property (nonatomic, assign) BOOL italic;

/**
 *下划线
 */
@property (nonatomic, assign) BOOL underline;

/**
 * 字体大小
 */
@property (nonatomic, assign) float fontSize;

/**
 * 标题类型
 */
@property (nonatomic,assign) EXTextStyleType type;

/**
 * 字体类型
 */
@property(nonatomic,strong)UIFont  *font;
/**
 * 文本颜色
 */
@property(nonatomic,strong)UIColor *textColor;

+ (instancetype)textStyleWithType:(EXTextStyleType)type;
@end
