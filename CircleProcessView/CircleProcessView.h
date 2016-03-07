//
//  CircleProcessView.h
//  CircleProcessView
//
//  Created by 超冷 on 15/12/2.
//  Copyright © 2015年 Chono. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CircleProcessViewDelegate <NSObject>

-(void)updateProgressView;

@end

@interface CircleProcessView : UIView

@property CGFloat progress;

@property (nonatomic , weak) id <CircleProcessViewDelegate>delegate;

-(void)drawProgressWithProgerss:(CGFloat)progress;
@end
