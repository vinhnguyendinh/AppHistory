//
//  TQUtils.h
//  12Q
//
//  Created on 3/22/14.
//  Copyright (c) 2014 Twelvebits Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "SPStyles.h"

#define LocalizedString(key) \
[Utils localizeString: key]
#define kUD_Language @"_APP_LANGUAGE_"
#define kDeviceToken @"kCurrentDeviceID"
#define kRecivedMessagePush @"kRecivedMessagePush"

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPAD ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)

#define kColorLightGray [UIColor colorWithRed:234.0f/255.0f green:233.0f/255.0f blue:233.0f/255.0f alpha:1.0f]
#define kColorBlack [UIColor colorWithRed:60.0f/255.0f green:60.0f/255.0f blue:60.0f/255.0f alpha:1.0f]
#define kColorRed [UIColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f]
#define kColorWhite [UIColor whiteColor]
#define kColorMainColor [UIColor colorWithRed:150.0f/255.0f green:200.0f/255.0f blue:69.0f/255.0f alpha:1.0f]
#define kColorLightBlue [UIColor colorWithRed:22.0f/255.0f green:136.0f/255.0f blue:250.0f/255.0f alpha:1.0f]
#define kColorGreenDark [UIColor colorWithRed:84.0f/255.0f green:216.0f/255.0f blue:220.0f/255.0f alpha:1.0f]
#define kColorDarkOpaque [UIColor colorWithRed:10.0f/255.0f green:10.0f/255.0f blue:10.0f/255.0f alpha:0.7f]
#define kColorGreen [UIColor colorWithRed:121.0f/255.0f green:198.0f/255.0f blue:69.0f/255.0f alpha:1.0f]
//#define kColorGray [UIColor colorWithRed:80.0f/255.0f green:80.0f/255.0f blue:80.0f/255.0f alpha:1.0f]
//#define kColorGrayDisable [UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0f]
#define kColorLightGreen [UIColor colorWithRed:5.0f/255.0f green:209.0f/255.0f blue:4.0f/255.0f alpha:1.0f]
#define kColorLightRed [UIColor colorWithRed:237.0f/255.0f green:28.0f/255.0f blue:36.0f/255.0f alpha:1.0f]
#define SAFE_STR(key) [Utils genSafeString: key]
#define SAFE_NUM(key) [Utils genSafeInt: key]
#define IS_NULL(key) [Utils isEmpty: key]

#define kUD_ListTrip @"kUD_ListTrip"

#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface Utils : NSObject

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer2;
@property (nonatomic, strong) MPMusicPlayerController *musicPlayer;

+ (NSDateFormatter *) dateFormatterDOBDisplay;
+ (NSString *) convertString:(NSString *)string from:(NSDateFormatter *)typeFrom to:(NSDateFormatter *)typeTo;
+ (NSString *)applicationDocumentsDirectory;
+ (void) applyAttributeText:(NSString *)text1 text:(NSString *)text2 color1:(UIColor *)color1 color2:(UIColor *)color2 inLabel:(UILabel *)lbl;
+ (NSString *) localizeString: (NSString *) key;
+ (BOOL) isEmpty:(id) val;
+ (BOOL) isHTTPLink:(NSString *)link;
+ (NSInteger) numberOfLineFromString :(NSString *)str width:(float)_width;
+ (NSString *)dateDescriptionInVietNam:(NSString *)strDate;
+ (CGFloat) measureHeightOfUITextView:(UITextView *)textView;
+ (UILabel *)copyLabel:(UILabel *)label;
+ (UITextView *)copyTextView:(UITextView *)label;
+ (UIButton *)copyButton:(UIButton *)button;
+ (UIView *)copyView:(UIView *)view;
+ (NSString *) stringByTrimmed:(NSString *) stringToTrim;
+ (void) showResetNotification;
+ (void) showNotification:(NSString *) notificationMessage;
+ (BOOL) isEmailFormatValid:(NSString *) email;
+ (void) customizeSegmentationControl;
+ (void)shakeView:(UIView *)viewToShake;
+ (void) playButtonSound;
+ (CGRect) boundsiOS7;
+ (void) configFont:(id)lbl fontName:(NSString *) fontName;
+ (NSDateFormatter *) dateFormatterCommon;
+ (NSDateFormatter *) dateFormatterISO8601;
+ (CGSize) sizeOfDevice;
+ (NSDateFormatter *) dateFormatterShort;
+ (NSString*) stringJSONByDictionary:(id)dict;
+ (id) dictByJSONString:(NSString *)str;
+ (NSString *)platformString;
+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc;
+ (void)setCornerRadiusView:(UIView *)view withCornerRadius:(CGFloat)corner;
+ (NSString *) formatInterval: (NSTimeInterval) interval;
+ (void)fixSizeLable:(UILabel *)label withScare:(CGSize)sizeScare;
+ (NSString *)versionApp;
+ (UIColor *)colorFromHex:(NSString *)stringColor;
+ (void) setWidhView:(UIView *)view width:(int)width;
+ (void) setHeightView:(UIView *)view height:(int)height;
+ (void) setXView:(UIView *)view height:(int)x;
+ (void) setYView:(UIView *)view height:(int)y;
+ (void) fitLabel:(UILabel *)lbl toWidth:(int) width numberOfLine:(int) numberOfLine;
+ (NSString *)genSafeString:(NSString *)str;
+ (NSString *)genSafeInt:(NSString *)str;
+ (NSString *) md5:(NSString *) input;
+ (NSString *)fullNameFromFirst:(NSString *)fName last:(NSString *)lName middle:(NSString *)middleName;
+ (BOOL)isLabelTruncated:(UILabel *)lbl;
+ (NSString *)numberWithThousandSeparator:(NSString *)number;
+ (UIViewController*) getTopMostViewController;
+ (NSDictionary *)removeObjectNullInDict:(NSDictionary *)dicts;
+ (UIStoryboard *) mainStoryboard;
+ (UIStoryboard *)magazineStoryboard;;
+ (UIStoryboard *)pagesStoryboard;
+ (void) addKey:(NSString *)key value:(id)value toDict:(NSMutableDictionary *)dict;
+ (NSDateFormatter *) dateFormatterDateOnly;
+ (id) validateData:(id)obj;
+ (void)cloneObjectFrom:(id)source toTaget: (id)taget;
//+ (NSDateFormatter *) dateFormatterDOBOnlyVietnam;
+ (NSString *)urlencode:(NSString *)str;
+ (NSString *)normalizeString:(NSString *)start;
+ (NSDateFormatter *) dateFormatterDateForNewsOnlyVietnam;
+ (NSDateFormatter *) dateFormatterDateForBirthDayServer;
+ (NSDictionary *)getComponentFromDate:(NSDate *)date;
+ (NSDateFormatter *) dateFormatterDateForNewsOnlyVietnamSameYear;
@end
