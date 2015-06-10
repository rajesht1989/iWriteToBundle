//
//  ViewController.m
//  WriteToBundle
//
//  Created by Rajesh on 03/12/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"InfoPlist" ofType:@"strings"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:strPath];
    NSLog(@"%@",dict);
    NSMutableDictionary *dictMutable = [NSMutableDictionary dictionary];
    [dictMutable setObject:@"1" forKey:@"abc"];
  
    [dictMutable writeToFile:strPath atomically:YES];
    dict = [NSDictionary dictionaryWithContentsOfFile:strPath];
    NSLog(@"%@",dict);
    
    NSLog(@"%@",[NSURL URLWithString:[strPath stringByReplacingOccurrencesOfString:@"/InfoPlist.strings" withString:@""]]);
    NSLog(@"%@",[NSURL URLWithString:@"/Users/administrator/Documents/Rajesh/WriteToBundle/WriteToBundle/en.lproj/InfoPlist.strings"]);
    [[NSFileManager defaultManager] replaceItemAtURL:[NSURL URLWithString:strPath] withItemAtURL:[NSURL URLWithString:@"/Users/administrator/Documents/Rajesh/WriteToBundle/WriteToBundle/en.lproj/InfoPlist.strings"] backupItemName:nil options:NSFileManagerItemReplacementWithoutDeletingBackupItem resultingItemURL:nil error:nil];
    dict = [NSDictionary dictionaryWithContentsOfFile:strPath];
    NSLog(@"%@",dict);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
