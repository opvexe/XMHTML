//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"
#import "EXVideoPoorTableViewCell.h"
#import "EXShopBannerTableViewCell.h"
#import "EXVideoShowTableViewCell.h"

#import "EXShopInfoModel.h"

static NSInteger pages;

@interface EX_VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *newsTableView;
@property(nonatomic, strong)NSMutableArray *videoDatesouce;
@end

@implementation EX_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"超级巨星";
    
    pages = 1 ;
    [self loadDataSocre];
//    [self.view addSubview:self.newsTableView];
}

-(void)loadDataSocre{
    
    [EXSeviceRequestManger GetShopInterfaceCompleteSuccessfull:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    EXShopInfoModel *model = self.videoDatesouce[section];
    return model.sections.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EXShopInfoModel *model = self.videoDatesouce[indexPath.section];
    return [NSClassFromString(model.ClassName) getCellHeight:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EXShopInfoModel *model = self.videoDatesouce[indexPath.section];
    EX_BaseTbaleViewCell  *cell ;
    switch (model.template_type) {
        case   TemplateCellTypeShopingBanderTableViewCell:{
            cell = [EXShopBannerTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeRecommendTableViewCell:{
            cell = [EXVideoShowTableViewCell CellWithTableView:tableView];
            break;
        }
        default:
            cell = [EXVideoPoorTableViewCell CellWithTableView:tableView];
            break;
    }
    
    [cell InitDataViewModel:model];
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

-(NSMutableArray *)videoDatesouce{
    if (!_videoDatesouce) {
        _videoDatesouce = [NSMutableArray arrayWithCapacity:0];
    }
    return _videoDatesouce;
}
@end














#pragma mark   video 
/*
 -(void)loadDataSocre{
 
 WS(weakSelf)
 dispatch_group_t group = dispatch_group_create();
 
 dispatch_group_enter(group);
 [EXSeviceRequestManger GetWithVideoH5AlertCompleteSuccessfull:^(id responseObject) {
 
 NSArray *tempH5Alert = [EXVideoModel mj_objectArrayWithKeyValuesArray:responseObject];
 if (tempH5Alert.count>0) {NSLog(@"弹出H5 Alert");}
 dispatch_group_leave(group);
 } failure:^(NSError *error, NSDictionary *errorInfor) {
 dispatch_group_leave(group);
 }];
 
 dispatch_group_enter(group);
 [EXSeviceRequestManger GetWithVideoBannnerCompleteSuccessfull:^(id responseObject) {
 NSArray *tempVideo = [EXVideoModel mj_objectArrayWithKeyValuesArray:responseObject];
 EXVideoModel *model = [[EXVideoModel alloc]init];
 model.ClassName = @"EXShopBannerTableViewCell";
 model.MIME      = @"APPLICATION/BANNER";
 model.CellHeight = Number(110);
 model.template_type = TemplateCellTypeShopingBanderTableViewCell;
 model.sections = tempVideo;
 [weakSelf.videoDatesouce addObject:model];
 
 dispatch_group_leave(group);
 } failure:^(NSError *error, NSDictionary *errorInfor) {
 dispatch_group_leave(group);
 }];
 
 //    dispatch_group_enter(group);
 //    [EXSeviceRequestManger GetWithVideoRunNoticeCompleteSuccessfull:^(id responseObject) {
 //
 //        NSArray *tempVideo = [EXVideoModel mj_objectArrayWithKeyValuesArray:responseObject];
 //        EXVideoModel *model = [[EXVideoModel alloc]init];
 //        model.MIME      = @"APPLICATION/RUNNOTICE";
 //        model.sections = tempVideo;
 //        [weakSelf.videoDatesouce addObject:model];
 //
 //        dispatch_group_leave(group);
 //    } failure:^(NSError *error, NSDictionary *errorInfor) {
 //        dispatch_group_leave(group);
 //    }];
 
 dispatch_group_enter(group);
 [EXSeviceRequestManger GetWithVideoShowCompleteSuccessfull:^(id responseObject) {
 
 NSArray *tempVideo = [EXVideoModel mj_objectArrayWithKeyValuesArray:responseObject];
 EXVideoModel *model = [[EXVideoModel alloc]init];
 model.ClassName = @"EXVideoShowTableViewCell";
 model.MIME      = @"APPLICATION/SHOW";
 model.CellHeight = Number(120);
 model.template_type = TemplateCellTypeRecommendTableViewCell;
 model.sections = tempVideo;
 [weakSelf.videoDatesouce addObject:model];
 
 dispatch_group_leave(group);
 } failure:^(NSError *error, NSDictionary *errorInfor) {
 dispatch_group_leave(group);
 }];
 
 dispatch_group_enter(group);
 [EXSeviceRequestManger GetWithVideoRecommendList:pages CompleteSuccessfull:^(id responseObject) {
 
 NSArray *tempVideo = [EXVideoModel mj_objectArrayWithKeyValuesArray:responseObject];
 EXVideoModel *model = [[EXVideoModel alloc]init];
 model.ClassName = @"EXVideoPoorTableViewCell";
 model.MIME      = @"APPLICATION/GOOD";
 model.CellHeight = Number(69.0);
 model.template_type = TemplateCellTypeVideoShowTableViewCell;
 model.sections = tempVideo;
 [weakSelf.videoDatesouce addObject:model];
 dispatch_group_leave(group);
 } failure:^(NSError *error, NSDictionary *errorInfor) {
 dispatch_group_leave(group);
 }];
 
 //回调Block
 dispatch_group_notify(group, dispatch_get_main_queue(), ^{
 [self.view addSubview:self.newsTableView];
 [_newsTableView reloadData];
 });
 }

 */




