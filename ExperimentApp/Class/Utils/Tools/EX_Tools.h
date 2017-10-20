//
//  EX_Tools.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EX_Tools : NSObject


+(CGFloat)getHeightContain:(NSString *)string font:(UIFont *)font Width:(CGFloat) width;

+(CGFloat)getWidthContain:(NSString *)string font:(UIFont *)font Height:(CGFloat) height;
@end
