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
        if (responseObject) {
            NSString *codeStr   = responseObject[@"status"];
            NSDictionary  *data = responseObject[@"data"];
            if ([codeStr isEqualToString:@"ok"]) {
                successfull?successfull(@{@"code":@2000,@"data":data}):nil;
            }else{
                successfull?successfull(@{@"code":convertToString(data[@"code"])}):nil;
            }
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
        if (responseObject) {
            NSString *codeStr   = responseObject[@"status"];
            NSDictionary  *data = responseObject[@"data"];
            if ([codeStr isEqualToString:@"ok"]) {
                successfull?successfull(@{@"code":@2000,@"data":data}):nil;
            }else{
                successfull?successfull(@{@"code":convertToString(data[@"code"])}):nil;
            }
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
        if (responseObject) {
            NSString *codeStr   = responseObject[@"status"];
            NSDictionary  *data = responseObject[@"data"];
            if ([codeStr isEqualToString:@"ok"]) {
                successfull?successfull(@{@"code":@2000,@"data":data}):nil;
            }else{
                successfull?successfull(@{@"code":convertToString(data[@"code"])}):nil;
            }
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
        if (responseObject) {
            NSString *codeStr   = responseObject[@"status"];
            NSDictionary  *data = responseObject[@"data"];
            if ([codeStr isEqualToString:@"ok"]) {
                successfull?successfull(@{@"code":@2000,@"data":data}):nil;
            }else{
                successfull?successfull(@{@"code":convertToString(data[@"code"])}):nil;
            }
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
    
    [WYNetworkHelper GET:@"http://superstar.heysound.com/video/recommendList"  parameters:parameter success:^(id responseObject) {
        if (responseObject) {
            NSString *codeStr   = responseObject[@"status"];
            NSDictionary  *data = responseObject[@"data"];
            if ([codeStr isEqualToString:@"ok"]) {
                successfull?successfull(@{@"code":@2000,@"data":data}):nil;
            }else{
                successfull?successfull(@{@"code":convertToString(data[@"code"])}):nil;
            }
        }
    } failure:^(NSError *error) {
        failure?failure(error,@{@"code":@(3001),@"message":@"网络错误",@"error":error}):nil;
    }];
}
@end
