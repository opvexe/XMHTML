//
//  EXSeviceRequestManger.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXSeviceRequestManger.h"

@implementation EXSeviceRequestManger

/**
 * 视频页面轮播
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoBannnerCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://superstar.heysound.com/scene/endorseMain/banner/3"  parameters:nil success:^(id responseObject) {

        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"data"]) ) {
            successfull?successfull(responseObject[@"data"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}


/**
 视频页面RunView
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoRunNoticeCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://superstar.heysound.com/scene/endorseMain/notice/3"  parameters:nil success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"data"]) ) {
            successfull?successfull(responseObject[@"data"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

/**
 视频品牌代言
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoShowCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://superstar.heysound.com/scene/endorseMain/show/1"  parameters:nil success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"data"]) ) {
            successfull?successfull(responseObject[@"data"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

/**
 视频页面H5弹框
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoH5AlertCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://superstar.heysound.com/scene/endorseMain/ios/alert/1"  parameters:nil success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"data"]) ) {
            successfull?successfull(responseObject[@"data"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

/**
 视频页面视频列表
 
 @param pages pages description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoRecommendList:(NSInteger )pages  CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionaryWithCapacity:0];
    [parameter setValue:@(pages) forKey:@"pageNum"];
    
    [WYNetworkHelper GET:@"http://ceng.heysound.com:4000/api/result"  parameters:parameter success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"data"]) ) {
            successfull?successfull(responseObject[@"data"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

#pragma mark shop

/**
 商城页面数据列表
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopInterfaceCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://ceng.heysound.com:4000/api/result"  parameters:nil success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"datas"]) ) {
            successfull?successfull(responseObject[@"datas"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
        
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
    
}


/**
 商城POST分页数据处理
 
 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)POSTWithShopPagesURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper POST:url  parameters:pamDic success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"datas"]) ) {
            successfull?successfull(responseObject[@"datas"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

/**
 商城瀑布流分页数据
 
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopPoorPamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:@"http://ss-www.oss-cn-hangzhou.aliyuncs.com/api/popular.json"  parameters:nil success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"datas"]) ) {
            successfull?successfull(responseObject[@"datas"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
        
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}

/**
 商城GET分页数据处理
 
 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopPagesURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:url  parameters:pamDic success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"datas"]) ) {
            successfull?successfull(responseObject[@"datas"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}


/**
 Description
 
 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GETWithURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure{
    
    [WYNetworkHelper GET:url  parameters:pamDic success:^(id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]&&!is_null(responseObject[@"datas"]) ) {
            successfull?successfull(responseObject[@"datas"]):nil;
        }else{
            successfull?successfull(responseObject[@"status"]):nil;
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}
@end


