//
//  EXRecommendTableViewCell.m
//  ExperimentApp
//
//  Created by GDBank on 2017/10/23.
//  Copyright © 2017年 com.GDBank.Company. All rights reserved.
//

#import "EXRecommendTableViewCell.h"

@implementation EXRecommendTableViewCell

+ (id)CellWithTableView:(UITableView *)tableView{
    
    EXRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EXRecommendTableViewCell class])];
    if (!cell) {
        cell = [[EXRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([EXRecommendTableViewCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

@end
