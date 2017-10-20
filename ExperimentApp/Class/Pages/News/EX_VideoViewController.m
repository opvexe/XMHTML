//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"
#import "EXVideoPoorTableViewCell.h"

static NSInteger pages;

@interface EX_VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *newsTableView;
@end

@implementation EX_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"超级巨星";
    [self.view addSubview:self.newsTableView];
    
    pages = 1 ;
    [self loadDataSocre];
}

-(void)loadDataSocre{
    
    WS(weakSelf)
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithVideoH5AlertCompleteSuccessfull:^(id responseObject) {
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithVideoBannnerCompleteSuccessfull:^(id responseObject) {
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithVideoRunNoticeCompleteSuccessfull:^(id responseObject) {
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithVideoShowCompleteSuccessfull:^(id responseObject) {
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithVideoRecommendList:pages CompleteSuccessfull:^(id responseObject) {
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        dispatch_group_leave(group);
    }];
    
    //回调Block
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [_newsTableView reloadData];
    });
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EXVideoPoorTableViewCell   *cell = [EXVideoPoorTableViewCell CellWithTableView:tableView];
    
    return cell;
}


-(UITableView *)newsTableView{
    if (!_newsTableView) {
        _newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavBarHeight - HS_TabbarHeight) style:UITableViewStylePlain];
        _newsTableView.showsVerticalScrollIndicator              =YES;
        _newsTableView.showsHorizontalScrollIndicator            =NO;
        _newsTableView.backgroundColor                           =[UIColor whiteColor];
        _newsTableView.dataSource                                =self;
        _newsTableView.delegate                                  =self;
        if (@available(iOS 11.0, *)){
            _newsTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _newsTableView.estimatedRowHeight = 0.f;
            _newsTableView.estimatedSectionHeaderHeight=0.f;
            _newsTableView.estimatedSectionFooterHeight=0.f;
        }
        _newsTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _newsTableView.tableFooterView                           =[UIView new];
    }
    return _newsTableView;
}
@end

