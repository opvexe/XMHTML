//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"
#import "EXShopMallsPoorTableViewCell.h"
#import "EXShopBannerTableViewCell.h"
#import "EXClassifiedTableViewCell.h"
#import "EXRecommendTableViewCell.h"
#import "EXDailyWillBuyTableViewCell.h"
#import "EXShopInfoModel.h"

static NSInteger pages;

@interface EX_VideoViewController ()<UITableViewDelegate,UITableViewDataSource,EX_BaseTableViewCellActionProtocol>
@property(nonatomic, strong)UITableView *shoppingMallTableView;
@property(nonatomic, strong)NSMutableArray *shoppingMalls;
@end

@implementation EX_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"超级巨星";
    [self.view addSubview:self.shoppingMallTableView];
    [self.shoppingMallTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    WS(weakSelf)
    self.shoppingMallTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf tableViewDidTriggerFooterRefresh];
        [weakSelf.shoppingMallTableView.mj_footer beginRefreshing];
    }];
    self.shoppingMallTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf tableViewDidTriggerHeaderRefresh];
        [weakSelf.shoppingMallTableView.mj_header beginRefreshing];
    }];
    [self tableViewDidTriggerHeaderRefresh];
}

/**
 上拉刷新
 */
-(void)tableViewDidTriggerFooterRefresh{
    pages++;
   [self loadDataSoucre];
}

/**
 * 下拉加载
 */
-(void)tableViewDidTriggerHeaderRefresh{
    pages = 1;
    [self.shoppingMalls removeAllObjects];
    [self loadDataSoucre];
}

/**
 * 无网络占位图点击加载
 */
-(void)reloadDataSoucre{
    self.shoppingMallTableView.mj_header.hidden  =NO;
    self.shoppingMallTableView.mj_footer.hidden  =NO;
    [self loadDataSoucre];
}

/**
 * 数据加载
 */
