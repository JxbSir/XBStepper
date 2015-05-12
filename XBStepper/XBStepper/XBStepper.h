//
//  ViewController.m
//  XBStepper
//
//  Created by Peter Jin mail:i@Jxb.name on 15/5/12.
//  Github ---- https://github.com/JxbSir
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XBStepper;
typedef void (^XBStepperCallback)(XBStepper *stepper, NSInteger nowValue);

@interface XBStepper : UIControl

/**
 *  设置block
 *
 *  @param block
 */
- (void)startWithBlock:(XBStepperCallback)block;

/**
 *  设置框、文本颜色
 *
 *  @param color
 */
- (void)setBorderColor:(UIColor*)color;

/**
 *  设置值
 *
 *  @param max 最大值，默认100
 *  @param min 最小值，默认0
 *  @param now 当前值，默认0
 */
- (void)setMaxValue:(NSInteger)max min:(NSInteger)min now:(NSInteger)now;
@end
