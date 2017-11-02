//
//  EXKeyBoardFontViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/1.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXKeyBoardFontViewController.h"
#import "EXLeftTitleRightImageStyleTableViewCell.h"
#import "EXFontSpecialityTableViewCell.h"
#import "EXFontStyleModel.h"

@interface EXKeyBoardFontViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *styleTableView;
@property (nonatomic,strong) NSMutableArray  *styles;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@end

@implementation EXKeyBoardFontViewController
{
    BOOL _paragraphType;
    BOOL _shouldScrollToSelectedRow;
    BOOL _needReload;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithTableView];
    [self EX_GetDataSoucre];
}

-(void)initWithTableView{
    [self.view addSubview:self.styleTableView];
    [self.styleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}


-(void)EX_GetDataSoucre{
    NSArray *dateSouceArray =@[@{@"fontType":@2},@{@"fontType":@3},@{@"fontType":@1,@"title":@"字号",@"unfoldImage":@"keyboard_detail_icon",@"rightTitle":@"14px"},@{@"fontType":@1,@"title":@"颜色",@"unfoldImage":@"keyboard_detail_icon",@"rightImage":@"black"},@{@"fontType":@1,@"title":@"字号",@"unfoldImage":@"keyboard_detail_icon",@"rightTitle":@"普通"}];
    self.styles = [EXFontStyleModel mj_objectArrayWithKeyValuesArray:dateSouceArray];
    [self.styleTableView reloadData];
}


/**
 Description
 */
- (void)reload{
    
}
#pragma mark <UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.styles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  Number(60.0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EXFontStyleModel *model = self.styles[indexPath.row];
    EX_BaseTbaleViewCell  *cell ;
    switch (model.fontType) {
        case FontCellTypeBaseTableViewCell:
        {
            cell = [EXLeftTitleRightImageStyleTableViewCell CellWithTableView:tableView];
        }
            break;
        case FontCellTypeSpecialityTableViewCell:
        {
            cell = [EXFontSpecialityTableViewCell CellWithTableView:tableView];
        }
            break;
            
        case FontCellTypeSpaceTableViewCell:
        {
            cell = [EXFontSpaceTableViewCell CellWithTableView:tableView];
        }
            break;
        default:
            break;
    }
    [cell InitDataWithModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *indexPaths = [NSMutableArray array];
    if ([indexPath isEqual:self.selectedIndexPath]) {
        self.selectedIndexPath = nil;
    }else {
        if (self.selectedIndexPath) {
            [indexPaths addObject:self.selectedIndexPath];
        }
        self.selectedIndexPath = indexPath;
    }
    [indexPaths addObject:indexPath];
    _shouldScrollToSelectedRow = YES;
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}


/**
 * Cell 开始动画

 @param tableView tableView description
 @param cell cell description
 @param indexPath indexPath description
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath isEqual:self.selectedIndexPath]) {
        cell.selected = YES;
    }
}

/**
 * Cell 结束动画

 @param tableView tableView description
 @param cell cell description
 @param indexPath indexPath description
 */
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_shouldScrollToSelectedRow && [indexPath isEqual:self.selectedIndexPath]) {
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        _shouldScrollToSelectedRow = NO;
    }
}


#pragma mark  <styleTableView>
/**
 Description
 
 @return return value description
 */
-(UITableView *)styleTableView{
    if (!_styleTableView) {
        _styleTableView= [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _styleTableView.showsVerticalScrollIndicator =NO;
        _styleTableView.showsHorizontalScrollIndicator =NO;
        _styleTableView.dataSource = self;
        _styleTableView.delegate = self;
        _styleTableView.tableFooterView  =[UIView new];
        _styleTableView.estimatedRowHeight = 0;
        _styleTableView.backgroundColor =[UIColor whiteColor];
        _styleTableView.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    }
    return _styleTableView;
}

-(NSMutableArray *)styles{
    if (!_styles) {
        _styles = [NSMutableArray arrayWithCapacity:0];
    }
    return _styles;
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

@end

