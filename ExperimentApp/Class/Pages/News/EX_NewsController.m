//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_NewsController.h"
#import "EX_NewsCell.h"

@interface EX_NewsController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *newsTableView;
@end

@implementation EX_NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"超级巨星";
    
    [self.view addSubview:self.newsTableView];
}



-(UITableView *)newsTableView{
    if (!_newsTableView) {
        _newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavBarHeight - HS_TabbarHeight) style:UITableViewStylePlain];
        _newsTableView.showsVerticalScrollIndicator              =YES;
        _newsTableView.showsHorizontalScrollIndicator            =NO;
        _newsTableView.backgroundColor                           =[UIColor whiteColor];
        _newsTableView.dataSource                                =self;
        _newsTableView.delegate                                  =self;
        _newsTableView.estimatedRowHeight = 100.f;
        
        if(@available(iOS 11.0, *)) {
            _newsTableView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
            _newsTableView.estimatedSectionHeaderHeight=0;
            _newsTableView.estimatedSectionFooterHeight=0;
        }
        _newsTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _newsTableView.tableFooterView                           =[UIView new];
    }
    return _newsTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{       ///1个cell 上20个 
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  EX_NewsCell    *cell = [EX_NewsCell CellWithTableView:tableView];
    
    return cell;
}
@end
