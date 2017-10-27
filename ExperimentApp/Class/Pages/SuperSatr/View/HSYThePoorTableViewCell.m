//
//  HSYThePoorTableViewCell.m
//  SuperstarUser
//
//  Created by snowlu on 2017/10/10.
//  Copyright © 2017年 HSY. All rights reserved.
//

#import "HSYThePoorTableViewCell.h"
#import "HSYCommodityView.h"
@interface HSYThePoorTableViewCell ()<EXBaseViewActionProtocol>
@property(nonatomic,strong)HSYCommodityView *leftcommodityView;
@property(nonatomic,strong)HSYCommodityView *rigithcommodityView;
@property(nonatomic,strong)NSMutableArray *thePoors;
@property(nonatomic,strong)EXShopModel *model;
@end
@implementation HSYThePoorTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"HSYThePoorTableViewCell";
    HSYThePoorTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HSYThePoorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)EX_initConfingViews{
    self.leftcommodityView =  [[HSYCommodityView alloc] init];
    [self.contentView addSubview:self.leftcommodityView];

    self.rigithcommodityView =  [[HSYCommodityView alloc] init];
    [self.contentView addSubview:self.rigithcommodityView];
    self.rigithcommodityView.delegate  = self;
    self.leftcommodityView.delegate  = self;
    [self.leftcommodityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Number(10));
            make.width.mas_equalTo(Number(172));
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(0);
    }];
    [self.rigithcommodityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(Number(-10));
        make.width.mas_equalTo(self.leftcommodityView);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
}
-(void)InitDataWithModel:(EXShopModel *)model{
    self.model = model;
    if (model.datas.count) {
        [self.leftcommodityView InitDataWithModel:model.datas.firstObject];
        if (model.datas.count==2) {
        [self.rigithcommodityView InitDataWithModel:model.datas.lastObject];
        }
    }
}
#pragma mark CJXBaseViewActionProtocol

-(void)didSelectViewAtType:(EXXBaseTableViewCellTouchType)type model:(EXShopModel *)model{
    
    if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model: atSectionModel:)]) {
        [self.delegate  didSelectItemAtType:type model:model atSectionModel: self.model];
    }
}

+(CGFloat)getCellHeight:(EXShopModel *)model{
    return  Number(260);
}
@end
