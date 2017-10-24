//
//  EX_VideoViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/24.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"

@interface EX_VideoViewController ()

@end

@implementation EX_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/














#pragma mark   video  delloc
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


@end
