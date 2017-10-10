//
//  EX_LeftController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_LeftController.h"
#import "EX_LeftTableViewCell.h"
#import "EX_leftHeadView.h"
#import "EX_PracticeController.h"

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
    _dateSouceArray = [EX_BaseModel mj_objectArrayWithKeyValuesArray:dictArray];
    [self.view addSubview:self.choiceTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateSouceArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EX_LeftTableViewCell    *cell = [EX_LeftTableViewCell CellWithTableView:tableView];
    [cell InitDataViewModel:self.dateSouceArray[indexPath.row]];
    //    [cell addBottomBorderWithColor:[UIColor lightGrayColor] andWidth:0.5];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


-(UITableView *)choiceTableView{
    if (!_choiceTableView) {
        _choiceTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
        _leftHeadView= [[EX_leftHeadView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180.0)];
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

