//
//  EXRecommendTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXRecommendTableViewCell.h"
#import "EX_BaseCollectionViewCell.h"
#import "EXShopInfoModel.h"

@interface EXRecommendCollectionViewCell :EX_BaseCollectionViewCell
@property(nonatomic,strong)FLAnimatedImageView *headPortraitImageView;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *moreLabel;
@end

@implementation EXRecommendCollectionViewCell

-(void)EX_initConfingViews{
    self.headPortraitImageView = [FLAnimatedImageView new];
    [self.contentView addSubview:self.headPortraitImageView];
    self.headPortraitImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headPortraitImageView.layer.cornerRadius = 1;
    self.headPortraitImageView.layer.borderColor =  UIColorFromRGB(0xeeeeee).CGColor;
    self.headPortraitImageView.layer.borderWidth =Number(0.5);
    self.headPortraitImageView.layer.masksToBounds =YES;
    self.priceLabel = [UILabel new];
    self.priceLabel.font= FontPingFangSC(12);
    self.priceLabel.textAlignment =NSTextAlignmentCenter;
    self.priceLabel.textColor = PriceTextColor;
    [self.contentView addSubview:self.priceLabel];
    [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Number(80), Number(80)));
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(Number(10));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headPortraitImageView.mas_bottom);
        make.right.mas_equalTo(Number(-5));
        make.left.mas_equalTo(Number(5));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(Number(-5));
    }];
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.headPortraitImageView);
        make.width.mas_equalTo(Number(40));
        make.height.mas_equalTo(Number(40));
    }];
}
-(void)InitDataWithModel:(EXShopModel *)model{
    NSString *url =@"";
    NSString *channel_name= @"";
    NSString *price =@"";
    if ([model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        url = convertToString(model.url);
        channel_name =convertToString(model.name);
        if ([model.price isEqualToString:model.oldPrice]) {
            self.priceLabel.text = FormatString(@"¥%@",convertToString(model.price));
        }else{
            NSString *oldPrize = model.oldPrice.length?FormatString(@"¥%@",convertToString(model.oldPrice)):@"";
            NSString *price = model.price.length?FormatString(@"¥%@ ¥%@",convertToString(model.price),convertToString(model.oldPrice)):@"";
            self.priceLabel.attributedText =[NSString lineStyleSingleString:oldPrize Color:SubheadTitleColor font:FontHelFont(9) withString:price newString:model.price.length?FormatString(@"¥%@",convertToString(model.price)):@""];
        }
        if (model.price.length) {
            self.priceLabel.hidden =NO;
        }else{
            self.priceLabel.hidden =YES;
        }
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        url = convertToString(model.picurl);
        channel_name =convertToString(model.title);
        price =convertToString(FormatString(@"%@次播放",model.playcount));
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
    [self.headPortraitImageView sd_setImageWithURL:URLFromString(url) placeholderImage:[UIImage imageNamed:@""]];
    if (![model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        self.priceLabel.hidden =YES;
        if (price.length) {
            self.priceLabel.hidden =NO;
        }else{
            self.priceLabel.hidden =YES;
        }
        self.priceLabel.text = price;
    }
    if (![model.MIME isEqualToString:@"APPLICATION/EVENMORE"]) {
        [self.headPortraitImageView sd_setImageWithURL:URLFromString(url) placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
    }else{
        self.headPortraitImageView.image = [UIImage imageNamed:model.icon_url];
        self.moreLabel.text =model.name;
    }
}

@end


@interface EXRecommendTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)FLAnimatedImageView *headlineFigureImageView;
@property(nonatomic,strong)UICollectionView *recommendListView;
@property(nonatomic,strong)NSMutableArray *recommends;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *decsLabel;
@property(nonatomic,strong)EXShopModel *model;
@end
@implementation EXRecommendTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXRecommendTableViewCell class])];
    if (!cell) {
        cell = [[EXRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXRecommendTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

-(void)InitDataWithModel:(EXShopModel *)model{
    EXShopModel *tempModel =model.datas.firstObject;
    self.model = tempModel;
    NSString *url =@"";
    NSString *channel_name= @"";
    NSString *price =@"";
    if ([tempModel.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        url = convertToString(tempModel.url);
                channel_name =convertToString(tempModel.name);
                NSString *oldPrize = tempModel.oldPrice.length?FormatString(@"¥%@",convertToString(tempModel.oldPrice)):@"";
                NSString *price = tempModel.price.length?FormatString(@"¥%@ ¥%@",convertToString(tempModel.price),convertToString(tempModel.oldPrice)):@"";
                self.decsLabel.attributedText =[NSString lineStyleSingleString:oldPrize Color:SubheadTitleColor font:FontHelFont(9) withString:price newString:tempModel.price.length?FormatString(@"¥%@",convertToString(tempModel.price)):@""];
                if (!tempModel.price.length) {
                    self.decsLabel.hidden =YES;
                }else{
                    self.decsLabel.hidden =NO;
                }
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        url = convertToString(tempModel.picurl);
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
        url = convertToString(tempModel.brandLogo);
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
        url = convertToString(tempModel.actimg);
        channel_name =convertToString(tempModel.name);
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
        url = convertToString(tempModel.picUrl);
        channel_name =convertToString(tempModel.name);
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/BANNER"]){
        url = convertToString( tempModel.pic);
        channel_name =convertToString(tempModel.name);
        price =convertToString(tempModel.brandDesc);
    }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
        url =convertToString( tempModel.icon_url);
        channel_name =convertToString(tempModel.channel_name);
        price =convertToString(tempModel.channel_dec);
    }
    [self.headlineFigureImageView sd_setImageWithURL:URLFromString(url) placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
    
    if (model.datas.count>1) {
        if (model.datas.count>11) {
            self.recommends = [NSMutableArray arrayWithArray:[model.datas subarrayWithRange:NSMakeRange(1, 9)]];
            EXShopModel *tempModel =[EXShopModel new];
            tempModel.MIME =@"APPLICATION/EVENMORE";
            tempModel.name =@"查看更多";
            tempModel.icon_url =@"moreRecommend";
            [self.recommends insertObject:tempModel atIndex:self.recommends.count];
        }else{
            self.recommends = [NSMutableArray arrayWithArray:[model.datas subarrayWithRange:NSMakeRange(1, model.datas.count-1)]];
        }
    }
    [self.recommendListView reloadData];
}

+(CGFloat)getCellHeight:(EXShopModel *)model{
    return Number(295);
}
-(void)Click:(UITapGestureRecognizer *)tap{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model:atSectionModel:)]) {
        [self.delegate  didSelectItemAtType:self.model.TouchType model:self.model atSectionModel:self.model];
    }
}
-(void)HYSinitConfingViews{
    
    [self.contentView addSubview:self.recommendListView];
    self.headlineFigureImageView = [FLAnimatedImageView new];
    self.headlineFigureImageView.contentMode =UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.headlineFigureImageView];
    self.headlineFigureImageView.userInteractionEnabled =YES;
    self.headlineFigureImageView.layer.masksToBounds =YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Click:)];
    
    [self.headlineFigureImageView addGestureRecognizer:tap];
    
    
    
    self.nameLabel = [UILabel new];
    self.nameLabel.font= FontPingFangSC(13);
    self.nameLabel.textColor = UIColorFromRGB(0xffffff);
    [self.headlineFigureImageView addSubview:self.nameLabel];
    self.decsLabel = [UILabel new];
    self.decsLabel.font= FontPingFangSC(21);
    self.decsLabel.textAlignment = NSTextAlignmentCenter;
    self.decsLabel.numberOfLines  = 0;
    self.decsLabel.textColor = UIColorFromRGB(0xffffff);
    [self.headlineFigureImageView addSubview:self.decsLabel];
    [self.headlineFigureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(180));
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(Number(5));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(20));
        make.centerX.mas_equalTo(self.headlineFigureImageView.mas_centerX);
        make.width.mas_equalTo(Number(78));
        make.top.mas_equalTo(self.headlineFigureImageView.mas_top).offset(Number(45));
    }];
    [self.decsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headlineFigureImageView.mas_centerX);
        make.width.mas_equalTo(Number(252));
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(Number(19));
    }];
    [self.recommendListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headlineFigureImageView.mas_bottom).offset(Number(5));
    }];
    [self.recommendListView registerClass:[EXRecommendCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EXRecommendCollectionViewCell class])];
}
#pragma mark UICollectionViewCellDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXRecommendCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EXRecommendCollectionViewCell class]) forIndexPath:indexPath];
    [cell InitDataWithModel:self.recommends[indexPath.row]];
    return cell;
}
//设置分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.recommends.count;
    
}
//每个cell的大小，因为有indexPath，所以可以判断哪一组，或者哪一个item，可一个给特定的大小，等同于layout的itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(ceil(self.width/4),Number(120));
}
//// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}
//// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXShopModel *model = self.recommends[indexPath.item];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model: atSectionModel:)]) {
        [self.delegate  didSelectItemAtType:model.TouchType model:self.recommends[indexPath.item] atSectionModel:self.model];
    }
}
- (UICollectionView *)recommendListView{
    if(!_recommendListView){
        
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _recommendListView =[[UICollectionView alloc] initWithFrame:CGRectMake(0,0, 0,0)
                                               collectionViewLayout:layout];
        _recommendListView.backgroundColor = [UIColor clearColor];
        _recommendListView.showsHorizontalScrollIndicator = NO;
        _recommendListView.showsVerticalScrollIndicator =NO;
        _recommendListView.scrollsToTop =NO;
        _recommendListView.dataSource = self;
        _recommendListView.delegate = self;
    }
    return _recommendListView;
}
@end
