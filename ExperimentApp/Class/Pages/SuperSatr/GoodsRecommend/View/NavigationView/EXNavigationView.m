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
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateNormal];
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateHighlighted];
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateSelected];
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateDisabled];
        [self.backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateNormal];
        [self.backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateHighlighted];
        [self.backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateSelected];
        [self.backButton setImage:[UIImage imageNamed:@"shop_left"] forState:UIControlStateDisabled];
        self.backButton.tag = 100;
        [self.backButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backButton];
        
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
        [self.shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
        [self.shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
        [self.shareButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
        [self.shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
        [self.shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
        [self.shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
        [self.shareButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
        self.shareButton.tag = 101;
        [self.shareButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shareButton];
        
        _titleLabel = [UILabel labelWithTitle:@"商品详情" color:HSYColor323232 font:[UIFont systemFontOfSize:18] alignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
        
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(Number(10));
        }];
        
        [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
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

