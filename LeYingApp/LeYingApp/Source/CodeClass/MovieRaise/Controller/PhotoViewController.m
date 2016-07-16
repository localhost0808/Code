//
//  PhotoViewController.m
//  LeYingApp
//
//  Created by LiuChenhao on 16/1/18.
//  Copyright © 2016年 sks. All rights reserved.
//

#import "PhotoViewController.h"
#import "SDCycleScrollView.h"
#import "projectList.h"



@interface PhotoViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSMutableArray *myarr;
@property (nonatomic,assign)NSInteger myindex;
@property (nonatomic,strong)UIScrollView *HeadPicScroView;
@property (nonatomic,strong)UIImageView *picView;
@property (nonatomic,strong)UITextView *picView1;
@property (nonatomic,strong)UILabel *titleLable;
@property (nonatomic,assign)NSInteger number;
@property (nonatomic,strong)UILabel *numberLab;
@property (nonatomic,strong)UIButton *myBtn;
@property (nonatomic,assign)NSInteger myInt;
@property (nonatomic,strong)UIImageView *myImage;


@end

@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myarr = [NSMutableArray array];
    self.myindex = self.myarr.count;
    

    
    self.view.backgroundColor = [UIColor blackColor];
    if (![[IsHaveNetwork shareIsHaveNetwork] isConnectionAvailable]) {
        [[IsHaveNetwork shareIsHaveNetwork] alertViewForNetworkWithBase:self.view];
    }
    else
    {
        [self setPePicData];
    }
    
  
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow_left"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}
#pragma mark 重写返回按钮
-(void)leftBarButtonItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
    
    
    // 隐藏导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bargound.png"] forBarMetrics:UIBarMetricsDefault];
   
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
    
    // 导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"sytopd.png"] forBarMetrics:UIBarMetricsDefault];
    
  
}
#pragma mark 数据处理以及展示
-(void)setPePicData
{
    self.HeadPicScroView= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) -114 )];
    self.HeadPicScroView.backgroundColor = [UIColor blackColor];
    self.HeadPicScroView.contentSize = CGSizeMake(CGRectGetWidth(self.HeadPicScroView.frame) * self.allPhotoArr.count, 0);
    CGPoint  mySet = CGPointMake(self.HeadPicScroView.frame.size.width * self.myIndss, 0);
    self.HeadPicScroView.contentOffset = mySet;

   // self.HeadPicScroView.backgroundColor = [UIColor yellowColor];
    self.HeadPicScroView.pagingEnabled = YES;
       self.HeadPicScroView.delegate = self;
    [self.view addSubview:self.HeadPicScroView];
    
    if (![[IsHaveNetwork shareIsHaveNetwork] isConnectionAvailable])
    {
        [[IsHaveNetwork shareIsHaveNetwork] alertViewForNetworkWithBase:self.view];
    }
    else
    {
        for (int i = 0; i < self.allPhotoArr.count; i++)
        {
            
            NSMutableString *str1 = [NSMutableString stringWithFormat:@"%@",myurl];
            projectList *p = self.allPhotoArr[i];
            
            NSString *str2 = p.price;
            //NSString *str3 = r.Description;
            [self.myarr addObject:[str1 stringByAppendingString:str2]];
            
            CGFloat ImageX = CGRectGetWidth(self.HeadPicScroView.frame) *i;
            self.picView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageX + 15, -44, CGRectGetWidth(self.view.frame)- 30, CGRectGetHeight(self.HeadPicScroView.frame))];
            
            self.picView.backgroundColor = [UIColor blackColor];
            
            [self.picView sd_setImageWithURL:[NSURL URLWithString:self.myarr[i]]];
            
            self.picView.contentMode = UIViewContentModeScaleAspectFit;
            
            [self.HeadPicScroView addSubview:self.picView];
        }
    }
    
    self.myBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.myBtn.frame = CGRectMake(10, CGRectGetMaxY(self.HeadPicScroView.frame) + 15, 50, 40);
    [self.myBtn addTarget:self action:@selector(imageSavedphoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.myBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.myBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_myBtn];

    self.numberLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 -50, CGRectGetMaxY(self.HeadPicScroView.frame) + 15, 100, 40)];

    
    self.numberLab.textColor = [UIColor whiteColor];
    self.numberLab.textAlignment = NSTextAlignmentCenter;
    self.numberLab.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_numberLab];
    
    self.number = self.myIndss  + 1;
    self.numberLab.text = [NSString stringWithFormat:@"%ld/%ld",self.number,self.myarr.count];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger intege  = self.HeadPicScroView.contentOffset.x / self.view.bounds.size.width;
    self.numberLab.text = [NSString stringWithFormat:@"%ld/%ld",intege+1,self.myarr.count];
    self.myInt = intege;
    
    
}

#pragma mark 图片本地保存事件
-(void)imageSavedphoto:(UIButton *)sender
{
    
    self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake( 15, -44, CGRectGetWidth(self.view.frame)- 30, CGRectGetHeight(self.HeadPicScroView.frame))];

    if (![[IsHaveNetwork shareIsHaveNetwork] isConnectionAvailable])
    {
        [[IsHaveNetwork shareIsHaveNetwork] alertViewForNetworkWithBase:self.view];
    }
    else
    {
        [self.myImage sd_setImageWithURL:[NSURL URLWithString:self.myarr[self.myInt]]];
    }
    
    
    
    
    UIImageWriteToSavedPhotosAlbum(self.myImage.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}

#pragma mark 实现imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:方法

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error)
    {
        UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已经保存到本地相册" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alView show];
    }else
    {
        UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alView show];
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