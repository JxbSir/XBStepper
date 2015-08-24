//
//  ViewController.m
//  XBStepper
//
//  Created by Peter Jin mail:i@Jxb.name on 15/5/12.
//  Github ---- https://github.com/JxbSir
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "XBStepper.h"

@interface XBStepper ()
@property(nonatomic,copy)XBStepperCallback  myBlock;

@property(nonatomic,copy)UIColor        *myBorderColor;
@property(nonatomic,copy)UIColor        *myTextColor;

@property(nonatomic,assign)NSInteger    valueMax;
@property(nonatomic,assign)NSInteger    valueMin;
@property(nonatomic,assign)NSInteger    valueNow;

@property(nonatomic,strong)UIView       *vLineFront;
@property(nonatomic,strong)UIView       *vLineBack;
@property(nonatomic,strong)UITextField  *txtCount;

@property(nonatomic,strong)UIButton     *btnDecrease;
@property(nonatomic,strong)UIButton     *btnIncrease;
@end

@implementation XBStepper

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _valueMax = 100;
        _valueMin = 0;
        _valueNow = 0;
        
        [self initUIs];
        
        [self reloadStepper];
    }
    return self;
}

/**
 *  设置UI
 */
- (void)initUIs {
    _myBorderColor = [UIColor redColor];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1;
    self.layer.borderColor = _myBorderColor.CGColor;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    [self AddUIs];
}

/**
 *  添加UI控件
 */
- (void)AddUIs {
    _txtCount = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _txtCount.textColor = _myTextColor;
    _txtCount.font = [UIFont systemFontOfSize:16];
    _txtCount.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_txtCount];
    
    _btnDecrease = [self tempButton:CGRectMake(0, 0, self.frame.size.width / 4, self.frame.size.height) title:@"-"];
    [_btnDecrease addTarget:self action:@selector(btnActionDecease) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnDecrease];
    
    _btnIncrease = [self tempButton:CGRectMake(self.frame.size.width - self.frame.size.width / 4, 0, self.frame.size.width / 4, self.frame.size.height) title:@"+"];
    [_btnIncrease addTarget:self action:@selector(btnActionIncease) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnIncrease];
}

/**
 *  创建按钮
 */
- (UIButton*)tempButton:(CGRect)frame title:(NSString*)title {
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.titleLabel.frame = btn.frame;
    btn.layer.borderColor = _myBorderColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
    [btn.titleLabel setFont:[UIFont systemFontOfSize:30]];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:_myTextColor forState:UIControlStateNormal];
    return btn;
}

/**
 *  加载数据
 */
- (void)reloadStepper {
    [_btnIncrease setTitleColor:_myTextColor forState:UIControlStateNormal];
    [_btnDecrease setTitleColor:_myTextColor forState:UIControlStateNormal];
    if (_valueNow >= _valueMax) {
        _valueNow = _valueMax;
        [_btnIncrease setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else if (_valueNow <= _valueMin) {
        _valueNow = _valueMin;
        [_btnDecrease setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    _txtCount.text = [NSString stringWithFormat:@"%d",(int)_valueNow];
    
    if (_myBlock != NULL) {
        _myBlock(self,_valueNow);
    }
}

- (void)startWithBlock:(XBStepperCallback)block
{
    _myBlock = block;
}

#pragma mark - 加减事件
- (void)btnActionDecease {
    _valueNow --;
    [self reloadStepper];
}

- (void)btnActionIncease {
    _valueNow ++;
    [self reloadStepper];
}

#pragma mark - 对外函数
- (void)setBorderColor:(UIColor*)color textColor:(UIColor*)textColor {
    _myBorderColor = color;
    _myTextColor = textColor;
    self.layer.borderColor          = color.CGColor;
    self.vLineFront.backgroundColor = color;
    self.vLineBack.backgroundColor  = color;
    
    _txtCount.textColor = textColor;
    
    _btnDecrease.layer.borderColor = color.CGColor;
    [_btnDecrease setTitleColor:textColor forState:UIControlStateNormal];
    
    _btnIncrease.layer.borderColor = color.CGColor;
    [_btnIncrease setTitleColor:textColor forState:UIControlStateNormal];
}

- (void)setMaxValue:(NSInteger)max min:(NSInteger)min now:(NSInteger)now {
    if(min > max)
        return;
    _valueMax = max;
    _valueMin = min;
    _valueNow = now;
    [self reloadStepper];
}
@end
