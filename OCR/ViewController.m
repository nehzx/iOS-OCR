//
//  ViewController.m
//  OCR
//
//  Created by 徐振 on 2017/11/20.
//  Copyright © 2017年 xuzhen. All rights reserved.
//
#import <TesseractOCR/TesseractOCR.h>
#import "ViewController.h"

@interface ViewController ()<G8TesseractDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng+chi_sim"];
    
    operation.tesseract.image = [[UIImage imageNamed:@"123.jpg"] g8_blackAndWhite];
    
    operation.tesseract.delegate = self;
    
    operation.recognitionCompleteBlock = ^(G8Tesseract *recognizedTesseract) {
        
        NSLog(@"%@", [recognizedTesseract recognizedText]);
    };
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
    
}
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %zd", tesseract.progress);
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
