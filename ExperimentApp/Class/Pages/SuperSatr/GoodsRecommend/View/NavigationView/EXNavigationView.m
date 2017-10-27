//
//  EXNavigationView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXNavigationView.h"
@interface EXNavigationView()
@property(nonatomic, strong)UIButton *backButton;
@property(nonatomic, strong)UIButton *shareButton;
@property(nonatomic, strong)UILabel *titleLabel;
@end

@implementation EXNavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateNormal];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateHighlighted];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateSelected];
        [_backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateDisabled];
        [_backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateHighlighted];
        [_backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateSelected];
        [_backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateDisabled];
        _backButton.tag = 100;
        [_backButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backButton];
        
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
        [_shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
        [_shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
        [_shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
        [_shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
        _shareButton.tag = 101;
        [_shareButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shareButton];
        
        _titleLabel = [UILabel labelWithTitle:@"商品详情" color:HSYColor323232 font:[UIFont systemFontOfSize:18] alignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
        
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(Number(10));
        }];
        
        [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-Number(10.0));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
    return self;
}


/**
 * 点击导航
 
 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    if (self.goodsNavBlock) {
        self.goodsNavBlock(sender.tag);
    }
}
@end

