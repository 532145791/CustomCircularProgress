//
//  CircleProcessView.m
//  CircleProcessView
//
//  Created by 超冷 on 15/12/2.
//  Copyright © 2015年 Chono. All rights reserved.
//

#import "CircleProcessView.h"

@interface CircleProcessView ()
{
    CGFloat processWidth;
    CGFloat radius;
    UIColor *backColor;
    UIColor *progressColor;
}

@end

@implementation CircleProcessView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        processWidth = 10;
        radius = frame.size.width/2;
        backColor = [UIColor greenColor];
        progressColor = [UIColor redColor];
        self.progress = 0.0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //绘制背景颜色
    UIBezierPath *backCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                              radius:self.bounds.size.width / 2 - processWidth / 2
                                                          startAngle:(CGFloat) - M_PI_2
                                                            endAngle:(CGFloat)(1.5 * M_PI)
                                                           clockwise:YES];
    [backColor setStroke];
    backCircle.lineWidth = processWidth;
    [backCircle stroke];
    
    //绘制进度条
    if (self.progress > 0) {
        
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                                      radius:self.bounds.size.width / 2 - processWidth / 2
                                                                  startAngle:(CGFloat) - M_PI_2
                                                                    endAngle:(CGFloat)(- M_PI_2 + self.progress * 2 * M_PI)
                                                                   clockwise:YES];
        [progressColor setStroke];
        progressCircle.lineWidth = processWidth;
        [progressCircle stroke];
    }
    
    [self addCenterLabel];
}

#pragma mark - 绘制中心lab
- (void)addCenterLabel{
    NSString *percent = @"";
    float fontSize = 14;
    UIColor *arcColor = [UIColor blackColor];
    percent = [NSString stringWithFormat:@"%0.f%%",self.progress*100];
    
    CGSize viewSize = self.bounds.size;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:fontSize],NSFontAttributeName ,arcColor,NSForegroundColorAttributeName,[UIColor clearColor],NSBackgroundColorAttributeName,paragraph,NSParagraphStyleAttributeName,nil];
    [percent drawInRect:CGRectMake(5, (viewSize.height-fontSize)/2, viewSize.width-10, fontSize) withAttributes:attributes];
}

-(void)drawProgressWithProgerss:(CGFloat)progress{
    self.progress = progress;
    [self setNeedsDisplay];
}

@end
