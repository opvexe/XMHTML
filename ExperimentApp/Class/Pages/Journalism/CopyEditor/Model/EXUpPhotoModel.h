//
//  EXUpPhotoModel.h
//  ExperimentApp
//
//  Created by Facebook on 2017/11/8.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EX_BaseModel.h"


typedef NS_ENUM(NSUInteger,UpPhotoCellType ) {
    ///基本Cell
    EXUpPhotoBaseTableViewCell = 1,
    //瀑布流Cell
    EXUpPhotoCollectionPhotoTableViewCell = 2,
};

@interface EXUpPhotoModel : EX_BaseModel

/**
 Description
 */
@property (nonatomic,assign) UpPhotoCellType type;

/**
 Description
 */
@property (nonatomic,copy) NSString *icon;


/**
 Description
 */
@property (nonatomic,copy) NSString *title;


/**
 Description
 */
@property (nonatomic,copy) NSString *image;


/**
 Description
 */
@property (nonatomic,copy) NSString *explain;
@end
