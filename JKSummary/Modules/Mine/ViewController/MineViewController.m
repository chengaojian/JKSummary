//
//  MineViewController.m
//  JKSummary
//
//  Created by 三海教育 on 2017/10/26.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "MineTableHeaderView.h"
#import "MineCell.h"
#import "MineJumpTools.h"
#import <AVFoundation/AVFoundation.h>

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MineTableHeaderView *tableHeaderView;
@property (nonatomic, assign) BOOL isClickClose;
@property (nonatomic, strong) NSArray *mineArr;
@property (nonatomic, strong) NSArray *markImgArr;
@property (nonatomic, strong) NSArray *classArr;
@property (nonatomic, strong) UIImagePickerController *picker;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.view.backgroundColor = kBackgroundColor;
    if (!_isClickClose) {
        [self isCheckIsLogin];
    }
}

- (void)isCheckIsLogin {
    // 测试登录
    LoginViewController *login = [[LoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:^{
        NSLog(@"弹出登录界面");
        _isClickClose = YES;
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
    // Do any additional setup after loading the view.
}

- (NSArray *)mineArr {
    if (!_mineArr) {
        _mineArr = [NSArray arrayWithObjects:@"我的收藏", @"查看历史", @"偏好设置", @"意见反馈", @"关于我们", nil];
        NSLog(@"%@",[_mineArr firstObject]);
    }
    return _mineArr;
}

- (NSArray *)markImgArr {
    if (!_markImgArr) {
        _markImgArr = [NSArray arrayWithObjects:@"favor", @"edit", @"repair", @"settings", @"cascades", nil];
        NSLog(@"%@",[_markImgArr firstObject]);
    }
    return _markImgArr;
}

- (NSArray *)classArr {
    if (!_classArr) {
        _classArr = [NSArray arrayWithObjects:@"", @"", @"PreferencesViewController", @"FeedbackViewController", @"AboutUsViewController", nil];
    }
    return _classArr;
}

- (MineTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[MineTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, 150)];
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeader)];
        tap.numberOfTapsRequired = 1;
        [_tableHeaderView addGestureRecognizer:tap];
    }
    return _tableHeaderView;
}

- (void)setupTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.tableHeaderView;
    self.tableView.backgroundColor = kClearColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? 2 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (self.mineArr.count > 0) {
        if (indexPath.section == 0) {
            [cell configMineCellWithTitle:self.mineArr[indexPath.row] andMarkImageName:self.markImgArr[indexPath.row]];
        }else {
            [cell configMineCellWithTitle:self.mineArr[indexPath.row + 2] andMarkImageName:self.markImgArr[indexPath.row + 2]];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.lineView.backgroundColor = (indexPath.row == 1) ? kClearColor : kLineColor;
    }else {
        cell.lineView.backgroundColor = (indexPath.row == 2) ? kClearColor : kLineColor;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMineCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = kClearColor;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc]init];
    footerView.backgroundColor = kClearColor;
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了单元格");
    MineJumpTools *tools = [[MineJumpTools alloc]init];
    if (indexPath.section == 0) {
        [tools jumpPageWithNavigationController:self.navigationController withClassName:self.classArr[indexPath.row] titleName:self.mineArr[indexPath.row]];
    }else {
        [tools jumpPageWithNavigationController:self.navigationController withClassName:self.classArr[indexPath.row + 2] titleName:self.mineArr[indexPath.row + 2]];
    }
}

- (void)clickHeader {
    NSLog(@"点击了头像");
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"用本机相册", nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex==0)  ////  照相
    {
#if TARGET_IPHONE_SIMULATOR
        //模拟器
#elif TARGET_OS_IPHONE
        //真机
        //系统相机授权判断1019
        NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            
            return;
        }
        
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _picker.allowsEditing = YES;
        [self presentViewController:_picker animated:YES completion:nil];
        
#endif
    }
    if(buttonIndex==1) ///// 用相册
    {
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.allowsEditing = YES;
        [self presentViewController:_picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.tableHeaderView.headerImg.image = image;
    [_picker dismissViewControllerAnimated:YES completion:nil];
    
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
