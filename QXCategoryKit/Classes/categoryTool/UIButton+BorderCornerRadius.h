//
//  UIButton+BorderCornerRadius.h
//  dsadsad
//
//  Created by 任爽 on 2019/1/17.
//  Copyright © 2019年 我不喝爽歪歪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BorderCornerRadius)
// 注意: 加上IBInspectable就可以可视化显示相关的属性哦
/** 可视化设置边框宽度 */
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
/** 可视化设置边框颜色 */
@property (nonatomic, strong)IBInspectable UIColor *borderColor;

/** 可视化设置圆角 */
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@end

NS_ASSUME_NONNULL_END
