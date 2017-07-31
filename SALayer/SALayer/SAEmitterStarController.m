//
//  SAEmitterStarController.m
//  SALayer
//
//  Created by 李磊 on 31/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SAEmitterStarController.h"

@interface SAEmitterStarController ()

@end

@implementation SAEmitterStarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    CAEmitterCell 粒子大小速度类型角度
    //    CAEmitterLayer 粒子引擎<粒子流>
    //    CAEmitterBehavior
    // CAEmitterLayer 与 CAEmitterCell 都有的属性,最后使用的是cell * layer 来作为最后的展示.
    //创建CAEmitterLayer
    CAEmitterLayer *showLayer = [CAEmitterLayer layer];
//    showLayer.frame = CGRectMake(self.view.bounds.size.width - 150, 10, 150, self.view.bounds.size.height - 20);
    //指定发射源的位置
    showLayer.emitterPosition = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height - 50);
    //指定发射源的大小
    showLayer.emitterSize = CGSizeMake(50, 0);
    //  指定发射源形状
    showLayer.emitterShape = kCAEmitterLayerOutline;
    //指定发射源模式
    showLayer.emitterMode = kCAEmitterLayerLine;
    
    //发射源的渲染模式
    showLayer.renderMode = kCAEmitterLayerOldestFirst;
    showLayer.velocity = 1;
    
    showLayer.seed = (arc4random() % 100 ) + 1;

        //创建CAEmitterCell
        CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
        //每s多少个粒子
        emitterCell.birthRate = 0.8;
        //存活时间
        emitterCell.lifetime = 20;
        //存活范围-->设置其后, 存活时间 = <存活范围, -> 存活范围+存活时间 >
        //    emitterCell.lifetimeRange = 5;
        
        //初始速度 <整数向上,负数向下>
        emitterCell.velocity = 15;
        //初速度范围
        //    emitterCell.velocityRange = 2;
        
        //y方向上的加速度 <如果从上往下,可以不设置x方向上的加速度.当x和y方向上都有值,就相当于抛物线效果> ,y为正,模拟地球引力,向下飘动
        emitterCell.yAcceleration = -10;
        //x 方向上的加速度
        //    emitterCell.xAcceleration  = 2;
        
        ///以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
        emitterCell.emissionRange =  0.11 * M_PI;
        
        
        
        
        //对象的初始缩放大小
        emitterCell.scale = 0.5;
        //对象缩放绕动范围
        //    emitterCell.scaleRange = 0.5;
        //缩放速度
        //    emitterCell.speed = 0.5;
        
        //对象透明度扰动范围
        //    emitterCell.alphaRange = 0.5;
        //对象的透明变动速度
        //    emitterCell.alphaSpeed = 0.5;
        
        
        
        //　color：对象的颜色，这里我们的cell可以对图片从新进行颜色的填充，所以如果对于我们设计的一个单色的图片来说，这个字段将很有用
        
        //    　　redRange：红色通道的扰动范围
        
        //    　　greenRange：绿色通道的扰动范围
        
        //    　　blueRange：蓝色通道的扰动范围
        
        //    　　redSpeed：红色颜色的变更速度
        
        //    　　greenSpeed：绿色颜色的变更速度
        
        //    　　blueSpeed：蓝色颜色的变更速度
        
        
        //抛洒角度,指定cell从什么方向抛洒
        //    emitterCell.emissionLongitude = M_PI_2;
        //    emitterCell.emissionLatitude = M_PI_2;
        //抛洒角度浮动角度
        //    emitterCell.emissionRange = M_PI_4;
        
  
    
    //粒子的内容,
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%u",arc4random() % 4 + 1]];
    emitterCell.contents = (__bridge id _Nullable)(img.CGImage);
    
    showLayer.emitterCells = [NSArray arrayWithObjects:emitterCell, nil];
    [self.view.layer addSublayer:showLayer];
    
}




/*
 @interface CAEmitterLayer : CALayer
 
 －－粒子的数组 把设置好的粒子放入数组设置到layer上
 @property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;
 
 －－粒子产生系数，默认1.0；每个cell的产生率乘以这个粒子产生系数，得出每一秒粒子的创建个数。 即：cell.birthRate 乘以 layer.birthRate =每秒粒子产生个数
 @property float birthRate;
 
 －－粒子的生命周期系数，默认1.0  即：（cell.lifetime 乘以 layer.lifetime）等于粒子的生命周期
 @property float lifetime;
 
 －－发射源中心点的位置 默认(0,0)
 @property CGPoint emitterPosition;
 
 －－z轴上的位置
 @property CGFloat emitterZPosition;
 
 －－是发射源的大小 并不是layer的大小
 @property CGSize emitterSize;
 
 －－
 @property CGFloat emitterDepth;
 
 －－发射源的形状 有圆形 方形 线型等 粒子从什么形状发射出来，它并不是表示粒子自己的形状。
 @property(copy) NSString *emitterShape;
 
 
 －－发散形式 “layerPoints”是指发射粒子的位置在发射源的关键点上
 如方形发射源的四个角点 圆形发射源的中心点
 “OutLine”就是指例子发射的位置位于发射源的边框
 “surface”即是表面 “volume”暂时不清楚
 @property(copy) NSString *emitterMode;
 
 
 －－描绘模式 “unordered”不规律的 增加了立体感
 “oldestFirst”先生成的在上 “oldestLast”反之
 “backToFront”根据z轴上的位置进行描绘 “additive”发射源的多种粒子进行混合
 @property(copy) NSString *renderMode;
 
 
 －－是否展示在z轴上的效果 把图层进行3d变形如沿y轴旋转90度 会有很明显的立体效果
 @property BOOL preservesDepth;
 
 －－粒子速度系数, 默认1.0 发射速度 和cell的速度属性一起决定了粒子的速度 猜测粒子的速度是两者的乘积
 而且和cell的速度属性不同 这个属性可以为负 （cell.velocity 乘以 layer.velocity）等于粒子的速度
 为负的时候发散方向是向反方向的 为正时是向指定方向的
 @property float velocity;
 
 －－粒子的缩放比例系数, 默认1.0 缩放大小 和速度相同 粒子的scale值是两者相乘 cell.scale 乘以 layer.scale）等于粒子的缩放比例
 @property float scale;
 
 －－ 自旋转速度系数, 默认1.0 cell.spin 乘以 layer.spin）等于粒子的自旋转速度
 @property float spin;
 
 －－ 随机数设置种子
 @property unsigned int seed;
 */

