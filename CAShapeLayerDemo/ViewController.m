//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by XuHuan on 16/2/15.
//  Copyright © 2016年 XuHuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;//**< */
@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;//**<  */
@property (strong, nonatomic) CAShapeLayer *eyeBallLayer;//**<  */
@property (strong, nonatomic) CAShapeLayer *bottomWyesocketLayer;//**<  */

@end

@implementation ViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self caShapeLayerCurveMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - demoMethod
//画矩形
- (void)caShapeLayeMethod {
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = CGRectMake(110, 110, 110, 110);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
}
//画圆
- (void)caShapeLayerCycleMethod {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:50.0];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
}
//画圆弧
- (void)caShapeLayerArcMethod {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:60 startAngle:0 endAngle:M_PI clockwise:NO];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
}
//画曲线
- (void)caShapeLayerCurveMethod {
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoit = CGPointMake(170, 200);
    CGPoint controlPoint2 = CGPointMake(200, 400);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [path moveToPoint:startPoint];
//    [path addQuadCurveToPoint:endPoint controlPoint:controlPoit];
    [path addCurveToPoint:endPoint controlPoint1:controlPoit controlPoint2:controlPoint2];
    
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
//    [layer addAnimation:[self animation1] forKey:@""];
    [self animation3:layer];
    [self.view.layer addSublayer:layer];
}
//动画
- (CABasicAnimation *)animation1 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1];
    animation.duration = 2;
    return animation;
}

- (void)animation2:(CAShapeLayer *)layer {
    layer.strokeStart = 0.5;
    layer.strokeEnd = 0.5;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = [NSNumber numberWithFloat:0.5];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 2;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.fromValue = [NSNumber numberWithFloat:0.5];
    animation2.toValue = [NSNumber numberWithFloat:1];
    animation2.duration = 2;
    
    [layer addAnimation:animation forKey:@""];
    [layer addAnimation:animation2 forKey:@""];

}

- (void)animation3:(CAShapeLayer *)layer {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = [NSNumber numberWithFloat:1];
    animation.toValue = [NSNumber numberWithFloat:10];
    animation.duration = 2;
    [layer addAnimation:animation forKey:@""];
}

#pragma mark - 微信下拉小视频眼睛


@end
