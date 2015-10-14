//
//  ViewController.m
//  funnyAnimation
//
//  Created by guikz-xueba on 15/10/12.
//  Copyright © 2015年 guikz. All rights reserved.
//

#define MAS_SHORTHAND

#define MAS_SHORTHAND_GLOBALS

#define kDeviceWidth    ([[UIScreen mainScreen] bounds].size.width)

#define kDeviceHeight   ([[UIScreen mainScreen] bounds].size.height)

#define kRadius 50

#define kLineWidth 5

#import "ViewController.h"
#import "CheckView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) CheckView *checkView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *showButton = [UIButton new];
    showButton.backgroundColor = [UIColor grayColor];
    [showButton setTitle:@"Show" forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
    [showButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(-100);
        make.size.equalTo(CGSizeMake(100, 40));
        make.bottom.equalTo(self.view).offset(-100);
    }];
    
    UIButton *hideButton = [UIButton new];
    hideButton.backgroundColor = [UIColor grayColor];
    [hideButton setTitle:@"Hide" forState:UIControlStateNormal];
    [hideButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideButton];
    [hideButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(100);
        make.size.equalTo(CGSizeMake(100, 40));
        make.bottom.equalTo(self.view).offset(-100);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)show {
    [self.checkView removeFromSuperview];
    self.checkView = [[CheckView alloc] initWithRadius:50 lineWidth:5];
    self.checkView.frame = CGRectMake(0, 0, 150, 150);
    self.checkView.center = self.view.center;
    [self.view addSubview:self.checkView];
    [self.checkView show];
}

- (void)hide {
    [self.checkView removeFromSuperview];
}

@end
