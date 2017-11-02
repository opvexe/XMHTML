//
//  EXParagraphConfig.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXParagraphConfig.h"

NSString * const LMParagraphTypeName = @"LMParagraphType";
NSString * const LMParagraphIndentName = @"LMParagraphIndent";
@implementation EXParagraphConfig

static CGFloat const kIndentPerLevel = 32.f;
static NSInteger const kMaxIndentLevel = 6;

- (instancetype)init {
    if (self = [super init]) {
        _type = LMParagraphTypeNone;
        _indentLevel = 0;
    }
    return self;
}

- (instancetype)initWithParagraphStyle:(NSParagraphStyle *)paragraphStyle type:(LMParagraphType)type {
    if (self = [super init]) {
        _indentLevel = paragraphStyle.headIndent / kIndentPerLevel;
    }
    return self;
}

- (void)setIndentLevel:(NSInteger)indentLevel {
    if (indentLevel < 0) {
        indentLevel = 0;
    }
    else if (indentLevel > kMaxIndentLevel) {
        indentLevel = kMaxIndentLevel;
    }
    _indentLevel = indentLevel;
}

- (NSParagraphStyle *)paragraphStyle {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
    paragraphStyle.headIndent = kIndentPerLevel * self.indentLevel;
    paragraphStyle.firstLineHeadIndent = kIndentPerLevel * self.indentLevel;
    return paragraphStyle;
}

@end
