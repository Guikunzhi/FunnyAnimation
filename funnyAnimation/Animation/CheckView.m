//
//  CheckView.m
//  funnyAnimation
//
//  Created by guikz-xueba on 15/10/14.
//  Copyright © 2015年 guikz. All rights reserved.
//

#import "CheckView.h"

@interface CheckView ()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) CAShapeLayer *animationLayer;

@end

@implementation CheckView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth {
    NSAssert(radius > 0, @"radius must be positive");
    self = [super init];
    if (self) {
        _radius = radius;
        _lineWidth = lineWidth;
    }
    return self;
}

- (void)addAnimationLayer {
    [self.animationLayer removeFromSuperlayer];
    self.animationLayer = [CAShapeLayer layer];
    
    CGPoint center = [self convertPoint:self.center fromView:self.superview];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center radius:self.radius startAngle:M_PI endAngle:2 * M_PI clockwise:NO];
    [path addArcWithCenter:center radius:self.radius startAngle:0 endAngle:M_PI clockwise:NO];
    
    CGRect rect = CGRectMake(center.x - self.radius/sqrt(2), center.y - self.radius/sqrt(2), self.radius * sqrt(2), self.radius * sqrt(2));
    
    [path moveToPoint:CGPointMake(rect.origin.x, rect.origin.y + 1.0/2 * rect.size.width)];
    [path addLineToPoint:CGPointMake(rect.origin.x + 7.0/18 * rect.size.width, rect.origin.y + 5.0/6 * rect.size.width)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + 1.0/6 * rect.size.width)];
    
    self.animationLayer.path = path.CGPath;
    self.animationLayer.fillColor = [UIColor whiteColor].CGColor;
    self.animationLayer.strokeColor = [UIColor greenColor].CGColor;
    self.animationLayer.lineWidth = self.lineWidth;
    self.animationLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:self.animationLayer];
}

- (void)show {
    [self addAnimationLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 0.8f;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.delegate = self;
    [self.animationLayer addAnimation:animation forKey:@"check"];
}

@end
