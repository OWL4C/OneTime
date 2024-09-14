//
//  OTQRCreatorService.h
//  onetime
//
//  Created by owl on 14.09.24.
//  Copyright © 2024 Leptos. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>

@interface OTQRCreatorService : NSObject


+ (instancetype)shared;
// Declaration of a class method `generateQRCodeFromString:` which generates a QR code from a given string.
// Parameters:
//   - string: The string to be encoded into a QR code.
// Returns: An UIImage object representing the generated QR code.
+ (UIImage *)generateQRCodeFromString:(NSString *)string;
+ (NSURL *)generateQRCodeFileFromString:(NSString *)string;


@end
