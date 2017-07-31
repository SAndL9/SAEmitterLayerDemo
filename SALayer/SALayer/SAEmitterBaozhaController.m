//
//  SAEmitterBaozhaController.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmitterBaozhaController.h"
#import "SAEmitterButton.h"
@interface SAEmitterBaozhaController ()


@end

@implementation SAEmitterBaozhaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    SAEmitterButton *button = [SAEmitterButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setImage:[UIImage imageNamed:@"praise_default"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"praise_select"]  forState:UIControlStateSelected];
    button.frame = CGRectMake(100, 100, 30, 30);
    [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)Click:(UIButton *)btn{
    btn.selected = !btn.selected;
    
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
