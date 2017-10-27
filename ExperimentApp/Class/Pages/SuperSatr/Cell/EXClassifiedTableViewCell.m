//
//  EXClassifiedTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//


#import "EXClassifiedTableViewCell.h"
#import "EX_BaseCollectionViewCell.h"
#import "EXShopInfoModel.h"

#pragma mark  EXClassifiedCollectionViewCell
@interface EXClassifiedCollectionViewCell : EX_BaseCollectionViewCell
@property(nonatomic, strong)FLAnimatedImageView *headPortraitImageView;
@property(nonatomic, strong)UILabel  *titleLabel;
@end

@implementation EXClassifiedCollectionViewCell

- (void)EX_initConfingViews{
    self.headPortraitImageView = [FLAnimatedImageView new];
    self.headPortraitImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.headPortraitImageView];
    self.headPortraitImageView.layer.masksToBounds =YES;
    self.titleLabel = [UILabel new];
    self.titleLabel.font= FontPingFangSC(12);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = BaseContenTextColor;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Number(50), Number(50)));
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(10);
    }];
    self.headPortraitImageView.layer.cornerRadius = Number(25);
}

-(void)InitDataViewModel:(EXShopModel*)model{
    NSString *url =@"";
    NSString *channel_name= @"";
    if ([model.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
        url = convertToString(model.url);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
        url = convertToString(model.picurl);
        channel_name =convertToString(model.title);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
        url = convertToString(model.brandLogo);
        channel_name =convertToString(model.brandName);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
        url = convertToString(model.actimg);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
        url = convertToString(model.picUrl);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/BANNER"]){
        url = convertToString( model.pic);
        channel_name =convertToString(model.name);
    }else if ([model.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
        url =convertToString( model.icon_url);
        channel_name =convertToString(model.channel_name);
    }else if([model.MIME isEqualToString:@"APPLICATION/CHANNEL"]){
        channel_name = convertToString(model.name);
    }
    if (![model.MIME isEqualToString:@"APPLICATION/EVENMORE"]) {
        [self.headPortraitImageView sd_setImageWithURL:URLFromString(url) placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
    }else{
        self.headPortraitImageView.image = [UIImage imageNamed:model.icon_url];
        channel_name = convertToString(model.name);
    }
    self.titleLabel.text =channel_name;
}
@end

#pragma mark  EXClassifiedTableViewCell

@interface EXClassifiedTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *headPortraitListView;
@property(nonatomic, strong)NSMutableArray *headPortartis;
@property(nonatomic, strong)EXShopModel *model;
@end
@implementation EXClassifiedTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXClassifiedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXClassifiedTableViewCell class])];
    if (!cell) {
        cell = [[EXClassifiedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXClassifiedTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}
-(void)InitDataViewModel:(EXShopModel *)model{
    self.model = model;
    if (model.datas.count>10) {
        self.headPortartis = [NSMutableArray arrayWithArray:[model.datas subarrayWithRange:NSMakeRange(0, 9)]];
        EXShopModel *tempModel =[EXShopModel new];
        tempModel.MIME =@"APPLICATION/EVENMORE";
        tempModel.name =@"查看更多";
        tempModel.icon_url =@"more";
        [self.headPortartis insertObject:tempModel atIndex:self.headPortartis.count];
    }else{
        self.headPortartis = [NSMutableArray arrayWithArray:model.datas];
    }
    [self.headPortraitListView reloadData];
}

-(void)EX_initConfingViews{
    [self.contentView addSubview:self.headPortraitListView];
    [self.headPortraitListView registerClass:[EXClassifiedCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EXClassifiedCollectionViewCell class])];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.headPortraitListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

+(CGFloat)getCellHeight:(EXShopModel *)model{
    CGFloat contenHeight = Number(180);
    NSMutableArray *tempData = [NSMutableArray arrayWithArray:model.datas];
    if (tempData.count <=5) {
        contenHeight =(SCREEN_WIDTH/5+Number(10));
    }
    return contenHeight;
}
#pragma mark    UICollectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXClassifiedCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EXClassifiedCollectionViewCell class]) forIndexPath:indexPath];
    [cell InitDataViewModel:self.headPortartis[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.headPortartis.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(self.width/5,Number(85));
}
// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}
// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXShopModel *model =self.headPortartis[indexPath.item];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model:atSectionModel:)]) {
        [self.delegate  didSelectItemAtType:model.TouchType model:self.headPortartis[indexPath.item] atSectionModel:self.model];
    }
}


- (UICollectionView *)headPortraitListView{
    if(!_headPortraitListView){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _headPortraitListView =[[UICollectionView alloc] initWithFrame:CGRectMake(0,0, 0,0)
                                                  collectionViewLayout:layout];
        _headPortraitListView.backgroundColor = [UIColor clearColor];
        _headPortraitListView.showsHorizontalScrollIndicator = NO;
        _headPortraitListView.showsVerticalScrollIndicator =NO;
        _headPortraitListView.dataSource = self;
        _headPortraitListView.delegate = self;
        
    }
    return _headPortraitListView;
}

-(NSMutableArray *)headPortartis{
    if (!_headPortartis) {
        _headPortartis = [NSMutableArray arrayWithCapacity:0];
    }
    return _headPortartis;
}

@end

