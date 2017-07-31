//
//  SAEmittterSnowController.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmittterSnowController.h"

@interface SAEmittterSnowController ()




@end

@implementation SAEmittterSnowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    [self snowAnimation];
}

- (void)snowAnimation
{
    
    CAEmitterLayer *snowEmitter  = [CAEmitterLayer layer];
    //降落区域的位置
    snowEmitter.frame = self.view.bounds;
    //添加到父视图Layer上
    [self.view.layer addSublayer:snowEmitter];
    //发射源的位置
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -10);
    //发射源的大小
    snowEmitter.emitterSize  = CGSizeMake(self.view.bounds.size.width, 0.0);
    //发射源的形状和模式 层级
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterMode  = kCAEmitterLayerOutline;
    snowEmitter.renderMode = kCAEmitterLayerOldestFirst;
    
    //创建CAEmitterCell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //每秒多少个
    snowflake.birthRate = 10.0;
    //存活时间
    snowflake.lifetime = 50.0;
    //初速度，因为动画属于落体效果，所以我们只需要设置它在y方向上的加速度就行了。
    snowflake.velocity = 10;
    //初速度范围
    snowflake.velocityRange = 5;
    //y轴方向的加速度
    snowflake.yAcceleration = 30;
    //以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
    snowflake.emissionRange = 5;
    //设置降落的图片
    snowflake.contents  =  (__bridge id _Nullable)([[UIImage imageNamed:@"love"] CGImage]);
    //图片缩放比例
    snowflake.scale = 0.5;
    //开始动画
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
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