-(void)loadDataSoucre{
    
    WS(weakSelf)
    if (pages == 1) {
        [EXSeviceRequestManger GetWithShopInterfaceCompleteSuccessfull:^(id responseObject) {
            NSArray *tempShopMalls = [EXShopModel mj_objectArrayWithKeyValuesArray:responseObject];
            NSLog(@"responseObject:%@",responseObject);
            
            for (EXShopModel *model in tempShopMalls) {
                switch (model.template_type) {
                    case TemplateCellTypeShopingBanderTableViewCell:{
                        model.ClassName  = @"EXShopBannerTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeRecommendTableViewCell:
                    {
                        model.ClassName  = @"EXRecommendTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithArray:model.datas];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeClassifiedTableViewCell:{
                        model.ClassName  = @"EXClassifiedTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeDailyWillBuyTableViewCell:{
                        model.ClassName  = @"EXDailyWillBuyTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeThePoorTableViewCell:{
                        model.ClassName  = @"EXShopMallsPoorTableViewCell";
                        if (model.datas.count) {
                            model.sections = [self ToConvertAnArrayType:model.datas  type:model.interfaceType];
                        }else{
                            [self InitDataCannelIdWithModel:model cell:nil];
                        }
                        break;
                    }
                    default:{
                        break;
                    }
                }
                [self.shoppingMalls addObject:model];
            }
            [self.shoppingMallTableView reloadData];
            
            if (!self.shoppingMalls.count) {
                self.shoppingMallTableView.mj_header.hidden  =YES;
                self.shoppingMallTableView.mj_footer.hidden  =YES;
                [self createPlaceholderView:nil message:@"暂无数据" image:[UIImage imageNamed:@"shopping"] withView:self.shoppingMallTableView];
            }else{
                [self removePlaceholderView];
            }
            
            [weakSelf.shoppingMallTableView.mj_footer endRefreshing];
            [weakSelf.shoppingMallTableView.mj_header endRefreshing];
        } failure:^(NSError *error, NSDictionary *errorInfor) {         ///网络异常占位图
            if (!self.shoppingMalls.count) {
                [weakSelf createPlaceholderView:@"" message:nil image:[UIImage imageNamed:@"shopping"] withView:weakSelf.shoppingMallTableView refTitle:@"点击重新加载" action:@selector(reloadDataSoucre)];
            }else{
                [weakSelf removePlaceholderView];
            }
            [weakSelf.shoppingMallTableView.mj_footer endRefreshing];
            [weakSelf.shoppingMallTableView.mj_header endRefreshing];
        }];
        
    }else{              ///数据分页处理
        
        NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
        EXShopModel *model = self.shoppingMalls.lastObject;
        [paraDic setValue:@{@"no":@(pages)} forKey:@"page"];
        [EXSeviceRequestManger POSTWithShopPagesURL:model.content_data_url pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
            
            EXShopModel *result =[EXShopModel mj_objectWithKeyValues:responseObject];
            NSArray *originalDatas =result.records;
            NSMutableArray *sections = [NSMutableArray arrayWithArray:model.sections];
            [sections addObjectsFromArray:[self ToConvertAnArrayType:originalDatas type:InterfaceTypeOld].mutableCopy];
            model.sections = sections;
            [self.shoppingMallTableView reloadData];
            if (!self.shoppingMalls.count) {
                self.shoppingMallTableView.mj_header.hidden  =YES;
                self.shoppingMallTableView.mj_footer.hidden  =YES;
                [self createPlaceholderView:nil message:@"暂无数据" image:[UIImage imageNamed:@"shopping"] withView:self.shoppingMallTableView];
            }else{
                [self removePlaceholderView];
            }
            [weakSelf.shoppingMallTableView.mj_footer endRefreshing];
            [weakSelf.shoppingMallTableView.mj_header endRefreshing];
            
        } failure:^(NSError *error, NSDictionary *errorInfor) {
            if (!self.shoppingMalls.count) {
                [weakSelf createPlaceholderView:@"" message:nil image:[UIImage imageNamed:@"shopping"] withView:weakSelf.shoppingMallTableView refTitle:@"点击重新加载" action:@selector(reloadDataSoucre)];
            }else{
                [weakSelf removePlaceholderView];
            }
            [weakSelf.shoppingMallTableView.mj_footer endRefreshing];
            [weakSelf.shoppingMallTableView.mj_header endRefreshing];
            
        }];
    }
}


/**
 瀑布流数据左右处理
 
 @param originalArrary originalArrary description
 @param type type description
 @return return value description
 */
-(NSArray *)ToConvertAnArrayType:(NSArray *)originalArrary  type:(InterfaceType) type{
    
    NSMutableArray *newDatas= [NSMutableArray new];
    NSMutableArray *newData = [NSMutableArray new];
    for (int i =0; i <originalArrary.count; i++) {
        if (!(i%2)) {
            newData = [NSMutableArray new];
            if (type ==InterfaceTypeOld) {
                EXShopModel *newsModel= originalArrary[i];
                newsModel.goods.MIME =@"APPLICATION/GOOD";
                newsModel.goods.btn_name =@"立即选购";
                newsModel.goods.url =newsModel.goods.logo.url;
                [newData addObject:newsModel.goods];
            }else{
                [newData addObject:originalArrary[i]];
            }
        }
        else
        {
            if (type ==InterfaceTypeOld) {
                EXShopModel *newsModel = [EXShopModel new];
                EXShopModel *goods = originalArrary[i];
                goods.goods.MIME =@"APPLICATION/GOOD";
                goods.goods.btn_name =@"立即选购";
                goods.goods.url = goods.goods.logo.url;
                [newData addObject:goods.goods];
                newsModel.datas = newData;
                [newDatas addObject:newsModel];
            }else{
                EXShopModel *newsModel = [EXShopModel new];
                [newData addObject:originalArrary[i]];
                newsModel.datas =newData;
                [newDatas addObject:newsModel];
            }
        }
    }
    return  newDatas;
}


/**
 商城分页请求数据
 
 @param model model description
 @param cell cell description
 */
