//
//  ViewController.m
//  timelineWithScrollview
//
//  Created by hennychen on 3/17/17.
//  Copyright © 2017 hennychen. All rights reserved.
//

#import "ViewController.h"
#import "MacroDefinition.h"
// 颜色

#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HMColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]



// 随机色

#define HMRandomColor HMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*2);
    
    for (int i = 0; i< 100; i++) {
        UILabel * lbltxt = [[UILabel alloc] initWithFrame:CGRectMake(10.0, i*SCREEN_HEIGHT*0.02, SCREEN_WIDTH - 20, 20)];
        lbltxt.text = [NSString stringWithFormat:@"---%d",i];
        lbltxt.backgroundColor = HMRandomColor;
        [_scrollview addSubview:lbltxt];
        
    }
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI_2);
    _slider.transform = trans;
}
- (IBAction)changeSliderValue:(id)sender {
    UISlider * slider = (UISlider *)sender;
    [_scrollview setContentOffset:CGPointMake(0.0, slider.value*SCREEN_HEIGHT*0.02) animated:YES];
    NSLog(@"---%f",slider.value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
