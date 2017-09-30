//
//  UIBarButtonItem+Category.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action text:(NSString *)text;

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action URLimage:(NSString *)imageUrl;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image;
@end
