//
//  ViewController.m
//  scrollViewDemo
//
//  Created by admin on 2016/11/8.
//  Copyright © 2016年 ma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat newConstant = -scrollView.contentOffset.y - 160;
    if (newConstant < -130) {
        newConstant = -130;
    }
// 如果判断下面的内容,tableView向下滚动时,topView不会跟着移动
//    if (newConstant > 0) {
//        newConstant = 0;
//    }
    
    self.topLayout.constant = newConstant;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"单元行%d",(int)indexPath.row];
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
