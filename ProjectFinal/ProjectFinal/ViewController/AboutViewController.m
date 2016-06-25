//
//  AboutViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
    
    self.strTitle = @"About";
    
    [self.webView loadHTMLString:@"<html><body><p align=\"justify\" style=\"font-size:12px;\">Ứng dụng Ôn Thi Lịch Sử được tạo ra nhằm phục vụ cho việc ôn thi bộ môn lịch sử lớp 12 và ôn thi vào ĐH-CĐ, thi tốt nghiệp THPT và bồi dưỡng học sinh giỏi môn Lịch Sử cho học sinh cấp 3. Ứng dụng gồm các chức năng:<br/><br/>1. Ôn tập các chương trong sách giáo khoa Lịch Sử lớp 12.<br/>2.Luyện các bộ đề thi ĐH-CĐ, thi tốt nghiệp THPT và bồi dưỡng học sinh giỏi môn Quốc Gia môn Lịch Sử.<br/>3.Cập nhật câu hỏi và bộ đề liên tục. (Ứng dụng hoàn toàn miễn phí)<br/><br/>Chúng tôi cam kết sẽ liên tục cập nhật và nâng cấp ứng dụng ngày một tốt hơn. Mọi câu hỏi và thắc mắc các bạn có thể liên hệ với chúng tôi qua email hoặc số điện thoại. <br/><br/><br/>Email vn: noivuathoiyou@gmail.com<br/>Ph: +84964056195</p> </body></html>" baseURL:nil];
    
    NSLog(@" title la :  %@",self.lblTitle);
}

//- (void)backAction:(id)sender
//{
//    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
//    [self.view addGestureRecognizer: self.revealViewController.panGestureRecognizer];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}
@end
