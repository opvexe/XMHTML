//
//  EX_NewsController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/9/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_VideoViewController.h"
#import "HSYShopingBanderTableViewCell.h"
#import "HSYClassifiedTableViewCell.h"
#import "HSYDailyWillBuyTableViewCell.h"
#import "HSYThePoorTableViewCell.h"
#import "HSYRecommendTableViewCell.h"
#import "EXShopInfoModel.h"

static  NSInteger  currentPage ;

@interface EX_VideoViewController ()<UITableViewDelegate,UITableViewDataSource,EX_BaseTableViewCellActionProtocol>
@property(nonatomic,strong)UITableView *shoppingMallListView;
@property(nonatomic,strong)NSMutableArray *shoppingMalls;
@end

@implementation EX_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self configView];
    [self tableViewDidTriggerHeaderRefresh];
}

-(void)configView{
    WS(weakSelf)
    self.shoppingMallListView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf tableViewDidTriggerFooterRefresh];
        [weakSelf.shoppingMallListView.mj_footer beginRefreshing];
    }];
    self.shoppingMallListView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf tableViewDidTriggerHeaderRefresh];
        [weakSelf.shoppingMallListView.mj_header beginRefreshing];
    }];
}
-(void)setupUI{
    self.navigationItem.title =@"超级巨星";
    [self.view addSubview:self.shoppingMallListView];
    [self.shoppingMallListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (void)tableViewDidTriggerHeaderRefresh
{
    currentPage = 1;
    [self.shoppingMalls removeAllObjects];
    [self loadDataSoucre];
}
- (void)tableViewDidTriggerFooterRefresh
{
    currentPage++;
    [self loadDataSoucre];
}
-(void)reloadDataSoucre{
    self.shoppingMallListView.mj_header.hidden  =NO;
    self.shoppingMallListView.mj_footer.hidden  =NO;
    [self loadDataSoucre];
}
-(void)loadDataSoucre{
    WS(weakSelf)
    
    if (currentPage==1) {
          [EXSeviceRequestManger GetWithShopInterfaceCompleteSuccessfull:^(id responseObject) {
            NSArray *tempShopMalls = [EXShopModel mj_objectArrayWithKeyValuesArray:responseObject];
            for (EXShopModel *model in tempShopMalls) {
                switch (model.template_type) {
                    case TemplateCellTypeShopingBanderTableViewCell:{
                        model.ClassName  = @"HSYShopingBanderTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeRecommendTableViewCell:
                    {
                        model.ClassName  = @"HSYRecommendTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithArray:model.datas];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeClassifiedTableViewCell:{
                        model.ClassName  = @"HSYClassifiedTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeDailyWillBuyTableViewCell:{
                        model.ClassName  = @"HSYDailyWillBuyTableViewCell";
                        NSMutableArray *datas = [NSMutableArray arrayWithObject:model];
                        model.sections = datas;
                        break;
                    }
                    case TemplateCellTypeThePoorTableViewCell:{
                        model.ClassName  = @"HSYThePoorTableViewCell";
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
            [self.shoppingMallListView reloadData];
            if (!self.shoppingMalls.count) {
                self.shoppingMallListView.mj_header.hidden  =YES;
                self.shoppingMallListView.mj_footer.hidden  =YES;
                [self createPlaceholderView:nil message:@"暂无数据" image:[UIImage imageNamed:@"shopping"] withView:self.shoppingMallListView];
            }else{
                [self removePlaceholderView];
            }
            [weakSelf.shoppingMallListView.mj_footer endRefreshing];
            [weakSelf.shoppingMallListView.mj_header endRefreshing];
          } failure:^(NSError *error, NSDictionary *errorInfor) {
              if (!self.shoppingMalls.count) {
                  [weakSelf createPlaceholderView:@"" message:nil image:[UIImage imageNamed:@"shopping"] withView:weakSelf.shoppingMallListView refTitle:@"点击重新加载" action:@selector(reloadDataSoucre)];
              }else{
                  [weakSelf removePlaceholderView];
              }
              [weakSelf.shoppingMallListView.mj_footer endRefreshing];
              [weakSelf.shoppingMallListView.mj_header endRefreshing];
          }];
    }else{
        NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
        EXShopModel *model = self.shoppingMalls.lastObject;
        [paraDic setValue:@{@"no":@(currentPage)} forKey:@"page"];
      [EXSeviceRequestManger POSTWithShopPagesURL:model.content_data_url  pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
            EXShopModel *result =[EXShopModel mj_objectWithKeyValues:responseObject];
            NSArray *originalDatas =result.records;
            NSMutableArray *sections = [NSMutableArray arrayWithArray:model.sections];
            [sections addObjectsFromArray:[self ToConvertAnArrayType:originalDatas type:InterfaceTypeOld].mutableCopy];
            model.sections = sections;
            [self.shoppingMallListView reloadData];
            if (!self.shoppingMalls.count) {
                self.shoppingMallListView.mj_header.hidden  =YES;
                self.shoppingMallListView.mj_footer.hidden  =YES;
                [self createPlaceholderView:nil message:@"暂无数据" image:[UIImage imageNamed:@"shopping"] withView:self.shoppingMallListView];
            }else{
                [self removePlaceholderView];
            }
            [weakSelf.shoppingMallListView.mj_footer endRefreshing];
            [weakSelf.shoppingMallListView.mj_header endRefreshing];
      } failure:^(NSError *error, NSDictionary *errorInfor) {
          if (!self.shoppingMalls.count) {
              [weakSelf createPlaceholderView:@"" message:nil image:[UIImage imageNamed:@"shopping"] withView:weakSelf.shoppingMallListView refTitle:@"点击重新加载" action:@selector(reloadDataSoucre)];
          }else{
              [weakSelf removePlaceholderView];
          }
          [weakSelf.shoppingMallListView.mj_footer endRefreshing];
          [weakSelf.shoppingMallListView.mj_header endRefreshing];
      }];
    }
}

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
#pragma mark CJXBaseTableViewCellActionProtocol
-(void)didSelectItemAtType:(EXXBaseTableViewCellTouchType)type model:(EXShopModel *)model atSectionModel:(EXShopModel*) atSectionModel{
    switch (type) {
        case EXBaseTableViewCellTouchTypeGOOD:{
         
            break;
        }
        case EXBaseTableViewCellTouchTypeACTIVITY:{
      
            break;
        }
        case EXBaseTableViewCellTouchTypeVIDEO:{
      
            break;
        }
        case EXBaseTableViewCellTouchTypeARTIS:{
    
            break;
        }
            
        case EXBaseTableViewCellTouchTypeBANNER:{
            break;
        }
            
        case EXBaseTableViewCellTouchTypeCHANNEL:{
    
            
            break;
        }
        case EXBaseTableViewCellTouchTypeREPRESENT:{
  
            break;
        }
        case EXBaseTableViewCellTouchTypeEVENMORE:{
    
            break;
        }
        default:
            break;
    }
}
#pragma mark 请求
-(void)InitDataCannelIdWithModel:(EXShopModel *)model cell:(EX_BaseTbaleViewCell *)cell {
    NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
    switch (model.interfaceType) {
        case InterfaceTypeOld:{
            [paraDic setValue:@{@"no":@1} forKey:@"page"];
            [EXSeviceRequestManger POSTWithShopPagesURL:model.content_data_url  pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
                [self.shoppingMalls enumerateObjectsUsingBlock:^(EXShopModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj  isEqual:model]) {
                        EXShopModel *result =[EXShopModel mj_objectWithKeyValues:responseObject];
                        NSArray *originalDatas =result.records;
                        model.sections = [self ToConvertAnArrayType:originalDatas type:model.interfaceType];
                    }
                }];
                [self.shoppingMallListView reloadData];
                
            } failure:^(NSError *error, NSDictionary *errorInfor) { }];
            break;
        }
        default:{
            [paraDic setValue:model.channel_id forKey:@"channel_id"];
            [EXSeviceRequestManger GetWithShopPagesURL:@"http://ss-www.oss-cn-hangzhou.aliyuncs.com/api/popular.json" pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
                [self.shoppingMalls enumerateObjectsUsingBlock:^(EXShopModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj  isEqual:model]) {
                        NSArray *originalDatas =[[EXShopModel mj_objectArrayWithKeyValuesArray:responseObject].firstObject datas];
                        
                        model.sections = [self ToConvertAnArrayType:originalDatas type:model.interfaceType];
                        *stop  = YES;
                    }
                }];
                [self.shoppingMallListView reloadData];
            } failure:^(NSError *error, NSDictionary *errorInfor) {
                
            }];
            break;
        }
    };
    
}
-(void)InitDataWithModel:(EXShopModel *)model cell:(EX_BaseTbaleViewCell *)cell  SectionModel:(EXShopModel *)section{
    NSMutableDictionary *paraDic = [NSMutableDictionary  dictionaryWithCapacity:0];
    
    [EXSeviceRequestManger GETWithURL:model.content_data_url pamDic:paraDic CompleteSuccessfull:^(id responseObject) {
        EXShopModel*tempModel =   [EXShopModel mj_objectArrayWithKeyValuesArray:responseObject].firstObject;
        if (tempModel.datas.count) {
            [cell InitDataWithModel:tempModel];
        }
    } failure:^(NSError *error, NSDictionary *errorInfor) {
        
    }];
}
#pragma mark  TabelviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    EXShopModel*model = self.shoppingMalls[section];
    return model.sections.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EXShopModel*model = self.shoppingMalls[indexPath.section];
    return [NSClassFromString(model.ClassName) getCellHeight:  model.sections[indexPath.row]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.shoppingMalls.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EXShopModel*model = self.shoppingMalls[indexPath.section];
    EX_BaseTbaleViewCell  *cell ;
    switch (model.template_type) {
        case   TemplateCellTypeShopingBanderTableViewCell:{
            cell = [HSYShopingBanderTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeRecommendTableViewCell:{
            cell = [HSYRecommendTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeClassifiedTableViewCell:{
            cell = [HSYClassifiedTableViewCell CellWithTableView:tableView];
            break;
        }
        case TemplateCellTypeDailyWillBuyTableViewCell:{
            cell = [HSYDailyWillBuyTableViewCell CellWithTableView:tableView];
            break;
        }
        default:
            cell = [HSYThePoorTableViewCell CellWithTableView:tableView];
            break;
    }
    
    EXShopModel *rowModel = model.sections[indexPath.row];
    if (model.MIME.length&&model.MIME) {
        rowModel.MIME = model.MIME;
    }
    
    if (!rowModel.datas.count&&rowModel.content_data_url.length) {
        
        [self InitDataWithModel:rowModel cell:cell SectionModel:model];
    }else{
        
        [cell InitDataWithModel:rowModel];
        
    }
    
    
    cell.delegate  = self;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark 适配ios11
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    EXShopModel*model = self.shoppingMalls[section];
    if (model.template_type == TemplateCellTypeShopingBanderTableViewCell ||model.template_type ==TemplateCellTypeClassifiedTableViewCell){
        return nil;
    }
    if (!model.content_name.length) {
        return nil;
    }
    UIView *headBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Number(44))];
    headBackView.backgroundColor =HSYColorfafafa;
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
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
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




-(NSMutableArray *)shoppingMalls{
    if (!_shoppingMalls) {
        
        _shoppingMalls = [NSMutableArray arrayWithCapacity:0];
    }
    return _shoppingMalls;
}
-(UITableView *)shoppingMallListView{
    
    if (!_shoppingMallListView) {
        
        _shoppingMallListView= [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _shoppingMallListView.showsVerticalScrollIndicator =NO;
        _shoppingMallListView.showsHorizontalScrollIndicator =NO;
        _shoppingMallListView.dataSource = self;
        _shoppingMallListView.delegate = self;
        _shoppingMallListView.tableFooterView  =[UIView new];
        _shoppingMallListView.estimatedRowHeight = 0;
        _shoppingMallListView.backgroundColor =[UIColor whiteColor];
        _shoppingMallListView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _shoppingMallListView;
}

@end

