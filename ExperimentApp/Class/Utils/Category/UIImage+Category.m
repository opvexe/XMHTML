//
//  UIImage+Category.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

+(UIImage*)createImageWithColor:(UIColor*) color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage *)resizableImageWithSourceImage:(UIImage *)image
{
    UIImage *newImage=[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height*0.5, image.size.width*0.5, image.size.height*0.5-1, image.size.width*0.5-1) resizingMode:UIImageResizingModeStretch];
    return newImage;
    
}
+(UIImage *)imageBySoucreImage:(UIImage *)sourceImage ScalingAndCroppingForSize:(CGSize)targetSize
{
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaleWidth = targetWidth;
    CGFloat scaleHeight = targetHeight;
    CGPoint thumbnailPoint =CGPointMake(0.0, 0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
        {
            scaleFactor = widthFactor;
        }else
        {
            scaleFactor = heightFactor;
            
        }
        scaleWidth = width *scaleFactor ;
        scaleHeight = height * scaleFactor;
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaleHeight) * 0.5;
        }else if(widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaleWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaleWidth;
    thumbnailRect.size.height = scaleHeight;
    [sourceImage drawInRect:thumbnailRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil)
    {
        NSLog(@"Image could not scale!");
    }
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    if (radius > 0.0f && radius <= size.width && radius <= size.height) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
        [color setFill];
        [path fill];
    } else {
        CGContextSetFillColorWithColor(ctx, color.CGColor);
        CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    }
    CGContextRestoreGState(ctx);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    return [UIImage imageWithColor:color size:size cornerRadius:0.0f];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
}
@end
