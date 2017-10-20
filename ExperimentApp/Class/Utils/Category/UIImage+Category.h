//
//  UIImage+Category.h
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
/**
 *  将颜色转换成图片
 */
+(nullable UIImage *) createImageWithColor:(nullable UIColor*) color;

+(nullable UIImage *)imageBySoucreImage:(nullable UIImage *)sourceImage ScalingAndCroppingForSize:(CGSize)targetSize;
/**
 *  图片拉伸,适应空间,不改变像素
 */
+(nullable UIImage *)resizableImageWithSourceImage:(nonnull UIImage *)image;
/**
 *  通过颜色转化图片
 *
 *  @param color  <#color description#>
 *  @param size   <#size description#>
 *  @param radius <#radius description#>
 *
 *  @return <#return value description#>
 */
+ (nullable UIImage *)imageWithColor:(nullable UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius;
/**
 *  <#Description#>
 *
 *  @param color <#color description#>
 *  @param size  <#size description#>
 *
 *  @return <#return value description#>
 */
+ (nullable UIImage *)imageWithColor:(nullable UIColor *)color size:(CGSize)size;
/**
 *  <#Description#>
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+ (nullable UIImage *)imageWithColor:(nullable UIColor *)color;
@end
