//
//  SVProgressHUD+YCat.m
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import "SVProgressHUD+YCat.h"

@implementation SVProgressHUD (YCat)
+(void)defaultSet{
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}
+(void)fullScreenSet{
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}
+(void)showHud{
    [SVProgressHUD defaultSet];
    [SVProgressHUD show];
    
    //loading最多显示20秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD hiddenHud];
    });
}

+(void)hiddenHud{
    [SVProgressHUD dismiss];
}

+(void)showSuccessHudWithMsg:(NSString *)msg{
    [SVProgressHUD defaultSet];
    [SVProgressHUD showSuccessWithStatus:msg];
    [SVProgressHUD dismissWithDelay:2];
}

+(void)showErrorHudWithMsg:(NSString *)msg{
    [SVProgressHUD defaultSet];
    [SVProgressHUD showErrorWithStatus:msg];
    [SVProgressHUD dismissWithDelay:2];
}

+(void)showHudWithMsg:(NSString *)msg time:(int)time{
    [SVProgressHUD defaultSet];
//    [SVProgressHUD showErrorWithStatus:msg];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"empty"]];
    [SVProgressHUD showInfoWithStatus:msg];
    [SVProgressHUD dismissWithDelay:time];
}

-(void)showNetError{
    [SVProgressHUD showErrorHudWithMsg:@"网络异常，请稍后重试"];
}

+(void)showHudWithMsg:(NSString *)msg{
    [self fullScreenSet];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"empty"]];
    [SVProgressHUD showInfoWithStatus:msg];
//    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 200)];
    [SVProgressHUD dismissWithDelay:2];
}

+(void)showLoadingHud{
    [self fullScreenSet];
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD hiddenHud];
    });
}


@end
