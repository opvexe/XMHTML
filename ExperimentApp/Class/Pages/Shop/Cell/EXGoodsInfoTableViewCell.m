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
    [self.deliverButton setTitle:@"" forState:UIControlStateNormal];
    
    
    
    [self.goodsInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    [self.freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.stockLabel.mas_left).mas_offset(-Number(10.0));
        make.top.mas_equalTo(self.contentView).mas_offset(Number(5.0));
    }];
    
}


@end
