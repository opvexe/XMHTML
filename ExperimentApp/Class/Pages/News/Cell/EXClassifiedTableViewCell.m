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
@property(nonatomic, strong)FLAnimatedImage *headPortraitImageView;
@property(nonatomic, strong)UILabel  *titleLabel;
@end

@implementation EXClassifiedCollectionViewCell

- (void)EX_initConfingViews{
    
    
}

-(void)InitDataViewModel:(EXShopModel*)model{
    
    
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

-(void)EX_initConfingViews{
 
    [self.contentView addSubview:self.headPortraitListView];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.headPortraitListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}


+(CGFloat)getCellHeight:(EXShopModel *)model{
    
    return Number(120.0);
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












