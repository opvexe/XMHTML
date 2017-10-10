//
//  EX_leftHeadView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_leftHeadView.h"

@interface EX_leftHeadView ()
@property(nonatomic, strong)UIButton *cutButton;
@property(nonatomic, strong)UILabel  *titleLabel;
@end
@implementation EX_leftHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
        
        _cutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cutButton.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_cutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cutButton setTitle:@"切换科目" forState:UIControlStateNormal];
        [_cutButton addTarget:self action:@selector(cut:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cutButton];
        
        _titleLabel = [UILabel labelWithTitle:@"公路水运试验检测" color:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:18.0] alignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
        
        [_cutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(-30.0);
            make.top.mas_equalTo(self).mas_equalTo(40.0);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX).mas_offset(X_ScreenWidth*0.15);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(30.0);
        }];
        
    }
    return self;
}

-(void)cut:(id)sender{
    if (self.cutChoiceBlock) {
        self.cutChoiceBlock();
    }
}


@end
