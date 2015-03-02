//
//  LeftViewController.m
//  WatchJD
//
//  Created by djwang on 15/2/3.
//  Copyright (c) 2015年 belter. All rights reserved.
//

#import "LeftViewController.h"
#import "UserHeadTableViewCell.h"
#import "MenuItemTableViewCell.h"


@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initMyView];
    
    NSArray *titleArray = @[@"最新数据",@"历史数据",@"活动轨迹",@"消息中心",@"家庭成员",@"提醒设置",@"远程通话"];
    _titleArray = titleArray;
    NSArray *imageArray = @[@"最新数据",@"历史数据",@"活动轨迹",@"消息中心",@"家庭成员",@"提醒设置",@"远程通话"];
    _imageArray = imageArray;
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

-(void)initMyView
{
    [self.view setBackgroundColor:[UIColor clearColor]];
    CGRect frame = self.view.frame;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)btnLogoutClick:(id)sender {
}
- (IBAction)btnSettingClick:(id)sender {
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *cellid = @"cellid";
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell)
    {
        MenuItemTableViewCell *menuitemcell = [[MenuItemTableViewCell alloc] init];
        NSArray *nibarray = [[NSBundle mainBundle] loadNibNamed:@"MenuItemTableViewCell" owner:self options:nil];
        menuitemcell = [nibarray objectAtIndex:0];
        
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:_titleArray[indexPath.row],@"title",_imageArray[indexPath.row],@"image", nil];
        [menuitemcell setCellView:dic];
        cell = menuitemcell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 44;
    return height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.5];
    [self performSelector:@selector(unselectCurrentRow:) withObject:indexPath afterDelay:0.3];
    
    
    
    [self.cellSelectDelegate cellItemSelect:(int)indexPath.row];
}

- (void) unselectCurrentRow :(NSIndexPath *)indexPath
{
    // Animate the deselection
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}

@end
