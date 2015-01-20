# BFDrectoryEnumerator
Enumerate directories in breadth first fashion. iOS and OSX.

Download and run the sample project to see the urls of your Home Directory printed in Breadth first manner in Xcode's log.

##Why ?
NSDirectoryEnumerator enumerates directories in depth first manner. In a recent project of an OSX App I wanted it to iterate in breadth first manner. So allow me to introduce

###BFDirectoryEnumerator 

Its a NSOperation Subclass. You can add it to a NSOperationQueue or just call start on an instance of its object.

####Add It
Add these two files in your project.
#####BFDirectoryEnumerator.h
#####BFDirectoryEnumerator.h

####Import It
```objective-c
#import "BFDirectoryEnumerator.h"
```

####Declare it

```objective-c
@property(strong,nonatomic)BFDirectoryEnumerator *bFDirectoryEnumerator;
```

####Set it

```objective-c
[self setBFDirectoryEnumerator:[BFDirectoryEnumerator enumeratorWithDirectoryURL:[NSURL URLWithString:NSHomeDirectory()] withOptions:NSDirectoryEnumerationSkipsHiddenFiles]];
[[self bFDirectoryEnumerator]setDelegate:self];
```

####Implement BFDirectoryEnumeratorDelegate Protocol and its these two required methods

```objective-c
-(void)bFDirectoryEnumerator:(BFDirectoryEnumerator *)enumerator didScanFileWithURL:(NSURL *)url
{
    NSLog(@"%@",url);
}
-(void)bfDirectoryEnumerator:(BFDirectoryEnumerator *)enumerator didFailWithError:(NSError *)error
{
    
}
```
####Go !

```objective-c
[[self bFDirectoryEnumerator]start];
```








