//
//  UIImageView+longPress.m
//  categoryUIImageView
//
//  Created by 王新宇 on 2016/12/14.
//  Copyright © 2016年 王新宇. All rights reserved.
//

#import "UIImageView+longPress.h"
#import <objc/runtime.h>

@implementation UIImageView (longPress)

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self longPress];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self longPress];
    return self;
}

- (void)longPress {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPress.minimumPressDuration = 1.0;
    [self addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)press {
    if (press.state == UIGestureRecognizerStateBegan) {
        if (self.myBlock) {
            self.myBlock(@"h577577575");
        }
    }
}

- (void)setMyBlock:(void (^)(NSString *))myBlock {
    objc_setAssociatedObject(self, @selector(myBlock), myBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(NSString *str))myBlock {
    return objc_getAssociatedObject(self, @selector(myBlock));
}

@end
