//
//  ViewController.m
//  GIFDemo
//
//  Created by 安宁 on 2017/7/19.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self gif1];
}

-(void)gif2
{
    //难以在各机型间适配
    NSString * path = [[NSBundle mainBundle] pathForResource:@"wait.gif" ofType:nil];
    NSData * gifData = [NSData dataWithContentsOfFile:path];
    
    CGFloat width = 150.0f / 750.0f * CGRectGetWidth(self.view.frame) ;
    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(100, 100, width, width)];
    webView.scalesPageToFit = YES;
    //    webView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    [webView setContentMode:UIViewContentModeScaleToFill];
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = NO;
    webView.clipsToBounds = NO ;
    //    webView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:webView];

}
-(void)gif1
{
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    CGFloat backViewWidth = 100.0f / 750.0f *  CGRectGetWidth(screenBounds) ;

    CGFloat gifWidth = 100.0f / 750.0f *  CGRectGetWidth(screenBounds);
    CGFloat gifSpace = 100  ;
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(gifSpace, gifSpace, gifWidth, gifWidth)];
//    gifImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gifImageView];
    
    
    gifImageView.image = [UIImage imageNamed:@"gif.png"];
    CABasicAnimation *  rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.9;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT ;

    [gifImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];


}


@end
