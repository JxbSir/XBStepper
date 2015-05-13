# XBStepper
一个数字的计数器

-------
##支持CocoaPods引入
`pod 'JXBStepper'`

-------
##调用接口
``` object-c
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
``` 

##创建代码
```object-c
XBStepper* stepper = [[XBStepper alloc] initWithFrame:CGRectMake(60, 100, 200, 40)];
[stepper setMaxValue:10 min:-10 now:1];
[stepper setBorderColor:[UIColor colorWithRed:0 green:191/255. blue:1 alpha:1]];
[self.view addSubview:stepper];
```

##控件展示图
![](https://raw.githubusercontent.com/JxbSir/XBStepper/master/screenshoot/screenshot.gif)
