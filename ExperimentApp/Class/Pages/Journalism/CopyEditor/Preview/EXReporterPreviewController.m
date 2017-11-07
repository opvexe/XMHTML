//
//  EXReporterPreviewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/11/6.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXReporterPreviewController.h"

@interface EXReporterPreviewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation EXReporterPreviewController

-(void)setHTML:(NSString *)HTML{
    _HTML = [HTML copy];
    [self.webView loadHTMLString:HTML baseURL:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.webView loadHTMLString:self.HTML baseURL:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"文稿预览";
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - HS_TabbarSafeBottomMargin - NavBarHeight)];
    self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
    [self.view addSubview:self.webView];
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
