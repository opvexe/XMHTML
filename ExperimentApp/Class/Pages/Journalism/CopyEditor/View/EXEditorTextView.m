//
//  EXWordView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXEditorTextView.h"

@implementation EXEditorTextView
{
    UIView *_separatorLine;     ///MARK: 分割线
    UIView *_titleView;         ///MARK: 编辑文稿视图
}
static CGFloat const kLMWMargin = 20.f;
static CGFloat const kLMWTitleHeight = 44.f;
static CGFloat const kLMWCommonSpacing = 16.f;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

/**
 * 初始化视图
 */
-(void)setup{

    ///MARK: 文稿标题
    self.titleTextField = [[UITextField alloc] init];
    self.titleTextField.font = [UIFont boldSystemFontOfSize:16.f];
    self.titleTextField.placeholder = @"文稿标题";
    ///Mark： 分割线
    _separatorLine = [[UIView alloc] init];
    _separatorLine.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    ///Mark： 文本标题子视图
    _titleView = [[UIView alloc] init];
    _titleView.backgroundColor = [UIColor whiteColor];
    
    [_titleView addSubview:self.titleTextField];
    [_titleView addSubview:_separatorLine];
    [self addSubview:_titleView];
    
    self.autocorrectionType = UITextAutocorrectionTypeNo;  //是否纠错
    self.spellCheckingType = UITextSpellCheckingTypeNo; //首字母是否大写
//    textContainerInset；通过设置边距可以间接的改变光标的位置，边距依次为：上，左，下， 右。
    self.textContainerInset = UIEdgeInsetsMake(kLMWMargin + kLMWTitleHeight + kLMWCommonSpacing,
                                               kLMWCommonSpacing,
                                               kLMWCommonSpacing,
                                               kLMWCommonSpacing);
}

-(void)layoutSubviews{
    [super layoutSubviews];

    CGRect rect = CGRectInset(self.bounds, kLMWMargin, kLMWMargin);
    rect.origin.y = kLMWMargin;
    rect.size.height = kLMWTitleHeight;
    _titleView.frame = rect;

    rect.origin = CGPointZero;
    rect.size.height = 30.f;
    _titleTextField.frame = rect;
    
    rect.origin.y = CGRectGetHeight(_titleView.bounds)- 1;
    rect.size.height = 1.0f;
    _separatorLine.frame = rect;
}
@end
