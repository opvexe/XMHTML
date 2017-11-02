//
//  EX_headView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/9.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_praticeHeadView.h"

@interface EX_praticeHeadView ()

@property(nonatomic, strong)UILabel *masterLabel;   ///掌握度
@property(nonatomic, strong)UILabel *percentLabel;  ///所占百分比
@property(nonatomic, strong)UILabel *symbolLabel;   ///符号
@property(nonatomic, strong)UILabel *practiceLabel; ///章节练习
@end
@implementation EX_praticeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 140.0)];
        bgView.backgroundColor =PriceTextColor;
        
        _masterLabel = [UILabel labelWithTitle:@"掌握度" color:[UIColor whiteColor] font:[UIFont systemFontOfSize:14.0] alignment:NSTextAlignmentCenter];
        _percentLabel = [UILabel labelWithTitle:@" 0 " color:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:50.0] alignment:NSTextAlignmentLeft];
        _symbolLabel = [UILabel labelWithTitle:@"%" color:[UIColor whiteColor] font:[UIFont systemFontOfSize:14.0] alignment:NSTextAlignmentLeft];
        
        [self addSubview:bgView];
        [bgView addSubview:self.percentLabel];
        [bgView addSubview:self.masterLabel];
        [bgView addSubview:self.symbolLabel];
        
        [_masterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX).mas_offset(-30.0);
            make.top.mas_equalTo(20.0);
        }];
        
        [_percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_masterLabel.mas_right);
            make.centerY.mas_equalTo(_masterLabel.mas_centerY);
        }];
        
        [_symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_percentLabel.mas_right);
            make.centerY.mas_equalTo(_masterLabel.mas_centerY);
        }];
        
        
        __block CGFloat W ;
        NSArray *temp = @[@"0\n错题",@"0\n收藏",@"0\n笔记"];
        W = SCREEN_WIDTH/temp.count;
        for (int i = 0; i < temp.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:temp[i] forState:UIControlStateNormal];
            button.titleLabel.numberOfLines = 0;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [button addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 + i;
            [bgView addSubview:button];
         
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(bgView.mas_bottom).mas_offset(-10.0);
                make.width.mas_equalTo(W);
                make.height.mas_equalTo(60.0);
                make.centerX.equalTo(self.mas_right).multipliedBy(((CGFloat)i + 1) / ((CGFloat)temp.count + 1));
            }];
        }
        
        UIButton *lastButton = nil;
        for (int i = 0; i < 2; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:i == 0 ? @"随机练习" : @"整卷模考" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
            [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
            [button addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 103 + i;
            [self addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(50);
                make.width.mas_equalTo(self).multipliedBy(.5);
                make.bottom.mas_equalTo(self.mas_bottom);
                
                if (lastButton) {
                    make.left.mas_equalTo(lastButton.mas_right);
                }else{
                    make.left.mas_equalTo(self);
                }
            }];
            lastButton = button;
        }
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20.0);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-15.0);
            make.width.mas_equalTo(.5);
        }];
        
//        [self addBottomBorderWithColor:[UIColor lightGrayColor] andWidth:0.2];
    }
    return self;
}


-(void)dothings:(UIButton *)sender{
    if (self.practiceBlock) {
        self.practiceBlock(sender.tag);
    }
}
@end
