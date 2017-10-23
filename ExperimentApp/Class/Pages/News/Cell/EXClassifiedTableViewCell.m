//
//  EXClassifiedTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXClassifiedTableViewCell.h"
#import "EXShopInfoModel.h"

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


@end


@implementation EXClassifiedCollectionViewCell : UICollectionViewCell



@end








