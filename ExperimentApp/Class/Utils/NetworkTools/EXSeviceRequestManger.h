//
//  EXSeviceRequestManger.h
//  ExperimentApp
//
//  Created by GDBank on 2017/10/20.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYNetworkHelper.h"


/**
 *  监听请求成功的Block
 *
 *  @param responseObject 返回下载成功jason数据
 */
typedef void(^EXRequstSuccessBlock)(id responseObject);

/**
 *  监听请求失败的Block
 *
 *  @param error 返回下载成功jason数据
 */
typedef void(^EXRequstFailedBlock)(NSError *error);


@interface EXSeviceRequestManger : NSObject

#pragma mark  video  request
/**
 * 视频页面轮播

 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoBannnerCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 视频页面文字滚动

 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoRunNoticeCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
  视频页面品牌代言

 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoShowCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;

/**
 视频页面H5弹框
 
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoH5AlertCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 视频页面视频列表

 @param pages pages description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithVideoRecommendList:(NSInteger )pages  CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


#pragma mark  shop requst


/**
 商城页面数据列表

 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopInterfaceCompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 商城POST分页数据处理

 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)POSTWithShopPagesURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 商城瀑布流分页数据

 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopPoorPamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 商城GET数据处理
 
 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopPagesURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 Description

 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GETWithURL:(NSString *)url  pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


#pragma mark goods requst


/**
 商家信息

 @param url url description
 @param successfull successfull description
 @param failure failure description
 */
+(void)GetWithShopGoodsURL:(NSString *)url CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;


/**
 商品详情

 @param url url description
 @param pamDic pamDic description
 @param successfull successfull description
 @param failure failure description
 */
+(void)POSTWithGoodsURL:(NSString *)url pamDic:(NSDictionary *)pamDic CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error , NSDictionary *errorInfor))failure;
@end
