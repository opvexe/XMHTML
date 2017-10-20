//
//  EX_NewsCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/11.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_NewsCell.h"
#import "EX_NewsCollectionViewCell.h"

@interface EX_NewsCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@end
@implementation EX_NewsCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EX_NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EX_NewsCell class])];
    if (!cell) {
        cell = [[EX_NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EX_NewsCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.with.bottom.with.left.with.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(100.0);
        }];
        
        [self.contentView layoutIfNeeded];
        [self.collectionView reloadData];
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {        ///计算collectionView的高度
            make.height.equalTo(@(self.collectionView.collectionViewLayout.collectionViewContentSize.height));
        }];
    }
    return self;
}

+(CGFloat)getCellHeight:(EX_BaseModel *)model{
    
    return UITableViewAutomaticDimension;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EX_NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EX_NewsCollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor =  ColorRandom;
    return cell;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/2 - 40, 100);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor =[UIColor clearColor];
        [_collectionView registerClass:[EX_NewsCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([EX_NewsCollectionViewCell class])];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
@end
