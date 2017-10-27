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
        [_cutButton setImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateNormal];
        
        CGFloat imageWidth = 20;
//        CGFloat imageHeight = 20;
        CGFloat labelWidth = [_cutButton.titleLabel.text sizeWithFont:_cutButton.titleLabel.font].width;
//        CGFloat labelHeight = [_cutButton.titleLabel.text sizeWithFont:_cutButton.titleLabel.font].height;
        
        _cutButton.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -(labelWidth));
        _cutButton.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
       //top, left, bottom, right 如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
        
        [_cutButton addTarget:self action:@selector(cut:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cutButton];
        
        _titleLabel = [UILabel labelWithTitle:@"公路水运试验检测" color:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:18.0] alignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
        
        [_cutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(-20.0);
            make.top.mas_equalTo(self).mas_equalTo(40.0);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
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
