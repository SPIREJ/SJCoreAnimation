//
//  ViewController.m
//  SJCoreAnimation
//
//  Created by SPIREJ on 16/2/1.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "ViewController.h"
#import "SJCoreAnimation_LayerBasic.h"
#import "SJCoreAnimation_AnchorPoint.h"
#import "SJCoreAnimationHiddenAnimation.h"
#import "SJCoreAnimation_CustomLayer.h"
#import "SJItemsTab.h"

@interface ViewController ()

@end

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 70

#define kLabelTitles @[@"1- CoreAnimation基础知识",@"2- 锚点",@"3- 隐式动画",@"4- 自定义图层",@"5- CAAnimation"]
#define kDetialLabelText @[@"SJCoreAnimation_LayerBasic.h",@"SJCoreAnimation_AnchorPoint.h",@"SJCoreAnimationHiddenAnimation.h",@"SJCoreAnimation_CustomLayer.h",@"SJItemsTab.h"]

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy)NSMutableArray *labelTextArray;
@property(nonatomic, copy)NSMutableArray *DetailLabelTextArray;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)labelTextArray{
    if (!_labelTextArray) {
        _labelTextArray = [NSMutableArray arrayWithArray:kLabelTitles];
    }
    return _labelTextArray;
}
- (NSMutableArray *)DetailLabelTextArray{
    if (!_DetailLabelTextArray) {
        _DetailLabelTextArray = [NSMutableArray arrayWithArray:kDetialLabelText];
    }
    return _DetailLabelTextArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    
    [self tableView];
    [self labelTextArray];
    [self DetailLabelTextArray];
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _labelTextArray.count;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifily];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _labelTextArray[indexPath.row];
    cell.detailTextLabel.text = _DetailLabelTextArray[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}

//选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            SJCoreAnimation_LayerBasic *basicVC = [[SJCoreAnimation_LayerBasic alloc] init];
            [self.navigationController pushViewController:basicVC animated:YES];
        }
            break;
        case 1:
        {
            SJCoreAnimation_AnchorPoint *anchorPointVC = [[SJCoreAnimation_AnchorPoint alloc] init];
            [self.navigationController pushViewController:anchorPointVC animated:YES];
        }
            break;
        case 2:
        {
            SJCoreAnimationHiddenAnimation *hiddenAnimation = [[SJCoreAnimationHiddenAnimation alloc] init];
            [self.navigationController pushViewController:hiddenAnimation animated:YES];
        }
            break;
        case 3:
        {
            SJCoreAnimation_CustomLayer *customLayerVC = [[SJCoreAnimation_CustomLayer alloc] init];
            [self.navigationController pushViewController:customLayerVC animated:YES];
        }
            break;
        case 4:
        {
            SJItemsTab *itemsTab = [[SJItemsTab alloc] init];
            [self.navigationController pushViewController:itemsTab animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
