//
//  EXGoodsInfoTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/25.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXGoodsInfoTableViewCell.h"
#import "EXGoodsModel.h"

@interface EXGoodsInfoTableViewCell ()
@property(nonatomic,strong)UILabel *goodsInfoLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *stockLabel;    //库存
@property(nonatomic,strong)UILabel *freightLabel;  //运费
@property(nonatomic,strong)RewriteButton *deliverButton;
@property(nonatomic,strong)RewriteButton *afterSaleButton;
@end
@implementation EXGoodsInfoTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    EXGoodsInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXGoodsInfoTableViewCell class])];
    if (!cell) {
        cell = [[EXGoodsInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXGoodsInfoTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


-(void)EX_initConfingViews{
    self.goodsInfoLabel = [UILabel labelWithTitle:@"新款创意迷你usb" color:BaseContenTextColor font:FontPingFangBoldSC(16.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.goodsInfoLabel];
    self.priceLabel = [UILabel labelWithTitle:@"28.8" color:PriceTextColor font:FontPingFangSC(14.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.priceLabel];
    self.stockLabel = [UILabel labelWithTitle:@"库存" color:BaseContenTextColor font:FontPingFangSC(14.0) alignment:NSTextAlignmentRight];
    [self.contentView addSubview:self.stockLabel];
    self.freightLabel = [UILabel labelWithTitle:@"运费" color:BaseContenTextColor font:FontPingFangSC(14.0) alignment:NSTextAlignmentRight];
    [self.contentView addSubview:self.freightLabel];
    
    self.deliverButton = [RewriteButton buttonWithType:UIButtonTypeCustom];
    self.deliverButton.directionType = ButtonDisplayTypeImageLeftTileRight;
    self.deliverButton.titleLabel.font = FontPingFangSC(12);
//    [self.deliverButton setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
//    [self.deliverButton setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(3), 0, 0)];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateNormal];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateHighlighted];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateSelected];
    [self.deliverButton setTitleColor:BaseContenTextColor forState:UIControlStateNormal];
    [self.deliverButton setTitleColor:BaseContenTextColor forState:UIControlStateSelected];
    [self.deliverButton setTitleColor:BaseContenTextColor forState:UIControlStateHighlighted];
    [self.deliverButton setTitleColor:BaseContenTextColor forState:UIControlStateDisabled];
    [self.deliverButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateNormal];
    [self.deliverButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateHighlighted];
    [self.deliverButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateSelected];
    [self.deliverButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateDisabled];
    self.deliverButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.deliverButton];
    
    self.afterSaleButton = [RewriteButton buttonWithType:UIButtonTypeCustom];
    self.afterSaleButton.titleLabel.font = FontPingFangSC(12);
//    [self.afterSaleButton setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
//    [self.afterSaleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(3), 0, 0)];
    self.afterSaleButton.directionType = ButtonDisplayTypeImageLeftTileRight;
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateNormal];
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateHighlighted];
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateSelected];
    [self.afterSaleButton setTitleColor:BaseContenTextColor forState:UIControlStateNormal];
    [self.afterSaleButton setTitleColor:BaseContenTextColor forState:UIControlStateSelected];
    [self.afterSaleButton setTitleColor:BaseContenTextColor forState:UIControlStateHighlighted];
    [self.afterSaleButton setTitleColor:BaseContenTextColor forState:UIControlStateDisabled];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateNormal];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateHighlighted];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateSelected];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"oval_hl"] forState:UIControlStateDisabled];
    self.afterSaleButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.afterSaleButton];
    [self.goodsInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10.0));
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(10.0));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsInfoLabel.mas_left);
        make.top.mas_equalTo(self.goodsInfoLabel.mas_bottom).mas_offset(Number(5.0));
    }];
    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(15.0));
        make.top.mas_equalTo(self.priceLabel.mas_top);
    }];
    [self.freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.stockLabel.mas_left).mas_offset(-Number(15.0));
        make.top.mas_equalTo(self.priceLabel.mas_top);
    }];
    [self.deliverButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsInfoLabel.mas_left);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).mas_offset(Number(5.0));
    }];
    [self.afterSaleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.deliverButton.mas_right).mas_offset(Number(10));
        make.top.mas_equalTo(self.deliverButton.mas_top);
    }];
}

-(void)InitDataWithModel:(EXGoodsModel *)model{
    self.goodsInfoLabel.text = model.intro;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    self.stockLabel.text = [NSString stringWithFormat:@"库存:%@",model.stockAmount];
    self.freightLabel.text =[NSString stringWithFormat:@"运费:%@",model.postage];
}

