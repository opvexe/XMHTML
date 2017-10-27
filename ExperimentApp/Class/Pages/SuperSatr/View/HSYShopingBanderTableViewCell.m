//
//  HSYShopingBanderTableViewCell.m
//  SuperstarUser
//
//  Created by snowlu on 2017/10/10.
//  Copyright © 2017年 HSY. All rights reserved.
//

#import "HSYShopingBanderTableViewCell.h"
#import "SDCycleScrollView.h"
#import "EXShopInfoModel.h"

@interface HSYShopingBanderTableViewCell()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleSrollView;
@property(nonatomic,strong)EXShopModel *model;
@end
@implementation HSYShopingBanderTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"HSYShopingBanderTableViewCell";
    HSYShopingBanderTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HSYShopingBanderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(void)EX_initConfingViews{
  
    self.cycleSrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
    self.cycleSrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    self.cycleSrollView.currentPageDotColor =UIColorFromRGB(0xffffff);
    self.cycleSrollView.pageDotColor = UIColorFromRGBA(0xffffff,0.7);
    [self.contentView addSubview:self.cycleSrollView];
    [self.cycleSrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];

}
-(void)InitDataWithModel:(EXShopModel *)model{
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
+(CGFloat)getCellHeight:(EXShopModel *)model{
    
    return Number(120);
}

#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.model.datas.count>=index) {
        EXShopModel *model = self.model.datas[index];
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didSelectItemAtType:model:atSectionModel:)]) {
            [self.delegate  didSelectItemAtType:model.TouchType model:model atSectionModel:self.model];
        }
    }
}

@end
