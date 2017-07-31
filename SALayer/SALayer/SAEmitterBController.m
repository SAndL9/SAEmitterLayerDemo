//
//  SAEmitterBController.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmitterBController.h"

@interface SAEmitterBController ()

@end

@implementation SAEmitterBController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 - 50, [UIScreen mainScreen].bounds.size.height / 2.0 , 100, 100)];
    
    v.backgroundColor = [UIColor yellowColor];
    v.layer.cornerRadius = 50;
    [self.view addSubview:v];
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = v.bounds;
    [v.layer addSublayer:emitterLayer];
    
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width / 2.0, emitterLayer.frame.size.height / 2.0);
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"888"].CGImage);
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI  * 2.0;
    emitterLayer.emitterCells = @[cell];
    
    
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
