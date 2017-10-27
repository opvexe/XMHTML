//
//  EXGoodsInfoTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/25.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXGoodsInfoTableViewCell.h"

@interface EXGoodsInfoTableViewCell ()
@property(nonatomic,strong)UILabel *goodsInfoLabel;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *stockLabel;    //库存
@property(nonatomic,strong)UILabel *freightLabel;  //运费
@property(nonatomic,strong)UIButton *deliverButton;
@property(nonatomic,strong)UIButton *afterSaleButton;
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
    self.goodsInfoLabel = [UILabel labelWithTitle:@"" color:HSYColorffffff font:FontPingFangBoldSC(14.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.goodsInfoLabel];
    self.priceLabel = [UILabel labelWithTitle:@"" color:BaseContenTextColor font:FontPingFangSC(12.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.priceLabel];
    self.stockLabel = [UILabel labelWithTitle:@"" color:BaseContenTextColor font:FontPingFangSC(12.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.stockLabel];
    self.freightLabel = [UILabel labelWithTitle:@"" color:BaseContenTextColor font:FontPingFangSC(12.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.freightLabel];
    
    self.deliverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deliverButton.titleLabel.font = FontPingFangSC(8);
    [self.deliverButton setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
    [self.deliverButton setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(5), 0, 0)];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateNormal];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateHighlighted];
    [self.deliverButton setTitle:@"72小时发货" forState:UIControlStateSelected];
    [self.deliverButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self.deliverButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [self.deliverButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
    [self.deliverButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
    [self.deliverButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.deliverButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.deliverButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.deliverButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    [self.deliverButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.deliverButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.deliverButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.deliverButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    self.deliverButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.deliverButton];
    
    self.afterSaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.afterSaleButton.titleLabel.font = FontPingFangSC(8);
    [self.afterSaleButton setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
    [self.afterSaleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(5), 0, 0)];
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateNormal];
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateHighlighted];
    [self.afterSaleButton setTitle:@"支持售后退款" forState:UIControlStateSelected];
    [self.afterSaleButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self.afterSaleButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [self.afterSaleButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
    [self.afterSaleButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
    [self.afterSaleButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.afterSaleButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.afterSaleButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.afterSaleButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.afterSaleButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    self.afterSaleButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.afterSaleButton];
    
    [self.goodsInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsInfoLabel.mas_left);
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.priceLabel.mas_top);
    }];
    [self.freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.stockLabel.mas_left).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.priceLabel.mas_top);
    }];
    
    [self.deliverButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsInfoLabel.mas_left);
        make.top.mas_equalTo(self.priceLabel.mas_bottom).mas_offset(Number(10));
    }];
    
    [self.afterSaleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.deliverButton.mas_right).mas_offset(Number(10));
        make.top.mas_equalTo(self.deliverButton.mas_top);
    }];
}

-(void)InitDataWithModel:(EX_BaseModel *)model{
    
    
}

@end



/**
 * 进店逛逛 店主
 */
@interface EXGoodsShopUserTableViewCell: EX_BaseTbaleViewCell
@property(nonatomic,strong)FLAnimatedImageView *shopUserImageView;
@property(nonatomic,strong)UILabel *shopUserNameLabel;
@property(nonatomic,strong)UIButton *enterShopButton;
@end

@implementation EXGoodsShopUserTableViewCell


+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXGoodsShopUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXGoodsShopUserTableViewCell class])];
    if (!cell) {
        cell = [[EXGoodsShopUserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXGoodsShopUserTableViewCell class])];
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
    [self.contentView addSubview:self.shopUserImageView];
    self.shopUserImageView.layer.masksToBounds =YES;
    self.shopUserNameLabel = [UILabel new];
    self.shopUserNameLabel.font= FontPingFangSC(12);
    self.shopUserNameLabel.textAlignment = NSTextAlignmentCenter;
    self.shopUserNameLabel.textColor = BaseContenTextColor;
    [self.contentView addSubview:self.shopUserNameLabel];
    self.enterShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.enterShopButton.layer.cornerRadius =3;
    self.enterShopButton.layer.masksToBounds =YES;
    self.enterShopButton.layer.borderColor = UIColorFromRGB(0xffffff).CGColor;
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateNormal];
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateHighlighted];
    [self.enterShopButton setTitle:@"进店逛逛" forState:UIControlStateSelected];
    [self.enterShopButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self.enterShopButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [self.enterShopButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
    [self.enterShopButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
    [self.contentView addSubview:self.enterShopButton];
    
    [self.shopUserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(self.contentView).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
    
    [self.shopUserNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopUserImageView.mas_right).mas_offset(5.0);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.enterShopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10));
        make.centerY.mas_equalTo(self.contentView.centerY);
        make.height.mas_equalTo(Number(30.0));
    }];
}

-(void)InitDataWithModel:(EX_BaseModel *)model{
    
    
}
@end


/**
 * 商品选择数量
 */
@interface EXGoodsShopChoiceTableViewCell: EX_BaseTbaleViewCell
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
    
    self.shopChoiceLabel = [UILabel labelWithTitle:@"" color:BaseContenTextColor font: FontPingFangSC(14) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.shopChoiceLabel];
    self.enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.enterButton setBackgroundImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    [self.enterButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateNormal];
    [self.enterButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateHighlighted];
    [self.enterButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateSelected];
    [self.enterButton setImage:[UIImage imageNamed:@"shop_share"] forState:UIControlStateDisabled];
    self.enterButton.contentMode  = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.enterButton];
    
    [self.shopChoiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
    
    [self.enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10));
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
}

-(void)InitDataWithModel:(EX_BaseModel *)model{
    
    
}

@end

