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
#import "EXGoodsCarView.h"
#import "EXGoodsModel.h"
#import "EXBannerView.h"
#import "EXPopView.h"

@interface EXGoodsRecommendViewController ()<UITableViewDelegate,UITableViewDataSource,EXGoodsCarViewDelegate,EXTableViewCellButtonActionProtocol,UIWebViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)EXNavigationView *navigationView;
@property(nonatomic,strong)EXGoodsCarView *goodsCarView;
@property(nonatomic,strong)UITableView *goodsTableView;
@property(nonatomic,strong)NSMutableArray *goods;
@property(nonatomic,strong)EXBannerView *bannerView;
@property(nonatomic,strong)EXGoodsModel *model;
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)EXPopView *popView;
@end

static CGFloat BannerHeight = 400.0f;

@implementation EXGoodsRecommendViewController
{
       BOOL isTop;
}
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
}

-(void)EX_AddSubviews{
    [self.view addSubview:self.goodsTableView];
    [self.goodsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.view addSubview:self.navigationView];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarHeight);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44.0);
    }];
    [self.view addSubview:self.goodsCarView];
    [self.goodsCarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-HS_TabbarSafeBottomMargin);
        make.height.mas_equalTo(Number(44));
    }];
}

-(void)EX_GetDataSoucre{
    NSArray *temp = @[@{@"intro":@"新款创意迷你usb锂电池充电小风扇便携式旅行情侣风扇",@"price":@"28.80",@"stockAmount":@"287",@"postage":@"8.00",@"goodsCellType":@1,@"ClassName":@"EXGoodsInfoTableViewCell"},
                      @{@"picUrl":PlaceholderImageName,@"shopName":@"jesper的店",@"goodsCellType":@2,@"ClassName":@"EXGoodsShopperTableViewCell"},
                      @{@"goodsCellType":@3,@"ClassName":@"EXGoodsShopChoiceTableViewCell"}];
    self.goods = [EXGoodsModel mj_objectArrayWithKeyValuesArray:temp];
    [self.goodsTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.goods.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EXGoodsModel *model = self.goods[indexPath.section];
    EX_BaseTbaleViewCell  *cell ;
    switch (model.goodsCellType) {
            case TemplateCellTypeGoodsIntroduceTableViewCell:
        {
            cell = [EXGoodsInfoTableViewCell CellWithTableView:tableView];
        }
            break;
            case TemplateCellTypeGoodsShopkeeperTableViewCell:
        {
            cell = [EXGoodsShopperTableViewCell CellWithTableView:tableView];
            EXGoodsShopperTableViewCell *x_cell  = (EXGoodsShopperTableViewCell*)cell;
            x_cell.xg_delegate = self;
        }
            break;
            case TemplateCellTypeGoodsChoiceTableViewCell:
        {
            cell = [EXGoodsShopChoiceTableViewCell CellWithTableView:tableView];
        }
            break;
        default:
            break;
    }
    [cell InitDataWithModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EXGoodsModel *model = self.goods[indexPath.section];
    return [NSClassFromString(model.ClassName) getCellHeight:model];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == self.goods.count -1) {
        return Number(44);
    }
    return Number(10.0);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *bg = [[UIView alloc]init];
    bg.backgroundColor =HSYColorf0f0f0;
    if (section == self.goods.count -1 ) {
        UILabel *titleLabel = [UILabel new];
        titleLabel.font= FontPingFangSC(14);
        titleLabel.textColor = BaseTitleColor;
        [bg addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(bg.mas_centerX);
            make.centerY.mas_equalTo(bg.mas_centerY);
        }];
        titleLabel.text = @"详情";
    }
    return bg;
}

#pragma mark <UIWebViewDelegate>

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
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
    }
}

/**
 * 停止减速

 @param scrollView scrollView description
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.goodsTableView.contentOffset.y == 0) {
        self.webView.scrollView.scrollEnabled = YES;
    }else{
         self.webView.scrollView.scrollEnabled = NO;
    }
}


/**
 * 开始拖拽

 @param scrollView scrollView description
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.goodsTableView.contentOffset.y == 0) {
        self.webView.scrollView.scrollEnabled = YES;
    }else{
        self.webView.scrollView.scrollEnabled = NO;
    }
}


#pragma mark - EXGoodsCarViewDelegate

/**
 EXGoodsCarViewDelegate

 @param carView carView description
 @param index index description
 */
-(void)goodsCarView:(EXGoodsCarView *)carView selectIndex:(NSUInteger)index{
    NSLog(@"%ld",index);
}

#pragma mark - EXTableViewCellDelegate

/**
 Description

 @param tableViewCell tableViewCell description
 @param index index description 
 */
-(void)ex_ClickButtonTableViewCell:(EX_BaseTbaleViewCell *)tableViewCell selectIndex:(NSUInteger)index{
    NSLog(@"%ld",index);
}






#pragma mark UITableView
/**
 * 导航栏
 @return return value description
 */
-(EXNavigationView *)navigationView{
    if (!_navigationView) {
        _navigationView = [[EXNavigationView alloc]init];
        _navigationView.backgroundColor = [UIColor whiteColor];
        WS(weakSelf)
        _navigationView.goodsNavBlock = ^(NSUInteger tag) {
            switch (tag - 100) {
                case 0:{[weakSelf.navigationController popViewControllerAnimated:YES]; }
                    break;
                case 1:{NSLog(@"分享");}
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
-(EXGoodsCarView *)goodsCarView{
    if (!_goodsCarView) {
        _goodsCarView = [[EXGoodsCarView alloc]init];
        _goodsCarView.xm_delegate = self;
    }
    return _goodsCarView;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.scrollView.delegate = self;
        _webView.scrollView.bounces = NO;
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        [_webView loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://app.digitaling.com/articles/39581.html"]]];
    }
    return _webView;
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
        _goodsTableView.tableHeaderView = self.bannerView;
        _goodsTableView.estimatedRowHeight = 0;
        _goodsTableView.backgroundColor =[UIColor whiteColor];
        _goodsTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        _goodsTableView.tableFooterView = self.webView;
    }
    return _goodsTableView;
}

-(EXBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[EXBannerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,BannerHeight)];
        [_bannerView InitDataWithModel:self.model];
    }
    return _bannerView;
}

@end
