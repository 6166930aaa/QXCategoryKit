//
//  SVProgressHUD+YCat.h
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (YCat)
+(void)showHud;
+(void)hiddenHud;
+(void)showSuccessHudWithMsg:(NSString *)msg;
+(void)showErrorHudWithMsg:(NSString *)msg;
+(void)showHudWithMsg:(NSString *)msg time:(int)time;
+(void)showHudWithMsg:(NSString *)msg;
+(void)showLoadingHud;
@end

NS_ASSUME_NONNULL_END
