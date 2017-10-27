//
//  EX_LeftController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_LeftController.h"
#import "EX_leftHeadView.h"
#import "EX_LeftTableViewCell.h"
#import "EX_PracticeController.h"
#import "EXSubjectViewController.h"
#import "UIViewController+CWLateralSlide.h"
#import "EXLeftModel.h"
@interface EX_LeftController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *choiceTableView;
@property(nonatomic, strong)EX_leftHeadView *leftHeadView;
@property(nonatomic, strong)NSArray *dateSouceArray;
@end

@implementation EX_LeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *dictArray = @[@{@"title":@"道路工程"},
                           @{@"title":@"公共基础"},
                           @{@"title":@"桥梁隧道工程"},
                           @{@"title":@"交通工程"}];
    _dateSouceArray = [EXLeftModel mj_objectArrayWithKeyValuesArray:dictArray];
    [self.view addSubview:self.choiceTableView];
}








/**
 Description

 @param tableView tableView description
 @param section section description
 @return return value description
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateSouceArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EX_LeftTableViewCell    *cell = [EX_LeftTableViewCell CellWithTableView:tableView];
    [cell InitDataViewModel:self.dateSouceArray[indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    EXSubjectViewController *vc = [[EXSubjectViewController alloc]init];
    [self cw_pushViewController:vc];
}













/**
 Description

 @return return value description
 */
-(UITableView *)choiceTableView{
    if (!_choiceTableView) {
        _choiceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,  SCREEN_WIDTH * 0.75,SCREEN_HEIGHT - 180) style:UITableViewStylePlain];
        _choiceTableView.showsVerticalScrollIndicator              =NO;
        _choiceTableView.showsHorizontalScrollIndicator            =NO;
        _choiceTableView.scrollEnabled                             =NO;
        _choiceTableView.backgroundColor                           = [UIColor whiteColor];
        _choiceTableView.dataSource                                =self;
        _choiceTableView.delegate                                  =self;
        _choiceTableView.tableHeaderView                           =self.leftHeadView;
        _choiceTableView.rowHeight                                 = 60.0;
        _choiceTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _choiceTableView.tableFooterView                           =[UIView new];
    }
    return _choiceTableView;
}

-(EX_leftHeadView *)leftHeadView{
    if (!_leftHeadView) {
        _leftHeadView= [[EX_leftHeadView alloc]initWithFrame:CGRectMake(0, 0,  SCREEN_WIDTH * 0.75, 180.0)];
        _leftHeadView.cutChoiceBlock = ^{
            NSLog(@"选择科目");
        };
    }
    return _leftHeadView;
}

-(NSArray *)dateSouceArray{
    if (!_dateSouceArray) {
        _dateSouceArray =[NSArray array];
    }
    return _dateSouceArray;
}
@end

