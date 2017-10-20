//
//  UIBarButtonItem+Category.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

/**
 <#Description#>

 @param target <#target description#>
 @param action <#action description#>
 @param image <#image description#>
 @param highImage <#highImage description#>
 @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

/**
 <#Description#>

 @param target <#target description#>
 @param action <#action description#>
 @param text <#text description#>
 @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action text:(NSString *)text;

/**
 <#Description#>

 @param target <#target description#>
 @param action <#action description#>
 @param imageUrl <#imageUrl description#>
 @return <#return value description#>
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action URLimage:(NSString *)imageUrl;

/**
 <#Description#>

 @param target <#target description#>
 @param action <#action description#>
 @param image <#image description#>
 @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image;
@end
