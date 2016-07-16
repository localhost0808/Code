//
//  ArtApplyPhoneTableViewCell.m
//  乐影
//
//  Created by LiuChenhao on 16/3/18.
//  Copyright © 2016年 sks. All rights reserved.
//

#import "ArtApplyPhoneTableViewCell.h"

@implementation ArtApplyPhoneTableViewCell


-(UIImageView *)starImage
{
    if (_starImage == nil)
    {
        self.starImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 20, 10, 10)];
        //self.titleImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_starImage];
        
    }
    return _starImage;
}





-(UILabel *)titLable
{
    if (_titLable == nil)
    {
        self.titLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 80, 30)];
        //self.titLable.backgroundColor = [UIColor yellowColor];
        self.titLable.textColor = [UIColor colorWithRed:90/255.0f green:101/255.0f  blue:104/255.0f alpha:1.0f];
        self.titLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titLable];
    }
    return _titLable;
}
-(UIButton *)chooseBtn
{
    if (_chooseBtn == nil)
    {
        self.chooseBtn = [HMButton buttonWithType:UIButtonTypeSystem];
        self.chooseBtn.frame = CGRectMake(CGRectGetMaxX(self.titLable.frame) , CGRectGetMinY(self.titLable.frame) + 7.5, 15, 15);
        [self.contentView addSubview:_chooseBtn];
    }
    return _chooseBtn;
}


-(UILabel *)chooseLab
{
    if (_chooseLab == nil)
    {
        self.chooseLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.chooseBtn.frame) + 5, 10, 80,30)];
        self.chooseLab.font = [UIFont systemFontOfSize:14];
        self.chooseLab.textColor =[UIColor colorWithRed:90/255.0f green:101/255.0f  blue:104/255.0f alpha:1.0f];
        [self.contentView addSubview:_chooseLab];
    }
    return _chooseLab;
}

-(UILabel *)showLab
{
    if (_showLab == nil)
    {
        self.showLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.chooseLab.frame), 10, CGRectGetWidth(self.frame) -  225, 30)];
        self.showLab.textAlignment = NSTextAlignmentRight;
        self.showLab.font = [UIFont systemFontOfSize:15];
        self.showLab.textColor = [UIColor colorWithRed:90/255.0f green:101/255.0f  blue:104/255.0f alpha:1.0f];
        [self.contentView addSubview:_showLab];
    }
    return _showLab;
}



-(UIImageView *)titleImage
{
    if (_titleImage == nil)
    {
        self.titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.showLab.frame) + 5, 15, 10, 20)];
        //self.titleImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_titleImage];
        
    }
    return _titleImage;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