/*
 @interface CAEmitterCell : NSObject <NSCoding, CAMediaTiming>
 
 --粒子的创建
 + (instancetype)emitterCell;
 

 --根据键获得值
+ (nullable id)defaultValueForKey:(NSString *)key
 
 
 --是否归档键值
- (BOOL)shouldArchiveValueForKey:(NSString *)key;

 --粒子的名字，默认nil.
@property(nullable, copy) NSString *name;
 
 －－是否允许被绘制出来
 @property(getter=isEnabled) BOOL enabled;
 
 －－生成速率 默认0
 @property float birthRate;

 －－生存周期 以秒为单位。两者默认0
 @property float lifetime;
 －－生存周期的绝对值的偏移量的最大值  
 @property float lifetimeRange;
 
 
 －－z轴方向上的发射角度  纬度,纬度角代表了x-z轴平面上与x轴之间的夹角，两者默认0
 @property CGFloat emissionLatitude;
 －－在xy平面上的发射角度 经度,经度角代表了x-y轴平面上与x轴之间的夹角
 @property CGFloat emissionLongitude;
 
 －－周围发射角度,默认0
 @property CGFloat emissionRange;
 
 －－放射速度 两者默认0
 @property CGFloat velocity;
 －－速度偏移量
 @property CGFloat velocityRange;
 
 
 －－在三个坐标轴上的速度增量 可以做出类似重力 风吹的效果 默认0
 @property CGFloat xAcceleration;
 @property CGFloat yAcceleration;
 @property CGFloat zAcceleration;
 
 －－缩放数值
 @property CGFloat scale;
 
 －－缩放数值的偏移量
 @property CGFloat scaleRange;
 
 －－缩放速度 不清楚怎么设置 可能和velocity属性有关系
 @property CGFloat scaleSpeed;
 
 －－旋转
 @property CGFloat spin;
 
 －－旋转的偏移量
 @property CGFloat spinRange;
 
 －－设置cell的颜色 content的颜色会影响实际颜色 默认白色
 @property(nullable) CGColorRef color;
 
 －－设置三原色和透明度的值 偏移值 0-1
 @property float redRange;
 @property float greenRange;
 @property float blueRange;
 @property float alphaRange;
 
 －－变色速率
 @property float redSpeed;
 @property float greenSpeed;
 @property float blueSpeed;
 @property float alphaSpeed;
 
 －－cell的内容 一般是UIImage
 @property(nullable, strong) id contents;
 
 －－内容范围 默认(0,0,1,1)
 @property CGRect contentsRect;
 
 －－内容缩放
 @property CGFloat contentsScale;
 
 --渲染'内容'图像时使用的滤波器参数。
 @property(copy) NSString *minificationFilter;
 @property(copy) NSString *magnificationFilter;
 @property float minificationFilterBias;
 
 ---粒子发射的粒子<烟花>
@property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;


@property(nullable, copy) NSDictionary *style;
 
 */





/** 指定发射源形状
 kCAEmitterLayerPoint 点形状，发射源的形状就是一个点，
 kCAEmitterLayerLine 线形状，发射源的形状是一条线，位置在rect的横向的位于垂直方向中间那条
 
 kCAEmitterLayerRectangle 矩形状，发射源是一个矩形，
 
 kCAEmitterLayerCuboid 立体矩形形状，发射源是一个立体矩形，这里要生效的话需要设置z方向的数据，如果不设置就同矩形状
 
 kCAEmitterLayerCircle 圆形形状，发射源是一个圆形，形状为矩形包裹的那个圆，二维的
 
 kCAEmitterLayerSphere 立体圆形，三维的圆形，同样需要设置z方向数据，不设置则通二维一样
 
 */

/**指定发射源模式
 kCAEmitterLayerPoints 点模式，发射器是以点的形势发射粒子。
 
 kCAEmitterLayerOutline 轮廓，即边上 整个边框都是发射点，即边框进行发射
 
 kCAEmitterLayerSurface 区域进行抛洒
 
 kCAEmitterLayerVolume 容积，即3D图形的体积内
 
 */

/**渲染模式
 
 kCAEmitterLayerUnordered 粒子是无序出现的，多个发射源将混合
 
 kCAEmitterLayerOldestFirst 声明久的粒子会被渲染在最上层
 
 kCAEmitterLayerOldestLast 年轻的粒子会被渲染在最上层
 
 kCAEmitterLayerBackToFront 粒子的渲染按照Z轴的前后顺序进行
 
 kCAEmitterLayerAdditive 进行粒子混合
 
 */

@end
