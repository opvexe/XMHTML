//
//  EXUpPhotoImageVideoCell.m
//  ExperimentApp
//
//  Created by Facebook on 2017/11/8.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXUpPhotoImageVideoCell.h"
#import "EXUpPhotoCollectionViewCell.h"

@interface EXUpPhotoImageVideoCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *photoCollectionView;
@property(nonatomic,strong)NSMutableArray *photos;
@end
@implementation EXUpPhotoImageVideoCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXUpPhotoImageVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXUpPhotoImageVideoCell class])];
    if (!cell) {
        cell = [[EXUpPhotoImageVideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXUpPhotoImageVideoCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)EX_initConfingViews{
    [self.contentView addSubview:self.photoCollectionView];
    [self.photoCollectionView registerClass:[EXUpPhotoCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EXUpPhotoCollectionViewCell class])];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}


/**
 * 刷新reload
 */
- (void)reload{
    [self.photoCollectionView reloadData];
    [self.photoCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.photoCollectionView.collectionViewLayout.collectionViewContentSize.height));
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return  CGSizeMake(self.width/5,self.width/5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return Number(0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EXUpPhotoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EXUpPhotoCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

/**
 * photoCollectionView

 @return return value description
 */
- (UICollectionView *)photoCollectionView{
    if(!_photoCollectionView){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _photoCollectionView =[[UICollectionView alloc] initWithFrame:CGRectZero
                                                  collectionViewLayout:layout];
        _photoCollectionView.backgroundColor = [UIColor clearColor];
        _photoCollectionView.showsHorizontalScrollIndicator = NO;
        _photoCollectionView.showsVerticalScrollIndicator =NO;
        _photoCollectionView.dataSource = self;
        _photoCollectionView.delegate = self;
    }
    return _photoCollectionView;
}

@end
