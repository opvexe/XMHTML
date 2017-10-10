//
//  UILabel+ZDKExtent.m
//  jingchangzhidekan
//
//  Created by shumin.tao on 16/6/21.
//  Copyright © 2016年 maco. All rights reserved.
//

#import "UILabel+ZDKExtent.h"

@implementation UILabel (ZDKExtent)

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize {
    return [self labelWithTitle:title color:color fontSize:fontSize alignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    return [self labelWithTitle:title color:color font:font alignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    return label;
}

+ (instancetype)SinglelabelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 1;
    label.textAlignment = alignment;
    [label sizeToFit];
    return label;
}


@end
