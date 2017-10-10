//
//  EX_PracticeController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeController.h"
#import "EX_DrawerController.h"
#import "EX_praticeHeadView.h"
#import "EX_PracticeCell.h"
@interface EX_PracticeController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *practiceTableView;
@property(nonatomic, strong)EX_praticeHeadView *headView;
@end

@implementation EX_PracticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftOpen:) image:@"room_btn_more" highImage:@"room_btn_more"];
    self.navigationItem.title = @"公共基础";
    
    
    [self.view addSubview:self.practiceTableView];
}

-(void)leftOpen:(id)sender{
    [(EX_DrawerController *)KEY_WINDOW.rootViewController showLeft];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EX_PracticeCell    *cell = [EX_PracticeCell CellWithTableView:tableView];

    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, X_ScreenWidth, 30)];
    footView.backgroundColor = [UIColor redColor];
    return footView;
}


-(UITableView *)practiceTableView{
    if (!_practiceTableView) {
        _practiceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, X_ScreenWidth, X_ScreenHeight - X_StatusBarAndNavigationBarHeight - X_TabbarHeight) style:UITableViewStylePlain];
        _practiceTableView.showsVerticalScrollIndicator              =YES;
        _practiceTableView.showsHorizontalScrollIndicator            =NO;
        _practiceTableView.backgroundColor                           = [UIColor whiteColor];
        _practiceTableView.dataSource                                =self;
        _practiceTableView.delegate                                  =self;
        _practiceTableView.tableHeaderView                           =self.headView;
        _practiceTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _practiceTableView.tableFooterView                           =[UIView new];
    }
    return _practiceTableView;
}


-(EX_praticeHeadView *)headView{
    if (!_headView) {
        _headView = [[EX_praticeHeadView alloc]initWithFrame:CGRectMake(0, 0, X_ScreenWidth, 200.0)];
        _headView.practiceBlock = ^(NSInteger tag) {
            NSLog(@"%ld",tag);
        };
    }
    return _headView;
}
@end
