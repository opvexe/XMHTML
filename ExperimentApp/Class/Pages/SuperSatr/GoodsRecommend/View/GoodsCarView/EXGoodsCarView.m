//
//  EXGoodsCarView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/3.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXGoodsCarView.h"

@interface EXGoodsCarView ()
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIButton *shopCarButton;
@property(nonatomic,strong)UIButton *buyButton;
@end
@implementation EXGoodsCarView


-(void)layoutSubviews{
    [super layoutSubviews];
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.width/2, self.height)];
    self.leftView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.leftView];
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame), 0, self.width/2, self.height)];
    self.rightView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.rightView];
    NSArray *xl_image =@[@"dianpu",@"say",@"score_icon_off"];
    NSArray *xl_title =@[@"店铺",@"客服",@"收藏"];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:xl_title.count];
    for (int i = 0; i<xl_title.count; i++) {
        RewriteButton *btn = [RewriteButton buttonWithType:UIButtonTypeCustom];
        btn.directionType = ButtonDisplayTypeImageUpTileDown;
        btn.titleLabel.font = FontPingFangSC(12);
        [btn setTitle:xl_title[i] forState:UIControlStateNormal];
        [btn setTitle:xl_title[i] forState:UIControlStateHighlighted];
        [btn setTitle:xl_title[i] forState:UIControlStateSelected];
        [btn setTitleColor:BaseContenTextColor forState:UIControlStateNormal];
        [btn setTitleColor:BaseContenTextColor forState:UIControlStateSelected];
        [btn setTitleColor:BaseContenTextColor forState:UIControlStateHighlighted];
        [btn setTitleColor:BaseContenTextColor forState:UIControlStateDisabled];
        [btn setImage:[UIImage imageNamed:xl_image[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:xl_image[i]] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:xl_image[i]] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:xl_image[i]] forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftView addSubview:btn];
        [temp addObject:btn];
    }
    self.shopCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopCarButton.titleLabel.font = FontPingFangBoldSC(14);
    self.shopCarButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.shopCarButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.shopCarButton setTitle:@"加入购物车" forState:UIControlStateHighlighted];
    [self.shopCarButton setTitle:@"加入购物车" forState:UIControlStateSelected];
    [self.shopCarButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateNormal];
    [self.shopCarButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateSelected];
    [self.shopCarButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateHighlighted];
    [self.shopCarButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateDisabled];
    self.shopCarButton.backgroundColor = [UIColor orangeColor];
    [self.rightView addSubview:self.shopCarButton];
    [self.shopCarButton setTag:103];
    [self.shopCarButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    self.buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buyButton.titleLabel.font = FontPingFangBoldSC(14);
    self.buyButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [self.buyButton setTitle:@"立即购买" forState:UIControlStateHighlighted];
    [self.buyButton setTitle:@"立即购买" forState:UIControlStateSelected];
    [self.buyButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateNormal];
    [self.buyButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateSelected];
    [self.buyButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateHighlighted];
    [self.buyButton setTitleColor:HSYColorf0f0f0 forState:UIControlStateDisabled];
    self.buyButton.backgroundColor = PriceTextColor;
    [self.rightView addSubview:self.buyButton];
    [self.buyButton setTag:104];
    [self.buyButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat xl_width = self.leftView.width/temp.count;
    [temp enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTag:100+idx];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(xl_width);
            make.height.mas_equalTo(self);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(xl_width*idx);
        }];
    }];
    [self.shopCarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftView.mas_right);
        make.width.mas_equalTo(self.rightView).multipliedBy(.5);
        make.height.mas_equalTo(self);
        make.top.bottom.mas_equalTo(self.rightView);
    }];
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopCarButton.mas_right);
        make.width.mas_equalTo(self.shopCarButton);
        make.height.mas_equalTo(self);
        make.top.bottom.mas_equalTo(self.rightView);
    }];
}


/**
 Description

 @param sender sender description
 */
-(void)dothings:(UIButton *)sender{
    if (self.xm_delegate && [self.xm_delegate respondsToSelector:@selector(goodsCarView:selectIndex:)]) {
        [self.xm_delegate goodsCarView:self selectIndex:sender.tag];
    }
}


@end

