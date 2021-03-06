//
//  VWWWaterView.m
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import "VWWWaterView.h"

@interface VWWWaterView ()
{
    
    
    float _currentLinePointY;
    
    float a;
    float b;
    
    BOOL jia;
    UIImageView *layerImageView;
}
@end


@implementation VWWWaterView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
//        self.layer.cornerRadius =frame.size.width/2;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width/2;
        self.clipsToBounds = YES;

//        a = 1.5;
//        b = 0;
//        jia = NO;
        layerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:layerImageView];
        layerImageView.backgroundColor = [UIColor whiteColor];

        _currentWaterColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
//        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}
-(void)setPercentum:(float)percentum
{
    _percentum = percentum;
//    _currentLinePointY = self.frame.size.height * (1.0f - _percentum);
    _currentLinePointY = self.frame.size.height *_percentum;
    [self setNeedsDisplay];


}
-(void)animateWave
{
    if (jia) {
        a += 0.01;
    }else{
        a -= 0.01;
    }
    
    
    if (a<=1) {
        jia = YES;
    }
    
    if (a>=1.5) {
        jia = NO;
    }
    
    
    b+=0.1;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    

    
    layerImageView.frame = CGRectMake(_currentLinePointY, 0, self.frame.size.width-_currentLinePointY, self.frame.size.height);
    
//    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(_currentLinePointY, 0, self.frame.size.width, self.frame.size.height)];
////    img.layer.cornerRadius = self.frame.size.width/2;
////    img.clipsToBounds = YES;
//    [self addSubview:img];
//    img.backgroundColor = [UIColor yellowColor];
    
    
    
#if 0
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float x=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, x, 0);
    for(float y=0;y<=self.frame.size.width;y++){
//        y= a * sin( x/180*M_PI + 4*b/M_PI ) * 5 + _currentLinePointY;
        x= _currentLinePointY;

        CGPathAddLineToPoint(path, nil, x, y);

    }

    CGPathAddLineToPoint(path, nil, self.frame.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
//
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
#endif
    
    
#if 0
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context1, 1);
    CGContextSetFillColorWithColor(context1, [_currentWaterColor CGColor]);
    
    float y1=_currentLinePointY;
    CGPathMoveToPoint(path1, NULL, 0, y1);
    for(float x=0;x<=self.frame.size.width;x++){
        y1= a * atan( x/180*M_PI + 4*b/M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path1, nil, x, y1);
        
    }
    
//        CGPathAddLineToPoint(path1, nil, self.frame.size.width, rect.size.height);
//        CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    //    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    //
    CGContextAddPath(context1, path1);
    CGContextFillPath(context1);
    CGContextDrawPath(context1, kCGPathStroke);
    CGPathRelease(path1);
#endif
    
}


@end
