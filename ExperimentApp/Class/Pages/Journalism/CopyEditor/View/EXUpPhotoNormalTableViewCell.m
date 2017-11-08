//
//  EXNormalTableViewCell.m
//  ExperimentApp
//
//  Created by Facebook on 2017/11/8.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXUpPhotoNormalTableViewCell.h"
#import "EXUpPhotoModel.h"
@interface EXUpPhotoNormalTableViewCell ()
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)UILabel *leftLabel;
@property(nonatomic,strong)UILabel *rightLabel;
@end
@implementation EXUpPhotoNormalTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXUpPhotoNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXUpPhotoNormalTableViewCell class])];
    if (!cell) {
        cell = [[EXUpPhotoNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXUpPhotoNormalTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)EX_initConfingViews{
    self.leftImageView = [[UIImageView alloc]init];
    self.leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.leftImageView];
    self.rightImageView = [[UIImageView alloc]init];
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.rightImageView];
    self.leftLabel = [UILabel labelWithColor:BaseContenTextColor font:FontPingFangSC(14.0) alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.leftLabel];
    self.rightLabel = [UILabel labelWithColor:BaseContenTextColor font:FontPingFangSC(14.0) alignment:NSTextAlignmentRight];
    [self.contentView addSubview:self.rightLabel];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(-Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(Number(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightImageView.mas_left).mas_offset(-Number(5.0));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

-(void)InitDataWithModel:(EXUpPhotoModel *)model{
    if (model.icon) {
        self.leftImageView.image = [UIImage imageNamed:model.icon];
    }
    if (model.image) {
        self.rightImageView.image = [UIImage imageNamed:model.image];
    }
    if (model.title) {
        self.leftLabel.text = model.title;
    }
    if (model.explain) {
        self.rightLabel.text = model.explain;
    }
}

@end
