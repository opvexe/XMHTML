//
//  EXBannerView.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/2.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXBannerView.h"
#import "SDCycleScrollView.h"

@interface EXBannerView ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleSrollView;
@end
@implementation EXBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.cycleSrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:PlaceholderImageName]];
        self.cycleSrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        self.cycleSrollView.currentPageDotColor =UIColorFromRGB(0xffffff);
        self.cycleSrollView.pageDotColor = UIColorFromRGBA(0xffffff,0.7);
        [self addSubview:self.cycleSrollView];
        [self.cycleSrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}


/**
 Description

 @param model model description
 */
-(void)InitDataWithModel:(EX_BaseModel*)model{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cycleSrollView.localizationImageNamesGroup = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    });
}

#pragma mark <SDCycleScrollViewDelegate>

/**
 Description

 @param cycleScrollView cycleScrollView description
 @param index index description
 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}
@end
