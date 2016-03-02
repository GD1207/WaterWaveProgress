//
//  VWWViewController.m
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import "VWWViewController.h"
#import "VWWWaterView.h"

@interface VWWViewController ()
{
    UISlider *_slider;
    VWWWaterView *waterView ;
}
@end

@implementation VWWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 190,190)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"gd.png"];
    [self.view addSubview:imageView];

    
    
    waterView = [[VWWWaterView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    waterView.center = self.view.center;
//    waterView.backgroundColor = [UIColor clearColor];//页面背景颜色改背景
//    waterView.currentWaterColor = [UIColor redColor];//水波颜色
    waterView.percentum = 0.0f;//百分比
    [self.view addSubview:waterView];
    
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) +100, self.view.frame.size.width, 10)];
    [_slider addTarget:self action:@selector(hello) forControlEvents:UIControlEventValueChanged];
    _slider.minimumValue = 0;
    _slider.maximumValue = 1;
    _slider.value = 0.0f;
    [self.view addSubview:_slider];

}
- (void)hello {
    waterView.percentum = _slider.value;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
