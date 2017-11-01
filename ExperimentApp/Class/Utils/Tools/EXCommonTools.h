//
//  EX_Tools.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EXCommonTools : NSObject
/**
 * 计算文本高度

 @param string string description
 @param font font description
 @param width width description
 @return return value description
 */
+(CGFloat)getHeightContain:(NSString *)string font:(UIFont *)font Width:(CGFloat) width;


/**
 * 计算文本宽度

 @param string string description
 @param font font description
 @param height height description
 @return return value description   
 */
+(CGFloat)getWidthContain:(NSString *)string font:(UIFont *)font Height:(CGFloat) height;

@end
