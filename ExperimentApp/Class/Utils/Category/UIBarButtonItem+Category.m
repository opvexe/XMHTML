//
//  UIBarButtonItem+Category.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage :[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.imageView.contentMode  = UIViewContentModeScaleAspectFit;
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.frame = CGRectMake(0, 0, 18, 18);
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage :[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.imageView.contentMode  = UIViewContentModeScaleAspectFit;
    
    // 设置尺寸
    btn.frame = CGRectMake(0, 0, 15, 18);
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action text:(NSString *)text
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:15] maxW:80];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, size.width, 25);
    btn.titleLabel.lineBreakMode =NSLineBreakByTruncatingTail;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTintColor:[UIColor whiteColor]];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action URLimage:(NSString *)imageUrl
{
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    UIImage *tempImage = [UIImage imageWithData:data];
    [btn setBackgroundImage:tempImage forState:UIControlStateNormal];
    // 设置尺寸
    btn.frame = CGRectMake(0, 0,20 , 20);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
