//
//  UIViewController+YCat.h
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YCat)

/**
 是否隐藏导航条

 @param type 隐藏与否
 */
- (void)hiddenNav:(BOOL)type;

/**
 增加全局手势隐藏键盘
 */
- (void)configHiddenKeyBoard;

- (void)loadSubView;
@end

NS_ASSUME_NONNULL_END
