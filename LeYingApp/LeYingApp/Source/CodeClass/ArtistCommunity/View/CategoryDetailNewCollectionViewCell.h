//
//  CategoryDetailCollectionViewCell.h
//  乐影
//
//  Created by zhaoHm on 16/3/15.
//  Copyright © 2016年 sks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDetailNewCollectionViewCell : UICollectionViewCell


@property (nonatomic,strong) UIImageView *imgCategory;
// 下部容器
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UIImageView *imgSee;//眼视图
@property (nonatomic,strong) UILabel *lblSee;

@end
