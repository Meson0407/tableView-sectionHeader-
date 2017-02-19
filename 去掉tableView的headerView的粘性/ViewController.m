//
//  ViewController.m
//  去掉tableView的headerView的粘性
//
//  Created by 薛涛 on 17/2/16.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这里是第%ld行", (long)indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

#pragma mark - scrollViewDidScroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat headerHeight = 40;
        if (scrollView.contentOffset.y <= headerHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= headerHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-headerHeight, 0, 0, 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
