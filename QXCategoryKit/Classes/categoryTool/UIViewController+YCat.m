//
//  UIViewController+YCat.m
//  laiQianDao
//
//  Created by bt on 2019/3/12.
//  Copyright © 2019 syc. All rights reserved.
//

#import "UIViewController+YCat.h"

@implementation UIViewController (YCat)

+(void)load{
    [UITabBar appearance].translucent = NO;
}

-(void)hiddenNav:(BOOL)type{
    [self.navigationController setNavigationBarHidden:type animated:YES];
}

-(void)configHiddenKeyBoard{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closseKeyBoard:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}

-(void)closseKeyBoard:(UITapGestureRecognizer*)tap1{
    [self.view endEditing:YES];
}

-(void)loadSubView{}
@end