-(void)InitDataCannelIdWithModel:(EXShopModel *)model cell:(EX_BaseTbaleViewCell *)cell {
    NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
    switch (model.interfaceType) {
        case InterfaceTypeOld:
        {
            [paraDic setValue:@{@"no":@1} forKey:@"page"];
            [EXSeviceRequestManger POSTWithShopPagesURL:model.content_data_url pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
                [self.shoppingMalls enumerateObjectsUsingBlock:^(EXShopModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj  isEqual:model]) {
                        EXShopModel *result =[EXShopModel mj_objectWithKeyValues:responseObject];
                        NSArray *originalDatas =result.records;
                        model.sections = [self ToConvertAnArrayType:originalDatas type:model.interfaceType];
                        *stop  = YES;
                    };
                }];
                [self.shoppingMallTableView reloadData];
            } failure:^(NSError *error, NSDictionary *errorInfor) { }];
        }
            break;
        default:
        {
            [paraDic setValue:model.channel_id forKey:@"channel_id"];
            [EXSeviceRequestManger GetWithShopPoorPamDic:paraDic CompleteSuccessfull:^(id responseObject) {
                [self.shoppingMalls enumerateObjectsUsingBlock:^(EXShopModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj  isEqual:model]) {
                        NSArray *originalDatas =[[EXShopModel mj_objectArrayWithKeyValuesArray:responseObject].firstObject datas];
                        model.sections = [self ToConvertAnArrayType:originalDatas type:model.interfaceType];
                        *stop  = YES;
                    }
                }];
                [self.shoppingMallTableView reloadData];
            } failure:^(NSError *error, NSDictionary *errorInfor) { }];
            
            break;
        }
    }
}



/**
 Description

 @param tableView tableView description
 @param section section description
 @return return value description
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    EXShopInfoModel *model = self.shoppingMalls[section];
    return model.sections.count;
}


/**
 Description

 @param tableView tableView description
 @return return value description
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.shoppingMalls.count;
}

/**
 heightForRowAtIndexPath

 @param tableView tableView description
 @param indexPath indexPath description
 @return return value description
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EXShopInfoModel *model = self.shoppingMalls[indexPath.section];
    return [NSClassFromString(model.ClassName) getCellHeight:model.sections[indexPath.row]];
}


/**
 cellForRowAtIndexPath

 @param tableView tableView description
 @param indexPath indexPath description
 @return return value description
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EXShopModel*model = self.shoppingMalls[indexPath.section];
    EX_BaseTbaleViewCell  *cell ;
    switch (model.template_type) {
        case   TemplateCellTypeShopingBanderTableViewCell:{
            cell = [EXShopBannerTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeRecommendTableViewCell:{
            cell = [EXRecommendTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeClassifiedTableViewCell:{
            cell = [EXClassifiedTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeDailyWillBuyTableViewCell:{
            cell = [EXDailyWillBuyTableViewCell CellWithTableView:tableView];
            break;
        }
        default:
            cell = [EXShopMallsPoorTableViewCell CellWithTableView:tableView];
            break;
    }
    
    EXShopModel *rowModel = model.sections[indexPath.row];
    if (model.MIME.length&&model.MIME) {
        rowModel.MIME = model.MIME;
    }
    
    if (!rowModel.datas.count&&rowModel.content_data_url.length) {
        [self InitDataCannelIdWithModel:rowModel cell:cell];
    }else{
        [cell InitDataViewModel:rowModel];
    }
    
    cell.delegate = self ;
    return cell;
}


/**
 点击对应的Cell 获取对应的数据模型Model

 @param type type description
 @param model model description
 @param atSectionModel atSectionModel description
 */
-(void)didSelectItemAtType:(EXXBaseTableViewCellTouchType)type model:(EX_BaseModel *)model atSectionModel:(EX_BaseModel*) atSectionModel{
    
    switch (type) {
        case EXBaseTableViewCellTouchTypeGOOD:      ///商品
        {
            
        }
            break;
            case EXBaseTableViewCellTouchTypeVIDEO:    ///视频
        {
            
        }
            break;
        case EXBaseTableViewCellTouchTypeACTIVITY:{     ///代言活动
            
        }
            break;
            case EXBaseTableViewCellTouchTypeREPRESENT:  ///展示
        {
            
        }
            break;
            case EXBaseTableViewCellTouchTypeARTIS:
        {
            
        }
            break;
            case EXBaseTableViewCellTouchTypeBANNER:    ///轮播
        {
            
        }
            break;
            case EXBaseTableViewCellTouchTypeCHANNEL:       ///频道
        {
            
        }
            break;
            
            case EXBaseTableViewCellTouchTypeEVENMORE:      ///更多
        {
            
        }
            break;
        default:
            break;
    }
}

