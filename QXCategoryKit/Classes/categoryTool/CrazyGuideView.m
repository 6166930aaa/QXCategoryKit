//
//  easyflyGuideView.m
//  ZiHaiKeJiP2P
//
//  Created by dukai on 15/6/7.
//  Copyright (c) 2015年 dukai. All rights reserved.
//

#import "CrazyGuideView.h"

@implementation CrazyGuideView
{
    int allPage;
    CGFloat currentPageNumber;
    CGFloat otherPageNumber;
}

- (instancetype)init
{
    
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self createView];
    }
    return self;
}

- (void)createView {
    
    self.ScrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.backgroundColor = [UIColor whiteColor];
    self.ScrollView.delegate = self;
    self.ScrollView.bounces = NO;
    self.userInteractionEnabled = YES;
    [self addSubview:self.ScrollView];

    self.startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startBtn.frame = CGRectMake(0, 0, kScreenWidth*0.37, 36);
    self.startBtn.center = CGPointMake(self.center.x, kScreenHeight-(60+SYCSafeAreaBottomHeight));
    [self.startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [self.startBtn setTitleColor:HEXCOLOR(0xfb4434) forState:UIControlStateNormal];
    self.startBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    self.startBtn.layer.cornerRadius = 18;
    self.startBtn.layer.masksToBounds = YES;
    self.startBtn.backgroundColor =[UIColor whiteColor];
    self.startBtn.layer.borderColor = HEXCOLOR(0xfb4434).CGColor;
    self.startBtn.layer.borderWidth = 1;
    [self.startBtn addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:self.startBtn];
//    self.startBtn.hidden = YES;
    
    self.pageCtr = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kScreenHeight-(30 + SYCSafeAreaBottomHeight), kScreenWidth, 30)];
    self.pageCtr.currentPageIndicatorTintColor = HEXCOLOR(0xfb4434);
    self.pageCtr.pageIndicatorTintColor = HEXCOLOR(0xfedad6);
    [self addSubview:self.pageCtr];
    
//    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [app.window addSubview:self];
    
    [MainWindow addSubview:self];
    [MainWindow bringSubviewToFront:self];
}

- (void)createLocationImageArr:(NSArray *)ImageArr block:(finish_block)block{
    currentPageNumber = 0.0;
    otherPageNumber = 0.0;
    self.block = block;
    
    for (int i =0 ; i<ImageArr.count; i++) {
        
        CGRect frame = CGRectMake(kScreenWidth *i, 0.0, kScreenWidth, kScreenHeight);
        UIView * subview = [[UIView alloc]initWithFrame:frame];
        
        UIScrollView * internalScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0, 0.0, kScreenWidth, kScreenHeight)];
        internalScrollView.scrollEnabled = NO;
        CGRect imageViewFrame =CGRectMake(0.0, 0.0, internalScrollView.frame.size.width, internalScrollView.frame.size.height);
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageViewFrame];
        imageView.userInteractionEnabled = YES;
//        imageView.backgroundColor = HEXCOLOR(0xffda44);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
//        UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        skipBtn.frame = CGRectMake(HEIGHT(278), HEIGHT(31), HEIGHT(33), HEIGHT(20));
//        [skipBtn setBackgroundImage:[UIImage imageNamed:@"skip.png"] forState:UIControlStateNormal];
//        [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
//        [skipBtn setTitleColor:HEXCOLOR(0xfd5185) forState:UIControlStateNormal];
//        skipBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
//        skipBtn.layer.cornerRadius = 15;
//        skipBtn.layer.borderWidth = 1;
//        skipBtn.layer.borderColor = HEXCOLOR(0xfd5185).CGColor;
//        [skipBtn addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
//        [imageView addSubview:skipBtn];
//        [skipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-30);
//            make.top.mas_equalTo(SYCSafeAreaTopHeight/2);
//            make.width.mas_equalTo(60);
//            make.height.mas_equalTo(30);
//        }];
        
        //判断是本地图片 还是网络图片
        NSString *imageName = ImageArr[i];
        if (imageName.length>4 && [[imageName substringToIndex:4] isEqualToString:@"http"]) {
                [imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
        }else{
            [imageView setImage:[UIImage imageNamed:imageName]];
        }
        
//        [self addMotionEffectToView:imageView magnitude:0.0];
        
        internalScrollView.tag = (i + 1) * 10;
        imageView.tag = (i + 1) * 1000;
        
        [internalScrollView addSubview:imageView];
        [subview addSubview:internalScrollView];
        [self.ScrollView addSubview:subview];
//        [internalScrollView addSubview:self.skipBtn];
        if (i == ImageArr.count-1) {
            [internalScrollView addSubview:self.startBtn];
            [MainWindow bringSubviewToFront:self];
        }
        
    }
    self.pageCtr.numberOfPages = ImageArr.count;
    self.ScrollView.contentSize = CGSizeMake(kScreenWidth * (ImageArr.count+1), kScreenHeight);
   
    allPage = (int)ImageArr.count;
}
-(void)start{
    
    [self skip];
//    [self.ScrollView setContentOffset:CGPointMake(allPage*kScreenWidth, 0) animated:YES];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [self removeFromSuperview];
//    });
//
//    if (self.block) {
//        self.block();
//    }
}
-(void)skip{
    
    if (self.block) {
        self.block();
    }
    [self.ScrollView setContentOffset:CGPointMake(allPage*kScreenWidth, 0) animated:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UIScrollView * internalScrollView = (UIScrollView *)[scrollView viewWithTag:((currentPageNumber + 1) * 10)];
    internalScrollView.contentOffset = CGPointMake(0.0, 0.0);
    
    currentPageNumber = (int)scrollView.contentOffset.x / (int)scrollView.frame.size.width;
    
    //页面控制器的当前页
    self.pageCtr.currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width;
    //移除页面
    if (scrollView.contentOffset.x/scrollView.bounds.size.width == allPage) {
        
        if (self.block) {
            self.block();
        }
        [self removeFromSuperview];
        
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //判断 让pageCtr 跟着最后一张图 一起滑动
    if (scrollView.contentOffset.x>(allPage-1)*kScreenWidth ) {
        
        float ptx = scrollView.contentOffset.x-(allPage-1)*kScreenWidth;
        self.pageCtr.frame = CGRectMake(-ptx,self.pageCtr.frame.origin.y , self.pageCtr.frame.size.width, self.pageCtr.frame.size.height);
    }
    
    CGFloat offset = scrollView.contentOffset.x;
    
    UIScrollView * internalScrollView = (UIScrollView*)[scrollView viewWithTag:((currentPageNumber + 1) * 10)];
    internalScrollView.contentOffset = CGPointMake(-0.4 * (offset - (kScreenWidth * (CGFloat)currentPageNumber)), 0.0);
}

//视差滑动效果
-(void)addMotionEffectToView:(UIView*)view magnitude:(CGFloat)magnitude{
    UIInterpolatingMotionEffect * xMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    UIInterpolatingMotionEffect * yMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    xMotion.minimumRelativeValue = @(magnitude);
    xMotion.maximumRelativeValue = @(magnitude);
    yMotion.minimumRelativeValue = @(-magnitude);
    yMotion.maximumRelativeValue = @(magnitude);
    UIMotionEffectGroup * motionGroup = [[UIMotionEffectGroup alloc]init];
    motionGroup.motionEffects = @[xMotion, yMotion];
    [view addMotionEffect:motionGroup ];
    
}
@end
