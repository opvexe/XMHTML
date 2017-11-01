//
//  EXKeyboardPhotoCollectionViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/31.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXKeyboardPhotoCollectionViewCell.h"

@interface EXKeyboardPhotoCollectionViewCell ()
@property(nonatomic,strong)UIImageView *selectImageView;
@end
@implementation EXKeyboardPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.photoImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.photoImageView.clipsToBounds = YES;
        [self addSubview:self.photoImageView];
        self.selectImageView = [[UIImageView alloc]init];
        self.selectImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.selectImageView.image = [UIImage imageNamed:@"photo_send_icon"];
        self.selectImageView.hidden = YES;
        self.selectImageView.clipsToBounds = YES;
        [self addSubview:self.selectImageView];
        [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(self.photoImageView).mas_offset(-Number(3));
            make.width.and.height.mas_equalTo(Number(20));
        }];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.selectImageView.hidden = !selected;
}

@end
