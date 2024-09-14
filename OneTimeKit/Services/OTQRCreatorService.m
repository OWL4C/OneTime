#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface OTQRCreatorService : NSObject

+ (UIImage *)generateQRCodeFromString:(NSString *)string;

@end
 
@implementation OTQRCreatorService

+ (CIImage *)generateQRCodeImageFromString:(NSString *)string {
    // Create a CIFilter object for generating QR codes.
    CIFilter *qrCodeFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // Set the input data for the QR code filter from input string, converted to UTF-8
    [qrCodeFilter setValue:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
    
    // Get the output image from the QR code filter.
    CIImage *outputImage = qrCodeFilter.outputImage;

    return outputImage;
}

+ (UIImage *)generateQRCodeFromString:(NSString *)string {
    /*CIImage *outputImage = [self generateQRCodeImageFromString:string];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // Create a CGImageRef from the CIImage using the CIContext.
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
    
    // Create a UIImage from the CGImageRef.
    UIImage *qrCodeImage = [UIImage imageWithCGImage:cgImage];
    
    // Release the CGImageRef.
    CGImageRelease(cgImage);*/
    
    return [[UIImage alloc] initWithCIImage:[self generateQRCodeImageFromString:string]];;
}

+ (NSURL *)generateQRCodeFileFromString: (NSString *)string {
    
    UIImage *uiImage = [[UIImage alloc] initWithCIImage:[self generateQRCodeImageFromString:string]];
    
    NSData *NSuiImage = UIImagePNGRepresentation(uiImage);
    //NSData *imageData = UIImagePNGRepresentation(uiImage);
    
    // Create a temporary file path
    NSString *tempDir = NSTemporaryDirectory();
    NSString *tempFile = [tempDir stringByAppendingPathComponent:@"OTP.png"];
    
    // Write the PNG data to the temporary file
    [NSuiImage writeToFile:tempFile atomically:YES];
    
    // Create a file URL for the temporary file
    NSURL *fileURL = [NSURL fileURLWithPath:tempFile];
    
    return fileURL;
}
 
@end
