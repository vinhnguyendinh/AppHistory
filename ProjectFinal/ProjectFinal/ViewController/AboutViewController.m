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
    
    _webViewHeight.constant = (self.view.frame.size.height - 65);
    
    [self.view addGestureRecognizer:[SWRevealViewController sharedInstance].panGestureRecognizer];
    
    self.strTitle = @"Giới thiệu";
    
    [self.webView loadHTMLString:@"<html><body><p align=\"justify\" style=\"font-size:17px;\">Ứng dụng Ôn Thi Lịch Sử được tạo ra nhằm phục vụ cho việc ôn thi bộ môn lịch sử lớp 12 và ôn thi vào ĐH-CĐ, thi tốt nghiệp THPT và bồi dưỡng học sinh giỏi môn Lịch Sử cho học sinh cấp 3. Ứng dụng gồm các chức năng:<br/><br/>1. Ôn tập các chương trong sách giáo khoa Lịch Sử lớp 12.<br/>2.Luyện các bộ đề thi ĐH-CĐ, thi tốt nghiệp THPT và bồi dưỡng học sinh giỏi môn Quốc Gia môn Lịch Sử.<br/>3.Cập nhật câu hỏi và bộ đề liên tục. (Ứng dụng hoàn toàn miễn phí)<br/><br/>Chúng tôi cam kết sẽ liên tục cập nhật và nâng cấp ứng dụng ngày một tốt hơn. Mọi câu hỏi và thắc mắc các bạn có thể liên hệ với chúng tôi qua email hoặc số điện thoại. <br/><br/><br/>Email : noivuathoiyou@gmail.com Or: vinhnguyendinhbg@gmail.com<br/>Phone: +84964056195 Or: +84967286627</p> </body></html>" baseURL:nil];
    
    NSLog(@" title la :  %@",self.lblTitle);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)backAction:(id)sender
{
    [[SWRevealViewController sharedInstance] revealToggle:self.btnBack];
}
@end
