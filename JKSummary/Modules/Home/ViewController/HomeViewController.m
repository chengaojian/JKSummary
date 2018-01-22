//
//  HomeViewController.m
//  JKSummary
//
//  Created by 三海教育 on 2017/12/22.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *homeCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *imagesUrlArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = [NSMutableArray array];
    self.imagesUrlArr = [NSMutableArray array];
    
    [self loadData];
    [self setupNav];
    [self setupUI];
    [self setupCollectionView];
    // Do any additional setup after loading the view.
}

- (void)loadData {
    
    
    NetWork *netWork = [NetWork shardInstance];
    NSString *url = @"http://www.wuqiongda8888.com/app/list.htm?id=50&page=1&pageSize=10000&videoSize=100000";
    [netWork httpRequestGetWithUrl:url success:^(Response *response) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:(id)response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *contentDcit = responseDict[@"content"];
        NSArray *categoryVideosArr = contentDcit[@"categoryVideos"];
        NSArray *videosArr = categoryVideosArr[0][@"videos"];
        for (NSDictionary *dict in videosArr) {
            HomeViewModel *model = [HomeViewModel mj_objectWithKeyValues:dict];
            [self.dataArr addObject:model];
        }
        [self.homeCollectionView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)setupNav {
    
}

- (void)setupUI {
    
    
}

- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(kScreenWith, 200);
    layout.itemSize = CGSizeMake(kScreenWith / 2 , kScreenWith / 2 * 0.8 );
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    
    self.homeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, kScreenHeight - 64) collectionViewLayout:layout];
    self.homeCollectionView.delegate = self;
    self.homeCollectionView.dataSource = self;
    self.homeCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.homeCollectionView];
    
    // 注册单元格
    [self.homeCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCollectionViewCellID"];
    // 注册头部视图
    [self.homeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionViewHeader"];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    NSLog(@"%s---------",__func__);
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%s---------",__func__);
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---------",__func__);
    HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCellID" forIndexPath:indexPath];
    if (self.dataArr.count > 0) {
        HomeViewModel *model = self.dataArr[indexPath.row];
        [cell configWithHomeCollectonViewCell:model];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArr.count > 0) {
        HomeViewModel *model = self.dataArr[indexPath.row];
        NSLog(@"点击了 --- > %@",model.url);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s---------",__func__);
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionViewHeader" forIndexPath:indexPath];
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWith, 150) delegate:nil placeholderImage:nil];
        [self.imagesUrlArr addObject:@"https://static.edspay.com/borrow/1705191373822667-FFD8FF/view.html"];
        [self.imagesUrlArr addObject:@"https://static.edspay.com/borrow/1705192136260612-FFD8FF/view.html"];
        [self.imagesUrlArr addObject:@"https://static.edspay.com/borrow/1705190843998378-FFD8FF/view.html"];
        cycleScrollView.imageURLStringsGroup = self.imagesUrlArr;
        [headerView addSubview:cycleScrollView];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 160, kScreenWith, 30)];
        title.text = @"编辑·精选";
        title.font = [UIFont systemFontOfSize:18];
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1];
        [headerView addSubview:title];
        
        UIView *underLine = [[UIView alloc]initWithFrame:CGRectMake((kScreenWith - 20) / 2, CGRectGetMaxY(title.frame) + 1, 20, 0.5)];
        underLine.backgroundColor = [UIColor colorWithRed:72/255.0 green:72/255.0 blue:72/255.0 alpha:1];
        [headerView addSubview:underLine];
        
        return headerView;
    }
    return nil;
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

