//
//  SAEmitterFireworksController.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmitterFireworksController.h"

@interface SAEmitterFireworksController ()

/**  */
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation SAEmitterFireworksController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _emitterLayer = [CAEmitterLayer layer];
    //发射源
    _emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height - 50);
    //发射源尺寸大小
    _emitterLayer.emitterSize = CGSizeMake(50, 0);
    //发射源模式
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    //发射源形状
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    //渲染模式
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    //发射方向
    _emitterLayer.velocity = 1;
    
    //产生粒子数量
    _emitterLayer.seed = (arc4random() % 100 ) + 1;
    
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    //产生的速lv
    cell.birthRate = 1.0;
    //发射角度
    cell.emissionRange = 0.11 * M_PI;
    //速度
    cell.velocity = 300;
    //范围
    cell.velocityRange = 150;
    //y 加速度
    cell.yAcceleration = 75;
    //存活时间
    cell.lifetime = 2.04;
    //cell 内容
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"FFRing"].CGImage);
    //缩放比例
    cell.scale = 0.2;
    //粒子颜色
    cell.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
    
    // 一个粒子的颜色green 能改变的范围
    cell.greenRange                 = 1.0;
    // 一个粒子的颜色red 能改变的范围
    cell.redRange                   = 1.0;
    // 一个粒子的颜色blue 能改变的范围
    cell.blueRange                  = 1.0;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 2.5;
    // shifting粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    // shifting粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    // shifting粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    // 火花 and finally, the sparks
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 400;
    //速度
    spark.velocity                  = 125;
    // 360 deg//周围发射角度
    spark.emissionRange             = 2 * M_PI;
    // gravity//y方向上的加速度分量
    spark.yAcceleration             = 75;
    //粒子生命周期
    spark.lifetime                  = 3;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)
    [[UIImage imageNamed:@"FFTspark"] CGImage];
    //缩放比例速度
    spark.scaleSpeed                = -0.2;
    //粒子green在生命周期内的改变速度
    spark.greenSpeed                = -0.1;
    //粒子red在生命周期内的改变速度
    spark.redSpeed                  = 0.4;
    //粒子blue在生命周期内的改变速度
    spark.blueSpeed                 = -0.1;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.25;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
    spark.spinRange                 = 2* M_PI;
    
    
    self.emitterLayer.emitterCells = [NSArray arrayWithObject:cell];
    cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
    burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:self.emitterLayer];

    
    
    
}

- (void)fireWorkAnimation{
    _emitterLayer = [CAEmitterLayer layer];
    //发射源
    _emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height - 50);
    //发射源尺寸大小
    _emitterLayer.emitterSize = CGSizeMake(50, 0);
    //发射源模式
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    //发射源形状
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    //渲染模式
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    //发射方向
    _emitterLayer.velocity = 1;
    
    //产生粒子数量
    _emitterLayer.seed = (arc4random() % 100 ) + 1;
    
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    //产生的速lv
    cell.birthRate = 1.0;
    //发射角度
    cell.emissionRange = 0.11 * M_PI;
    //速度
    cell.velocity = 300;
    //范围
    cell.velocityRange = 150;
    //y 加速度
    cell.yAcceleration = 75;
    //存活时间
    cell.lifetime = 2.04;
    //cell 内容
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"FFRing"].CGImage);
    //缩放比例
    cell.scale = 0.2;
    //粒子颜色
    cell.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
    
    // 一个粒子的颜色green 能改变的范围
    cell.greenRange                 = 1.0;
    // 一个粒子的颜色red 能改变的范围
    cell.redRange                   = 1.0;
    // 一个粒子的颜色blue 能改变的范围
    cell.blueRange                  = 1.0;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 2.5;
    // shifting粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    // shifting粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    // shifting粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    // 火花 and finally, the sparks
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 400;
    //速度
    spark.velocity                  = 125;
    // 360 deg//周围发射角度
    spark.emissionRange             = 2 * M_PI;
    // gravity//y方向上的加速度分量
    spark.yAcceleration             = 75;
    //粒子生命周期
    spark.lifetime                  = 3;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)
    [[UIImage imageNamed:@"FFTspark"] CGImage];
    //缩放比例速度
    spark.scaleSpeed                = -0.2;
    //粒子green在生命周期内的改变速度
    spark.greenSpeed                = -0.1;
    //粒子red在生命周期内的改变速度
    spark.redSpeed                  = 0.4;
    //粒子blue在生命周期内的改变速度
    spark.blueSpeed                 = -0.1;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.25;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
    spark.spinRange                 = 2* M_PI;
    
    
    self.emitterLayer.emitterCells = [NSArray arrayWithObject:cell];
    cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
    burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:self.emitterLayer];
}

@end
