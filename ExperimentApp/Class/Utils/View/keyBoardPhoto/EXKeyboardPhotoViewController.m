//
//  EXKeyboardPhotoViewController.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/30.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXKeyboardPhotoViewController.h"
#import "EXPhotoPreviewViewController.h"

@import Photos;
@interface EXKeyboardPhotoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,PHPhotoLibraryChangeObserver>
@property(nonatomic,strong)UICollectionView *photoCollectionView;
@property(nonatomic,strong)EXPhotoPreviewViewController *previewController; //预览
@property (nonatomic, strong) PHFetchResult *photosResult;
@property (nonatomic, strong) NSMutableDictionary *photos;
@end

@implementation EXKeyboardPhotoViewController

static CGFloat const Height = 40.f;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithCollectionView];
    [self initWithBottomView];
}

/**
 * 初始化CollectionView
 */
-(void)initWithCollectionView{
    [self.view addSubview:self.photoCollectionView];
    [self.photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).mas_offset(-Height*2);
    }];
}


/**
 * 初始化相册 获取相册的图片
 */
-(void)initWithPHPhotoLibrary{
    [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
    PHFetchOptions *nearestPhotosOptions = [[PHFetchOptions alloc] init];
    nearestPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    nearestPhotosOptions.fetchLimit = 20;
    self.photosResult = [PHAsset fetchAssetsWithOptions:nearestPhotosOptions];
    self.photos = [NSMutableDictionary dictionary];
}





/**
 * 初始化Bottom底部视图
 */
-(void)initWithBottomView{
    NSArray *titleItems = @[@"相册",@"拍照"];
    NSArray *imageItems = @[@"photo_gallery_icon",@"photo_take_icon"];
    for (int i = 0; i< titleItems.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        CGFloat imageWidth = 20;
        CGFloat labelWidth = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font].width;
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -(labelWidth));
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
        [btn setTitle:titleItems[i] forState:UIControlStateNormal];
        [btn setTitle:titleItems[i] forState:UIControlStateHighlighted];
        [btn setTitle:titleItems[i] forState:UIControlStateSelected];
        [btn setTitleColor:BaseTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:BaseTitleColor forState:UIControlStateSelected];
        [btn setTitleColor:BaseTitleColor forState:UIControlStateHighlighted];
        [btn setTitleColor:BaseTitleColor forState:UIControlStateDisabled];
        [btn setBackgroundImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateDisabled];
        [btn setImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:imageItems[i]] forState:UIControlStateDisabled];
        [btn addTopBorderWithColor:[UIColor lightGrayColor] andWidth:0.3];
        [btn addTopBorderWithColor:[UIColor lightGrayColor] andWidth:0.3];
        btn.frame = CGRectMake(0,SCREEN_HEIGHT - Height*(i + 1), SCREEN_WIDTH, Height);
        [self.view addSubview:btn];
    }
}



/**
 Description
 
 @return return value description
 */
- (UICollectionView *)photoCollectionView{
    if(!_photoCollectionView){
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.headerReferenceSize = CGSizeMake(0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _photoCollectionView =[[UICollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        _photoCollectionView.backgroundColor = [UIColor clearColor];
        _photoCollectionView.showsHorizontalScrollIndicator = NO;
        _photoCollectionView.showsVerticalScrollIndicator =NO;
        _photoCollectionView.dataSource = self;
        _photoCollectionView.delegate = self;
        
    }
    return _photoCollectionView;
}

- (void)dealloc {
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}
@end

