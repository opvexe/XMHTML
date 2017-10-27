//
//  HSYDailyWillBuyTableViewCell.m
//  SuperstarUser
//
//  Created by snowlu on 2017/10/10.
//  Copyright © 2017年 HSY. All rights reserved.
//

#import "HSYDailyWillBuyTableViewCell.h"


@interface HSYDailyWillBuyCollectionViewCell : EX_BaseCollectionViewCell
@property(nonatomic,strong)FLAnimatedImageView *headPortraitImageView;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation HSYDailyWillBuyCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)EX_initConfingViews{
    self.headPortraitImageView = [FLAnimatedImageView new];
    self.headPortraitImageView.contentMode =UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.headPortraitImageView];
    self.headPortraitImageView.layer.masksToBounds =YES;
    self.titleLabel = [UILabel new];
    self.titleLabel.font =FontPingFangSC(13);
    self.titleLabel.textColor =BaseContenTextColor;
    [self.contentView addSubview:self.titleLabel];
    self.priceLabel = [UILabel new];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.font= FontPingFangSC(13);
    self.priceLabel.textColor = PriceTextColor;
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(20));
        make.right.mas_equalTo(Number(-5));
        make.left.mas_equalTo(Number(5));
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(20));
        make.right.mas_equalTo(self.priceLabel.mas_right);
        make.left.mas_equalTo(self.priceLabel.mas_left);
        make.bottom.mas_equalTo(self.priceLabel.mas_top);
    }];
    [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titleLabel.mas_right);
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.bottom.mas_equalTo(self.titleLabel.mas_top).offset(Number(-5));
        make.top.mas_equalTo(0);
    }];
}
-(void)InitDataWithModel:(EXShopModel *)model{
    NSString *url =@"";
    NSString *channel_name= @"";
    NSString *price =@"";
    if ([model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        url = convertToString(model.url);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        url = convertToString(model.picurl);
        channel_name =convertToString(model.title);
    
        
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
            self.priceLabel.attributedText =[NSString lineStyleSingleString:oldPrize Color:SubheadTitleColor font:FontHelFont(9) withString:price newString:model.price.length?FormatString(@"¥%@",convertToString(model.price)):@""];
        }
        if (!model.price.length) {
            self.priceLabel.hidden =YES;
        }else{
            self.priceLabel.hidden =NO;
        }
        
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        NSString *oldPrize = @"次播放";
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
}
@end

@interface HSYDailyWillBuyTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UICollectionView *WillBuyListView;
@property(nonatomic,strong)NSMutableArray *buys;
@property(nonatomic,strong)EXShopModel *model;
@end

@implementation HSYDailyWillBuyTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"HSYDailyWillBuyTableViewCell";
    HSYDailyWillBuyTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HSYDailyWillBuyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)EX_initConfingViews{
  [self.contentView addSubview:self.WillBuyListView];
    [self.WillBuyListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [self.WillBuyListView registerClass:[HSYDailyWillBuyCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HSYDailyWillBuyCollectionViewCell class])];
}
-(void)InitDataWithModel:(EXShopModel *)model{
    self.model =model;
    self.buys = [NSMutableArray arrayWithArray:model.datas];
    [self.WillBuyListView reloadData];
}
+(CGFloat)getCellHeight:(EXShopModel *)model{
    return Number(129);
}
#pragma mark UICollectionViewCellDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HSYDailyWillBuyCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSYDailyWillBuyCollectionViewCell class]) forIndexPath:indexPath];
    [cell InitDataWithModel:self.buys[indexPath.row]];
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
    return self.buys.count;
    
}
//每个cell的大小，因为有indexPath，所以可以判断哪一组，或者哪一个item，可一个给特定的大小，等同于layout的itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(self.width/4,self.height);
}
//// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}
//// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}
//定义每个UICollectionView 的边距

//- ( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
//
//    return UIEdgeInsetsMake ( 0    , Number(10) , 0  , Number(10) );
//
//}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        EXShopModel *model =self.buys[indexPath.item];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model: atSectionModel:)]) {
        [self.delegate  didSelectItemAtType:model.TouchType model:self.buys[indexPath.item] atSectionModel:self.model];
    }
}
- (UICollectionView *)WillBuyListView{
    if(!_WillBuyListView){
        
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _WillBuyListView =[[UICollectionView alloc] initWithFrame:CGRectZero
                                                  collectionViewLayout:layout];
        _WillBuyListView.backgroundColor = [UIColor clearColor];
        _WillBuyListView.showsHorizontalScrollIndicator = NO;
        _WillBuyListView.scrollsToTop = NO;
        _WillBuyListView.showsVerticalScrollIndicator =NO;
        _WillBuyListView.dataSource = self;
        _WillBuyListView.delegate = self;
    }
    return _WillBuyListView;
}
@end
