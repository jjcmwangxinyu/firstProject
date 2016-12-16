//
//  UIImageView+longPress.h
//  categoryUIImageView
//
//  Created by 王新宇 on 2016/12/14.
//  Copyright © 2016年 王新宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (longPress)

@property (nonatomic, copy) void(^myBlock)(NSString *url);

@end