/**
 Cell数据模型赋值
 
 @param model model description
 @param cell cell description
 @param section section description
 */
-(void)InitDataWithModel:(EXShopModel *)model cell:(EX_BaseTbaleViewCell *)cell  SectionModel:(EXShopModel *)section{
    NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
    
    [EXSeviceRequestManger POSTWithShopPagesURL:model.content_data_url pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
        EXShopModel*tempModel =   [EXShopModel mj_objectArrayWithKeyValuesArray:responseObject].firstObject;
        if (tempModel.datas.count) {
            [cell InitDataViewModel:tempModel];
        }
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        
    }];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark  footer&&header
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}


/**
 heightForHeaderInSection

 @param tableView tableView description
 @param section section description
 @return return value description
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    EXShopModel*model = self.shoppingMalls[section];
    if (model.template_type == TemplateCellTypeShopingBanderTableViewCell ||model.template_type ==TemplateCellTypeClassifiedTableViewCell){
        return 0;
    }
    if (!model.content_name.length) {
        return 0;
    }
    return Number(44);
}


/**
 区头视图

 @param tableView tableView description
 @param section section description
 @return return value description
 */
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    EXShopModel*model = self.shoppingMalls[section];
    if (model.template_type == TemplateCellTypeShopingBanderTableViewCell ||model.template_type ==TemplateCellTypeClassifiedTableViewCell){
        return nil;
    }
    if (!model.content_name.length) {
        return nil;
    }
    UIView *headBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Number(44))];
    headBackView.backgroundColor = HSYColorfafafa;
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor whiteColor];
    [headBackView addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Number(10));
        make.left.and.right.bottom.mas_equalTo(0);
    }];
    UILabel *titleLabel = [UILabel new];
    titleLabel.font= FontPingFangSC(13);
    titleLabel.textColor = TitleColor;
    [headerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(Number(20));
        make.right.mas_equalTo(Number(-10));
        make.left.mas_equalTo(Number(10));
        make.top.mas_equalTo(5);
    }];
    UIView *leftView= [UIView new];
    leftView.backgroundColor =UIColorFromRGB(0xff758c);
    [headerView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(titleLabel.mas_bottom);
        make.width.mas_equalTo(Number(2));
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(titleLabel.mas_top);
    }];
    titleLabel.text = model.content_name;
    return headBackView;
}



/**
 shoppingMallTableView

 @return return value description
 */
-(UITableView *)shoppingMallTableView{
    if (!_shoppingMallTableView) {
        _shoppingMallTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _shoppingMallTableView.showsVerticalScrollIndicator              =YES;
        _shoppingMallTableView.showsHorizontalScrollIndicator            =NO;
        _shoppingMallTableView.backgroundColor                           =[UIColor whiteColor];
        _shoppingMallTableView.dataSource                                =self;
        _shoppingMallTableView.delegate                                  =self;
        if (@available(iOS 11.0, *)){
            _shoppingMallTableView.estimatedRowHeight = 0.f;
            _shoppingMallTableView.estimatedSectionHeaderHeight=0.f;
            _shoppingMallTableView.estimatedSectionFooterHeight=0.f;
        }
        _shoppingMallTableView.separatorStyle                            =UITableViewCellSeparatorStyleNone;
        _shoppingMallTableView.tableFooterView                           =[UIView new];
    }
    return _shoppingMallTableView;
}

-(NSMutableArray *)shoppingMalls{
    if (!_shoppingMalls) {
        _shoppingMalls = [NSMutableArray arrayWithCapacity:0];
    }
    return _shoppingMalls;
}
@end

