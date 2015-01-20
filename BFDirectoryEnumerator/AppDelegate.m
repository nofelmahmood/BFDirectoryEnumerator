//
//  AppDelegate.m
//  BFDirectoryEnumerator
//
//  Created by Nofel Mahmood on 16/01/2015.
//  Copyright (c) 2015 Nofel Mahmood. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self setBFDirectoryEnumerator:[BFDirectoryEnumerator enumeratorWithDirectoryURL:[NSURL URLWithString:NSHomeDirectory()] withOptions:NSDirectoryEnumerationSkipsHiddenFiles]];
    [[self bFDirectoryEnumerator]setDelegate:self];
    [[self bFDirectoryEnumerator]start];
     
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
#pragma mark BFDirectoryEnumerator Delegate Methods
-(void)bFDirectoryEnumerator:(BFDirectoryEnumerator *)enumerator didScanFileWithURL:(NSURL *)url
{
    NSLog(@"%@",url);
}
-(void)bfDirectoryEnumerator:(BFDirectoryEnumerator *)enumerator didFailWithError:(NSError *)error
{
    
}
@end
