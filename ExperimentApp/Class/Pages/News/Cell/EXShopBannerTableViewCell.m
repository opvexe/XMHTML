//
//  EXShopBannerTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopBannerTableViewCell.h"
#import "SDCycleScrollView.h"
#import "EXShopInfoModel.h"

@interface EXShopBannerTableViewCell ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleSrollView;
@property(nonatomic,strong)EXShopModel *model;
@end
@implementation EXShopBannerTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXShopBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXShopBannerTableViewCell class])];
    if (!cell) {
        cell = [[EXShopBannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXShopBannerTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.cycleSrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
        self.cycleSrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        self.cycleSrollView.currentPageDotColor =UIColorFromRGB(0xffffff);
        self.cycleSrollView.pageDotColor = UIColorFromRGBA(0xffffff,0.7);
        [self.contentView addSubview:self.cycleSrollView];
        [self.cycleSrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
        
    }
    return self;
}

-(void)InitDataViewModel:(EXShopModel *)model{
    
    self.model = model;
    NSMutableArray *urls = [NSMutableArray arrayWithCapacity:0];
    for (EXShopModel *tempModel in model.datas) {
        NSString *url =@"";
        if ([tempModel.MIME  isEqualToString:@"APPLICATION/GOOD"]) {
            url = convertToString(tempModel.url);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/VIDEO"]){
            url = convertToString(tempModel.picurl);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/ACTIVITY"]){
            url = convertToString(tempModel.brandLogo);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/REPRESENT"]){
            url = convertToString(tempModel.actimg);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/ARTIS"]){
            url = convertToString(tempModel.picUrl);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/BANNER"]){
            url = convertToString(tempModel.pic);
        }else if ([tempModel.MIME  isEqualToString:@"APPLICATION/CHANNEL"]){
            url =convertToString(tempModel.icon_url);
        }
        [urls addObject:url];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cycleSrollView.imageURLStringsGroup = urls;
    });
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
 
    if (self.model.sections.count>=index) {
        EXShopModel *model = self.model.sections[index];
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model:atSectionModel:)]) {
              [self.delegate  didSelectItemAtType:model.TouchType model:model atSectionModel:self.model];
        }
    }
}

+(CGFloat)getCellHeight:(EXShopInfoModel *)model{
   
    return model.CellHeight;
}
@end
