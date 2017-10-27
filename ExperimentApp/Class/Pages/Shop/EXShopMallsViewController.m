//
//  EXShopMallsViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/24.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXShopMallsViewController.h"
#import "HSYShopingBanderTableViewCell.h"

@interface EXShopMallsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)UITableView *goodsDetailTableView;
@property(nonatomic, strong)NSMutableArray *goods;
@end

@implementation EXShopMallsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商品详情";
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   HSYShopingBanderTableViewCell  *cell = [HSYShopingBanderTableViewCell CellWithTableView:tableView];
    return cell;
}


-(UITableView *)goodsDetailTableView{
    if (!_goodsDetailTableView) {
        _goodsDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT - NavBarHeight - HS_TabbarHeight) style:UITableViewStylePlain];
        _goodsDetailTableView.showsVerticalScrollIndicator              =YES;
        _goodsDetailTableView.showsHorizontalScrollIndicator            =NO;
        _goodsDetailTableView.backgroundColor                           =[UIColor colorWithRed:237/255.0 green: 237/255.0 blue:237/255.0 alpha:0.5];
        _goodsDetailTableView.dataSource                                =self;
        _goodsDetailTableView.delegate                                  =self;
        if(@available(iOS 11.0, *)) {
            _goodsDetailTableView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
            _goodsDetailTableView.estimatedRowHeight=0;
            _goodsDetailTableView.estimatedSectionHeaderHeight=0;
            _goodsDetailTableView.estimatedSectionFooterHeight=0;
            _goodsDetailTableView.rowHeight                   =0;
        }
        _goodsDetailTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _goodsDetailTableView.tableFooterView                           =[UIView new];
    }
    return _goodsDetailTableView;
}

@end
