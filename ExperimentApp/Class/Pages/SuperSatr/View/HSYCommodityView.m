//
//  HSYCommodityView.m
//  SuperstarUser
//
//  Created by snowlu on 2017/10/12.
//  Copyright © 2017年 HSY. All rights reserved.
//

#import "HSYCommodityView.h"

@interface HSYCommodityView ()
@property(nonatomic,strong)FLAnimatedImageView *headPortraitImageView;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *buyBT;
@property(nonatomic,strong)EXShopModel *model;
@end

@implementation HSYCommodityView
-(void)EX_initConfingViews{
    self.headPortraitImageView = [FLAnimatedImageView new];
    self.headPortraitImageView.contentMode =UIViewContentModeScaleAspectFill;
    [self addSubview:self.headPortraitImageView];
    self.headPortraitImageView.layer.masksToBounds =YES;
    self.headPortraitImageView.userInteractionEnabled =YES;
    UITapGestureRecognizer *tap  =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buyAction:)];
    [self.headPortraitImageView addGestureRecognizer:tap];
    self.headPortraitImageView.layer.cornerRadius =2;
    self.priceLabel = [UILabel new];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.font= FontPingFangSC(14);
    self.priceLabel.textColor = PriceTextColor;
    [self addSubview:self.priceLabel];
    self.titleLabel = [UILabel new];
    self.titleLabel.font= FontPingFangSC(15);
    self.titleLabel.textColor = BaseContenTextColor;
    [self addSubview:self.titleLabel];
    self.buyBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buyBT addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.buyBT setTitle:@"立即选购" forState:UIControlStateNormal];
    [self.buyBT setTitle:@"立即选购" forState:UIControlStateHighlighted];
    [self.buyBT setTitle:@"立即选购" forState:UIControlStateDisabled];
    [self.buyBT setTitle:@"立即选购" forState:UIControlStateSelected];
    [self.buyBT setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xff758c)] forState:UIControlStateNormal];
    [self.buyBT setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xff758c)] forState:UIControlStateHighlighted];
    [self.buyBT setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xff758c)] forState:UIControlStateDisabled];
    [self.buyBT setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xff758c)] forState:UIControlStateSelected];
    self.buyBT.showsTouchWhenHighlighted = NO;
    [self.buyBT setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [self.buyBT setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self.buyBT setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
    [self.buyBT setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
    self.buyBT.layer.masksToBounds =YES;
    self.buyBT.titleLabel.font =FontPingFangSC(12);
    self.buyBT.layer.cornerRadius  =Number(5);
    [self addSubview:self.buyBT];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.buyBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(23));
        make.right.mas_equalTo(Number(0));
        make.left.mas_equalTo(Number(0));
        make.bottom.mas_equalTo(self.mas_bottom).offset(Number(-5));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(20));
        make.right.mas_equalTo(self.buyBT.mas_right);
        make.left.mas_equalTo(self.buyBT.mas_left);
        make.bottom.mas_equalTo(self.buyBT.mas_top).offset(Number(-5));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(17));
        make.right.mas_equalTo(self.priceLabel.mas_right);
        make.left.mas_equalTo(self.priceLabel.mas_left);
        make.bottom.mas_equalTo(self.priceLabel.mas_top).offset(Number(-5));
    }];
    [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo( Number(172));
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.bottom.mas_equalTo(self.titleLabel.mas_top).offset(Number(-5));
        make.top.mas_equalTo(5);
    }];
}
-(void)buyAction:(id )sender{
   if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectViewAtType:model:)]) {
        [self.delegate  didSelectViewAtType:self.model.TouchType model:self.model];
    }
}
-(void)InitDataWithModel:(EXShopModel *)model{
    self.model = model;
    NSString *url =@"";
    NSString *channel_name = @"";
    NSString *price =@"";
    NSString * btn_name =@"";
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
    if ([model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        url = convertToString(model.url);
        channel_name =convertToString(model.name);
        btn_name = @"立即选购";
     
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        url = convertToString(model.picurl);
        channel_name =convertToString(model.title);
        btn_name = @"立即播放";
    }else if ([model.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
        url = convertToString(model.brandLogo);
        channel_name =convertToString(model.brandName);
        price =convertToString(FormatString(@"%@代言费",model.representFee));
    }else if ([model.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
        url = convertToString(model.actimg);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
        url = convertToString(model.picUrl);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/BANNER"]){
        url = convertToString( model.pic);
        channel_name =convertToString(model.name);
        price =convertToString(model.brandDesc);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
        url =convertToString( model.icon_url);
        channel_name =convertToString(model.channel_name);
        price =convertToString(model.channel_dec);
    }
    [self.headPortraitImageView sd_setImageWithURL:URLFromString(url) placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
    if ([model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        if ([model.price isEqualToString:model.oldPrice]) {
            self.priceLabel.text = FormatString(@"¥%@",convertToString(model.price));
        }else{
            NSString *oldPrize = model.oldPrice.length?FormatString(@"¥%@",convertToString(model.oldPrice)):@"";
            NSString *price = model.price.length?FormatString(@"¥%@ ¥%@",convertToString(model.price),convertToString(model.oldPrice)):@"";
            self.priceLabel.attributedText =[NSString lineStyleSingleString:oldPrize Color:SubheadTitleColor font:FontPingFangLG(9) withString:price newString:model.price.length?FormatString(@"¥%@",convertToString(model.price)):@""];
        }
        if (!model.price.length) {
            self.priceLabel.hidden =YES;
        }else{
            self.priceLabel.hidden =NO;
        }
        
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        NSString *oldPrize = @"次播放";
            self.priceLabel.textAlignment = NSTextAlignmentLeft;
        NSString *price = model.playcount.length?convertToString(FormatString(@"%@次播放",model.playcount)):@"";
        self.priceLabel.attributedText =[NSString getOtherColorString:oldPrize font:FontPingFangLG(9) Color:SubheadTitleColor  withString:price];
        if (!model.playcount.length) {
            self.priceLabel.hidden =YES;
        }else{
            self.priceLabel.hidden =NO;
        }
        
    }else{
            self.priceLabel.hidden =YES;
            if (!price.length) {
                self.priceLabel.hidden =YES;
            }else{
                self.priceLabel.hidden =NO;
            }
            self.priceLabel.text = price;
    }
    self.titleLabel.text  =channel_name;
    self.buyBT.tag  = model.TouchType;
    if (model.btn_name.length) {
        [self.buyBT setTitle:model.btn_name forState:UIControlStateNormal];
        [self.buyBT setTitle:model.btn_name forState:UIControlStateHighlighted];
        [self.buyBT setTitle:model.btn_name forState:UIControlStateDisabled];
        [self.buyBT setTitle:model.btn_name forState:UIControlStateSelected];
    }else{
        [self.buyBT setTitle:btn_name forState:UIControlStateNormal];
        [self.buyBT setTitle:btn_name forState:UIControlStateHighlighted];
        [self.buyBT setTitle:btn_name forState:UIControlStateDisabled];
        [self.buyBT setTitle:btn_name forState:UIControlStateSelected];
    }
  
}
@end
