//
//  ViewController.m
//  SALayer
//
//  Created by 李磊 on 28/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "ViewController.h"
#import "SAEmitterStarController.h"
#import "SAEmitterBaozhaController.h"
#import "SAEmittterSnowController.h"
#import "SAEmitterFireworksController.h"
#import "SAEmitterBController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"爆炸效果";
            break;
        case 1:
            cell.textLabel.text = @"送礼物星星效果";
            break;
        case 2:
            cell.textLabel.text = @"雪花效果";
            break;
        case 3:
            cell.textLabel.text = @"烟花效果";
            break;
            case 4:
            cell.textLabel.text = @"太阳效果";
            break;
        default:
            break;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            SAEmitterBaozhaController *b = [[SAEmitterBaozhaController alloc]init];
            [self.navigationController pushViewController:b animated:YES];
        }
            break;
        case 1:
        {
            SAEmitterStarController *b = [[SAEmitterStarController alloc]init];
            [self.navigationController pushViewController:b animated:YES];        }
            break;
        case 2:
        {
            SAEmittterSnowController *b = [[SAEmittterSnowController alloc]init];
           [self.navigationController pushViewController:b animated:YES];
        }
            break;
        case 3:
        {
            SAEmitterFireworksController *b = [[SAEmitterFireworksController alloc]init];
            [self.navigationController pushViewController:b animated:YES];
        }
            break;
        case 4:{
    
            SAEmitterBController *b = [[SAEmitterBController alloc]init];
            [self.navigationController pushViewController:b animated:YES];
        }
            break;
            
        default:
            break;
    }
}



@end
