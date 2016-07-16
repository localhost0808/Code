//
//  IdentityViewController.m
//  乐影
//
//  Created by LiuChenhao on 16/7/8.
//  Copyright © 2016年 sks. All rights reserved.
//

#import "IdentityViewController.h"

@interface IdentityViewController ()
@property (nonatomic,strong)UITextField *textFieldName;
@end

@implementation IdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.layer.contents = (id)[UIImage imageNamed:@"sybg.png"].CGImage;
    
    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, KScreenW, 40)];
    self.textFieldName.placeholder = @"请输入(个人/公司)职业";
    self.textFieldName.backgroundColor = [UIColor colorWithRed:212 / 255.0 green:209 / 255.0 blue:194 / 255.0 alpha:0.6];
    [self.view addSubview:_textFieldName]; 
    self.navigationItem.title = @"职业";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction)];
    
    self.textFieldName.text = self.identityString;
}

/// 保存
-(void)rightBarButtonAction
{
    
    if ([self.textFieldName.text isEqualToString:@""])
    {
        [AlertShow alertShowWithContent:@"工龄不能为空" Seconds:3];
    }
    else
    {
        // 保存 反向传值
        self.block(self.textFieldName.text);
        // 返回
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
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
