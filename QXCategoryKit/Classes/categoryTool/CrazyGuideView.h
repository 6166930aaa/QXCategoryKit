//
//  easyflyGuideView.h
//  ZiHaiKeJiP2P
//
//  Created by dukai on 15/6/7.
//  Copyright (c) 2015年 dukai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^finish_block)(void);

@interface CrazyGuideView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)finish_block block;

@property(nonatomic,strong)UIPageControl *pageCtr;
@property(nonatomic,strong)UIScrollView *ScrollView;
@property(nonatomic,strong)UIButton *startBtn;
@property(nonatomic,strong)UIButton *skipBtn;
-(void)createLocationImageArr:(NSArray *)ImageArr block:(finish_block)block;

@end



//2015-07-08   1.新添加视差滑动效果   2.可自动判断 图片来源本地还是网络
