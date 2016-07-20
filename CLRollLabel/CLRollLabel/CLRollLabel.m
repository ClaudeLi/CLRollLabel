//
//  CLRollLabel.m
//  CLRollLabel
//
//  Created by ClaudeLi on 16/5/6.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "CLRollLabel.h"

@interface CLRollLabel (){
    UILabel *_rollLabel;
    NSTimer *_timer;
    CGRect totalRect; // 计算出来的Label的总rect
    BOOL _isCanRoll; // 是否能滚动
}

// 计时器每隔多久执行一次  默认0.01
@property(nonatomic,assign) NSTimeInterval timeInterval;

@end

@implementation CLRollLabel

-(void)dealloc{
    [_timer invalidate];
    _timer = nil;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _rollLabel = [[UILabel alloc] init];
        [self addSubview:_rollLabel];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        _rollLabel = [[UILabel alloc] init];
        _rollLabel.textColor = color;
        _rollLabel.font = font;
        [self addSubview:_rollLabel];
    }
    return self;
}

- (void)setTextColor:(UIColor *)textColor{
    _rollLabel.textColor = textColor;
}

- (void)setFont:(UIFont *)font{
    _rollLabel.font = font;
}

- (void)setText:(NSString *)text{
    _rollLabel.text = text;
    
    CGSize size = [self getFontSize:_rollLabel.font withSize:CGSizeMake(MAXFLOAT, 10) withText:text];
    if (size.width > self.frame.size.width) {
        _isCanRoll = YES;
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval <= 0 ? 0.01 : _timeInterval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer setFireDate:[NSDate distantFuture]];
    }else{
        size.width = self.frame.size.width;
    }
    totalRect = CGRectMake(0, 0, size.width, self.frame.size.height);
    [self resetStart];
}


-(void)timerAction{
    CGRect r = _rollLabel.frame;
    r.origin.x = r.origin.x - (_rollSpeed <= 0 ? 0.5:_rollSpeed);
    _rollLabel.frame = r;
    if (-r.origin.x > _rollLabel.frame.size.width - self.frame.size.width) {
        r.origin.x = 0;
        [self pauseRoll];
        [self performSelector:@selector(resetStart) withObject:nil afterDelay:0.5];
    }
}

// 从头开始滚动
- (void)resetStart{
    _rollLabel.frame = totalRect;
    [self startRoll];
}

// 开始滚动
-(void)startRoll{
    if (_isCanRoll && _timer && [_timer isValid]) {
        [self performSelector:@selector(start) withObject:nil afterDelay:1];
    }
}

- (void)start{
    [_timer setFireDate:[NSDate date]];
}

// 暂停
-(void)pauseRoll{
    if (_isCanRoll && _timer && [_timer isValid]) {
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

// 获取文字size
-(CGSize)getFontSize:(UIFont *)font withSize:(CGSize)cgSize withText:(NSString *)text{
    if (![text isKindOfClass:[NSNull class]]) {
        CGRect textRect = [text boundingRectWithSize:cgSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:font}
                                            context:nil];
        CGSize size = textRect.size;
        return size;
    }
    return CGSizeZero;
}


@end
