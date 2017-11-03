//
//  EX_PracticeController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_PracticeController.h"
#import "EX_praticeHeadView.h"
#import "EX_PracticeCell.h"
#import "UIViewController+CWLateralSlide.h"
#import "EX_LeftController.h"
@interface EX_PracticeController ()<UITableViewDelegate,UITableViewDataSource,EXTableViewCellButtonActionProtocol>
@property(nonatomic, strong)UITableView *practiceTableView;
@property(nonatomic, strong)EX_praticeHeadView *headView;
@property(nonatomic,strong)NSMutableArray *urls;
@end

@implementation EX_PracticeController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftOpen:) image:@"room_btn_more" highImage:@"room_btn_more"];
    self.navigationItem.title = @"公共基础";
    for (int i = 0; i<3; i++) {
        [self.urls addObject:[NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_%02d.mp4", i]];
    }
    [self.view addSubview:self.practiceTableView];
    [self.practiceTableView reloadData];
}


/**
 * 左侧抽屉

 @param sender sender description
 */
-(void)leftOpen:(id)sender{
    EX_LeftController *vc = [[EX_LeftController alloc]init];
    [self cw_showDrawerViewController:vc animationType:CWDrawerAnimationTypeMask configuration:nil];
}

#pragma mark  <UITableViewDelegate>
/**
 Description

 @param tableView tableView description
 @param section section description
 @return return value description
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.urls.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EX_PracticeCell    *cell = [EX_PracticeCell CellWithTableView:tableView];
     cell.url = self.urls[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",indexPath);
}


#pragma mark  ios  8.0 删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {            ///删除
        MCDownloadReceipt *receipt = [[MCDownloader sharedDownloader] downloadReceiptForURLString:self.urls[indexPath.row]];
        [[MCDownloader sharedDownloader] remove:receipt completed:^{
          [self.urls removeObjectAtIndex:indexPath.row];
           [self.practiceTableView reloadData];
        }];
    }
}

#pragma mark <EXTableViewCellButtonActionProtocol>
-(void)ex_ClickButtonTableViewCell:(EX_PracticeCell *)tableViewCell selectIndex:(NSUInteger)index{
    MCDownloadReceipt *receipt = [[MCDownloader sharedDownloader] downloadReceiptForURLString:tableViewCell.url];
    NSLog(@"文件地址:%@",receipt.filePath);
}


/**
 Description

 @return return value description
 */
-(UITableView *)practiceTableView{
    if (!_practiceTableView) {
        _practiceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT - NavBarHeight - HS_TabbarHeight) style:UITableViewStylePlain];
        _practiceTableView.showsVerticalScrollIndicator              =YES;
        _practiceTableView.showsHorizontalScrollIndicator            =NO;
        _practiceTableView.backgroundColor                           =[UIColor colorWithRed:237/255.0 green: 237/255.0 blue:237/255.0 alpha:0.5];
        _practiceTableView.dataSource                                =self;
        _practiceTableView.delegate                                  =self;
        _practiceTableView.tableHeaderView                           =self.headView;
        _practiceTableView.rowHeight                                 = 80.0;
        
        if(@available(iOS 11.0, *)) {
            _practiceTableView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
            _practiceTableView.estimatedRowHeight=0;
            _practiceTableView.estimatedSectionHeaderHeight=0;
            _practiceTableView.estimatedSectionFooterHeight=0;
        }
        _practiceTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _practiceTableView.tableFooterView                           =[UIView new];
    }
    return _practiceTableView;
}


-(EX_praticeHeadView *)headView{
    if (!_headView) {
        _headView = [[EX_praticeHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200.0)];
        _headView.practiceBlock = ^(NSInteger tag) {
            NSLog(@"%ld",tag);
        };
    }
    return _headView;
}

-(NSMutableArray *)urls{
    if (!_urls) {
        _urls = [NSMutableArray arrayWithCapacity:0];
    }
    return _urls;
}
@end
