//
//  ViewController.m
//  Teset天气预报
//
//  Created by Ji Lucky on 13-1-31.
//  Copyright (c) 2013年 Ji Lucky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize weathImage = _weathImage;
@synthesize weathText = _weathText;
- (void)viewDidLoad
{
    [super viewDidLoad];
    _weathImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.weathImage];
    
    _weathText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 96)];
    _weathText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.weathText];
    
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadWeather];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWeather
{
    NSURL *URL =[NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101281101.html"];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc]
                                     initWithContentsOfURL:URL
                                     encoding:NSUTF8StringEncoding
                                     error:&error];
    NSString *strTempL;
    NSString *strTempH;
    NSString *strWeather;
    NSString *strTime;
    NSString *strCity;
    NSString *fileName=@"晴.png";
    if(stringFromFileAtURL !=nil)
    {
//        NSLog(stringFromFileAtURL);
        NSArray *strarray = [stringFromFileAtURL componentsSeparatedByString:@"\""];
        
        for(int i=0;i<strarray.count;i++)
        {
//            NSLog([strarray objectAtIndex:i]);
            NSString *str = [strarray objectAtIndex:i];
            if(YES == [str isEqualToString:@"temp1"])//最高温度
            {
                strTempH = [strarray objectAtIndex:i+2];
            }
            else if(YES == [str isEqualToString:@"temp2"])//最低温度
            {
                strTempL = [strarray objectAtIndex:i+2];
            }
            else if(YES == [str isEqualToString:@"weather"])//天氣
            {
                strWeather = [strarray objectAtIndex:i+2];
            }
            else if (YES == [str isEqualToString:@"ptime"])
            {
                strTime = [strarray objectAtIndex:i+2];
            }
            else if (YES == [str isEqualToString:@"city"])
            {
                strCity = [strarray objectAtIndex:i+2];
            }
            
        }
        
        
        NSString *sweather = [[NSString alloc]initWithFormat:@"%@天氣:%@,溫度:%@~%@,天氣獲取時間:%@",strCity,strWeather,strTempL,strTempH,strTime];
        
        
        if(NSNotFound != [strWeather rangeOfString:@"晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@",@"晴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"多雲"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"多雲.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"阴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"阴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"小雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雷"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雷雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雾"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雾.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"中雪"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"中雨"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"小雪"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"小雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"小雨"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雨加雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雨夹雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"陣雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雷陣雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雷陣雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雨轉晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雨轉晴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"阴轉晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"阴轉晴.png"];
        }
        
        if(sweather !=nil)
            self.weathText.text = sweather;
    }
//    NSLog(fileName);
    self.weathImage.image = [UIImage imageNamed:fileName];
    [fileName release];
}

- (void)dealloc {
    [_weathImage release];
    [_weathText release];
    [super dealloc];
}
@end
