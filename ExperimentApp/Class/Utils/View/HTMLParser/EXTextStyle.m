//
//  EXTextStyle.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXTextStyle.h"

@implementation EXTextStyle

- (instancetype)init {
    if (self = [super init]) {
        _fontSize = [UIFont systemFontSize];
        _textColor = [UIColor blackColor];
    }
    return self;
}

+ (instancetype)textStyleWithType:(EXTextStyleType)type{
    
    EXTextStyle *textStyle = [[self alloc] init];
    switch (type) {
        case EXTextStyleFormatTitleSmall:
            textStyle.fontSize = 18.f;
            break;
        case EXTextStyleFormatTitleMedium:
            textStyle.fontSize = 24.f;
            break;
        case EXTextStyleFormatTitleLarge:
            textStyle.fontSize = 30.f;
            break;
        default:
            return textStyle;
    }
    textStyle.bold = type == EXTextStyleFormatNormal ? NO : YES;
    return textStyle;
}

-(EXTextStyleType)type{
    if (self.fontSize == 18.f) {
        return EXTextStyleFormatTitleSmall;
    }else if (self.fontSize == 24.0f){
        return EXTextStyleFormatTitleMedium;
    }else if (self.fontSize == 30.f){
        return EXTextStyleFormatTitleLarge;
    }
    return EXTextStyleFormatNormal;
}


- (UIFont *)font {
    return [UIFont xm_fontWithFontSize:self.fontSize bold:self.bold italic:self.italic];
}


@end