+(CGFloat)getCellHeight:(EXGoodsModel *)model{
    CGSize size  = [model.intro sizeWithFont:FontPingFangBoldSC(16.0) maxW:[UIScreen mainScreen].bounds.size.width - Number(20)];
    return  Number(10) + size.height + Number(10) + Number(20.0) + Number(10) + Number(30) +Number(10);
}

@end



/**
 * 进店逛逛 店主
 */
@interface EXGoodsShopperTableViewCell()
@property(nonatomic,strong)FLAnimatedImageView *shopUserImageView;
@property(nonatomic,strong)UILabel *shopUserNameLabel;
@property(nonatomic,strong)UIButton *enterShopButton;
@end

@implementation EXGoodsShopperTableViewCell


+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXGoodsShopperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXGoodsShopperTableViewCell class])];
    if (!cell) {
        cell = [[EXGoodsShopperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXGoodsShopperTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

-(void)EX_initConfingViews{
    
    self.shopUserImageView = [FLAnimatedImageView new];
    self.shopUserImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.shopUserImageView.cornerRadius = Number(20.0);
    [self.contentView addSubview:self.shopUserImageView];
    self.shopUserImageView.layer.masksToBounds =YES;
    self.shopUserNameLabel = [UILabel new];
    self.shopUserNameLabel.font= FontPingFangSC(14);
    self.shopUserNameLabel.textAlignment = NSTextAlignmentLeft;
    self.shopUserNameLabel.textColor = BaseContenTextColor;
    [self.contentView addSubview:self.shopUserNameLabel];
    self.enterShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.enterShopButton.layer.cornerRadius =3;
    self.enterShopButton.layer.masksToBounds =YES;
    self.enterShopButton.layer.borderWidth = 1.0f;
    self.enterShopButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.enterShopButton.layer.borderColor =PriceTextColor.CGColor;
    [self.enterShopButton.titleLabel setFont:FontPingFangSC(14)];
    [self.enterShopButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateNormal];
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateHighlighted];
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateSelected];
    [self.enterShopButton setTitleColor:PriceTextColor forState:UIControlStateNormal];
    [self.enterShopButton setTitleColor:PriceTextColor forState:UIControlStateSelected];
    [self.enterShopButton setTitleColor:PriceTextColor forState:UIControlStateHighlighted];
    [self.enterShopButton setTitleColor:PriceTextColor forState:UIControlStateDisabled];
    [self.contentView addSubview:self.enterShopButton];
    self.enterShopButton.tag = 100;
     [self.enterShopButton addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.shopUserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(Number(40.0));
    }];
    [self.shopUserNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopUserImageView.mas_right).mas_offset(10.0);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.enterShopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(15));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(Number(30.0));
    }];
}

-(void)dothings:(UIButton *)sender{
    if (self.xg_delegate&&[self.xg_delegate respondsToSelector:@selector(goodsCarTableView:selectIndex:)]) {
        [self.xg_delegate goodsCarTableView:self selectIndex:sender.tag];
    }
}

/**
 Description

 @param model model description
 */
-(void)InitDataWithModel:(EXGoodsModel *)model{
    self.shopUserImageView.image = [UIImage imageNamed:model.picUrl];
    self.shopUserNameLabel.text = model.shopName;
}


/**
 Description

 @param model model description
 @return return value description
 */
+(CGFloat)getCellHeight:(EXGoodsModel *)model{
    return Number(60.0);
}

@end


/**
 * 商品选择数量
 */
@interface EXGoodsShopChoiceTableViewCell()
@property(nonatomic,strong)UILabel *shopChoiceLabel;
@property(nonatomic,strong)UIButton *enterButton;
@end

@implementation EXGoodsShopChoiceTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXGoodsShopChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXGoodsShopChoiceTableViewCell class])];
    if (!cell) {
        cell = [[EXGoodsShopChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXGoodsShopChoiceTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)EX_initConfingViews{
    
    self.shopChoiceLabel = [UILabel labelWithTitle:@"选择分类" color:BaseContenTextColor font: FontPingFangSC(14) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.shopChoiceLabel];
    self.enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateNormal];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateHighlighted];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateSelected];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateDisabled];
    [self.enterButton setImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateNormal];
    [self.enterButton setImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateHighlighted];
    [self.enterButton setImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateSelected];
    [self.enterButton setImage:[UIImage imageNamed:@"my_icon_enter_n"] forState:UIControlStateDisabled];
    self.enterButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.enterButton];
    [self.shopChoiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(15));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}


-(void)InitDataWithModel:(EXGoodsModel *)model{
//    self.shopChoiceLabel.text = @"选择分类";
}

+(CGFloat)getCellHeight:(EXGoodsModel *)model{
    return Number(60.0);
}
@end

