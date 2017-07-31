//
//  SAEmitterButton.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmitterButton.h"

@interface SAEmitterButton ()


/**  */
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@end



@implementation SAEmitterButton





#pragma mark-
#pragma mark- View Life Cycle

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviewsContraints];
    }
    return self;
}

#pragma mark-
#pragma mark- <#代理类名#> delegate


#pragma mark-
#pragma mark- Event response


#pragma mark-
#pragma mark- Private Methods


#pragma mark-
#pragma mark- Getters && Setters


#pragma mark-
#pragma mark- SetupConstraints 

- (void)setupSubviewsContraints {
    _emitterLayer  = [CAEmitterLayer layer];
    //        发射源的形状
    _emitterLayer.emitterShape = kCAEmitterLayerCircle;
    //        发射模式
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    //        发射源大小
    //    _explosionLayer.emitterSize = CGSize.init(width: 10, height: 0);
    _emitterLayer.emitterSize = CGSizeMake(5, 0);
    //        渲染模式
    _emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    _emitterLayer.masksToBounds = false;
    _emitterLayer.birthRate = 0;
    
    _emitterLayer.zPosition = 0;
   
    
    
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    //设置粒子颜色透明度改变范围
    cell.alphaRange = 0.1;
    //粒子alpha的改变速度
    cell.alphaSpeed = -1.0;
    //粒子的生命周期
    cell.lifetime = 0.7;
    //粒子生命周期的范围;
    cell.lifetimeRange = 0.3;
    
    //粒子发射的初始速度
    cell.birthRate = 2500;
    //粒子的速度
    cell.velocity = 40.00;
    //粒子速度范围
    cell.velocityRange = 10.00;
    
    // 粒子的缩放比例
    cell.scale = 0.03;
    // 缩放比例范围
    cell.scaleRange = 0.02;
    
    
    //粒子要展现的图片
    cell.contents = (id)([[UIImage imageNamed:@"sparkle"] CGImage]);
    
    //发射源包含的粒子
    _emitterLayer.emitterCells = @[cell];
    [self.layer addSublayer:_emitterLayer];

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    //        发射位置
    _emitterLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}

- (void)setSelected:(BOOL)selected{
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (selected) {
        animation.values = @[@1.5,@0.8,@1.0];
        animation.duration = 0.5;
        [self startAnimation];
    }else{
        animation.values = @[@0.8,@1.0];
        animation.duration = 0.4;
    }
    
    animation.calculationMode = kCAAnimationCubic;
    
    [self.layer addAnimation:animation forKey:@"transform.scale"];
}

- (void)startAnimation{
    _emitterLayer.beginTime = CACurrentMediaTime();
    //每秒生成多少个粒子
    _emitterLayer.birthRate = 1;
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _emitterLayer.birthRate = 0;
    });
    
}


@end
