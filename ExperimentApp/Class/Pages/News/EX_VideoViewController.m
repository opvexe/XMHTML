//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"
#import "EX_VideoCell.h"

@interface EX_VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *newsTableView;
@end

@implementation EX_VideoViewController

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
        //iOS 11
        _newsTableView.estimatedSectionHeaderHeight=0;
        _newsTableView.estimatedSectionFooterHeight=0;
        _newsTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _newsTableView.tableFooterView                           =[UIView new];
    }
    return _newsTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{       ///1个cell 上20个
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     EX_VideoCell   *cell = [EX_VideoCell CellWithTableView:tableView];
    
    return cell;
}
@end

