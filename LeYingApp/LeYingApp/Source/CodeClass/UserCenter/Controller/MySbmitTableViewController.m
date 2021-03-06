//
//  MySbmitTableViewController.m
//  LeYingApp
//
//  Created by sks on 15/12/30.
//  Copyright © 2015年 sks. All rights reserved.
//

#import "MySbmitTableViewController.h"

#import "MySuppostTableViewCell.h"
#import "orderMessageModel.h"

@interface MySbmitTableViewController ()
@property (nonatomic,strong)NSArray *myArr1;
@end

@implementation MySbmitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myArr1 = [NSArray array];
    
    self.navigationItem.title = @"我的支持";
    
    [self.tableView registerClass:[MySuppostTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath2 = [documentPath stringByAppendingString:@"/name.txt"];
    
    NSString *avi = [NSString stringWithContentsOfFile:filePath2 encoding:NSUTF8StringEncoding error:nil];
    
    
    
    [[getAboutOrder shareDataOrder] getOrderWithPage:@"1" Pagesize:@"10" Paybackid:@"1" Status:@"1" ProjectId:@"1" Token:avi WithOrderValue:^(NSArray *orderArr) {
        
        self.myArr1 = orderArr;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete implementation, return the number of rows
    return self.myArr1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MySuppostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    orderMessageModel *m = self.myArr1[indexPath.row];
    
    cell.initiatorLable.text = @"发起人：";
    cell.initiatorShowLable.text = [m.publisher objectForKey:@"name"];
    cell.stateLable.text = @"已提交";
    [cell.paymentBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [cell.paymentBtn addTarget:self action:@selector(paymentBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableString *str1 = [NSMutableString stringWithFormat:@"http://www.leychina.com/static/upload/"];
    NSString *str2 = [m.payback objectForKey:@"cover_image"];
    [cell.showImage sd_setImageWithURL:[NSURL URLWithString:[str1 stringByAppendingString:str2]]];
    cell.showTitLable.text = [m.payback objectForKey:@"title"];
    cell.priceLablel.text = [NSString stringWithFormat:@"%@",[m.payback objectForKey:@"money"]];
    //[NSString stringWithFormat:@"%ld",(long)[m.payback objectForKey:@"money"]];
    cell.goodsLable.text = [m.payback objectForKey:@"detail"];
    cell.numberLable.text = [NSString stringWithFormat:@"%ld",(long)m.amount];
    cell.allLable.text = @"共计:";
    cell.allShowLable.text =[NSString stringWithFormat:@"%ld",(long)m.total_money];
    cell.freightLable.text = @"含运费：";
    cell.freightShowLable.text = [NSString stringWithFormat:@"%ld",(long)m.delivery_money];
    
    
    return cell;
}
-(void)paymentBtnAction
{
    NSLog(@"支付成功");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
