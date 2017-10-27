//
//  EXGoodsRecommendViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/27.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXGoodsRecommendViewController.h"
#import "HSYShopingBanderTableViewCell.h"
#import "EXGoodsInfoTableViewCell.h"
#import "EXNavigationView.h"
#import "EXGoodsFootView.h"
#import "EXGoodsModel.h"

static CGFloat BannerHeight = 300.f;
@interface EXGoodsRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)EXNavigationView *navigationView;
@property(nonatomic,strong)EXGoodsFootView *goodsFootView;
@property(nonatomic,strong)UITableView *goodsTableView;
@property(nonatomic,strong)NSMutableArray *goods;
@end

@implementation EXGoodsRecommendViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithUI];
    [self loadDataSoucre];
}

-(void)initWithUI{
    [self.view addSubview:self.goodsTableView];
    [self.goodsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.view addSubview:self.navigationView];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarHeight);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(Number(64.0));
    }];
    [self.view addSubview:self.goodsFootView];
    [self.goodsFootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-HS_TabbarSafeBottomMargin);
        make.height.mas_equalTo(Number(60));
    }];
}

-(NSMutableDictionary *)pargram{
    NSMutableDictionary *pargram = [NSMutableDictionary dictionary];
//    [pargram setValue:@{@"id":@(self.relatedId)} forKey:@"goods"];
//    [pargram setValue:@{@"userId":@"88",@"agent":convertToString(self.agentUser)} forKey:@"user"];
    return pargram;
}

-(void)loadDataSoucre{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [EXSeviceRequestManger GetWithShopGoodsURL:[NSString stringWithFormat:@"http://superstar.heysound.com/user/getStars?starId=%@",convertToString(self.agentUser)] CompleteSuccessfull:^(id responseObject) {
        NSArray *temple= [EXGoodsModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.goods addObject:temple];
        dispatch_group_leave(group);
    } failure:^(NSError *error, NSDictionary *errorInfor) {
         dispatch_group_leave(group);
    }];
    

//    dispatch_group_enter(group);
//    NSMutableDictionary *pargram = [self pargram];
//    [EXSeviceRequestManger POSTWithGoodsURL:@"https://test.heysound.com/goods/get.do" pamDic:pargram CompleteSuccessfull:^(id responseObject) {
//
//        NSLog(@"%@",responseObject);
//         dispatch_group_leave(group);
//    } failure:^(NSError *error, NSDictionary *errorInfor) {
//
//         dispatch_group_leave(group);
//    }];


    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.goodsTableView reloadData];
    });
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    EXShopModel*model = self.shoppingMalls[indexPath.section];
    EX_BaseTbaleViewCell  *cell ;
//    switch (model.template_type) {
//        case   TemplateCellTypeShopingBanderTableViewCell:{
         cell = [HSYShopingBanderTableViewCell CellWithTableView:tableView];
//            break;
//        }
//        default:
//            break;
//    }
    
    return cell;
}












#pragma mark - UIScrollViewDelegate

/**
 *停止滚动
 *
 @param scrollView scrollView description
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
     CGFloat offset = scrollView.contentOffset.y;
    if (scrollView == self.goodsTableView) {
        if (self.goodsTableView.contentOffset.y >=0&&self.goodsTableView.contentOffset.y < BannerHeight) {       ///如果大于0，小于BannerHeight
            self.navigationView.alpha = offset/BannerHeight;
        }else if (self.goodsTableView.contentOffset.y<0){       //小于0
            self.navigationView.alpha = 0.f;
        }else{      ///大于0
            self.navigationView.alpha = 1.0f;
        }
    }else{          //不是goodsTableView
        
    }
}


#pragma mark UITableView
/**
 * 导航栏
 @return return value description
 */
-(EXNavigationView *)navigationView{
    if (!_navigationView) {
        _navigationView = [[EXNavigationView alloc]init];
        _navigationView.backgroundColor = HSYColorffffff;
        WS(weakSelf)
        _navigationView.goodsNavBlock = ^(NSUInteger tag) {
            switch (tag - 100) {
                case 0:{[weakSelf.navigationController popViewControllerAnimated:YES]; }
                    break;
                case 1:{NSLog(@"pop");}
                    break;
                default:
                    break;
            }
        };
    }
    return _navigationView;
}


/**
 *底部购物车
 *
 @return return value description
 */
-(EXGoodsFootView *)goodsFootView{
    if (!_goodsFootView) {
        _goodsFootView = [[EXGoodsFootView alloc]init];
        _goodsFootView.backgroundColor = [UIColor redColor];
    }
    return _goodsFootView;
}

-(NSMutableArray *)goods{
    if (!_goods) {
        _goods = [NSMutableArray arrayWithCapacity:0];
    }
    return _goods;
}

-(UITableView *)goodsTableView{
    if (!_goodsTableView) {
        _goodsTableView= [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _goodsTableView.showsVerticalScrollIndicator =NO;
        _goodsTableView.showsHorizontalScrollIndicator =NO;
        _goodsTableView.dataSource = self;
        _goodsTableView.delegate = self;
        _goodsTableView.tableFooterView  =[UIView new];
        _goodsTableView.estimatedRowHeight = 0;
        _goodsTableView.backgroundColor =[UIColor whiteColor];
        _goodsTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

@end
