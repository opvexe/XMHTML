//
//  EXParagraphConfig.h
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const LMParagraphTypeName;
extern NSString * const LMParagraphIndentName;

typedef NS_ENUM(NSUInteger, LMParagraphType) {
    LMParagraphTypeNone = 0,
    LMParagraphTypeList,
    LMParagraphTypeNumberList,
    LMParagraphTypeCheckbox
};

@interface EXParagraphConfig : NSObject

@property (nonatomic, assign) LMParagraphType type;
@property (nonatomic, assign) NSInteger indentLevel;

@property (nonatomic, readonly) NSParagraphStyle *paragraphStyle;

- (instancetype)initWithParagraphStyle:(NSParagraphStyle *)paragraphStyle type:(LMParagraphType)type;
@end
