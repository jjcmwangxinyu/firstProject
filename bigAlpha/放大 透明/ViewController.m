//
//  ViewController.m
//  放大 透明
//
//  Created by JJJR on 16/5/23.
//  Copyright © 2016年 zhongqian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

{
    UIImageView * img;
    UITableView * _tab;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    _tab = [[UITableView alloc] init];
    _tab.frame = self.view.bounds;
    _tab.dataSource = self;
    _tab.delegate = self;
    [self.view addSubview:_tab];
    _tab.contentInset=UIEdgeInsetsMake(200, 0, 0, 0);
    img = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, [UIScreen mainScreen].bounds.size.width, 200)];
    img.image = [UIImage imageNamed:@"hahha.jpg"];
    [_tab addSubview:img];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"11";
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat xOffset = (offset + 200)/2;
    if (offset < -200) {
        CGRect rect = img.frame;
        rect.origin.y = offset;
        rect.size.height =  -offset ;
        rect.origin.x = xOffset;
        rect.size.width = [UIScreen mainScreen].bounds.size.width + fabs(xOffset)*2;
        
        img.frame = rect;
    }
    CGFloat alpha = (offset+200)/136 ;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor redColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    alpha = alpha >= 1 ? 1 : alpha <=0 ? 0 : alpha;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//
//{
//    
//    if(velocity.y>0)
//        
//    {
//        
//        self.navigationController.navigationBar.hidden = YES;
//        
//    }
//    
//    else
//        
//    {
//        
//        self.navigationController.navigationBar.hidden = NO;
//        
//    }
//    
//}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
