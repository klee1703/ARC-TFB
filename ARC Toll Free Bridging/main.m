//
//  main.m
//  ARC Toll Free Bridging
//
//  Created by Keith Lee on 11/25/12.
//  Copyright (c) 2012 Keith Lee. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//   1. Redistributions of source code must retain the above copyright notice, this list of
//      conditions and the following disclaimer.
//
//   2. Redistributions in binary form must reproduce the above copyright notice, this list
//      of conditions and the following disclaimer in the documentation and/or other materials
//      provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY Keith Lee ''AS IS'' AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Keith Lee OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of Keith Lee.

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    // Cast a Core Foundation data type to a Foundation framework object
    //  - uses ARC bridged cast!!
    CFStringRef cstr = CFStringCreateWithCString(NULL, "Hello, World!",
                                                 kCFStringEncodingASCII);
    NSArray *data = [NSArray arrayWithObject:(__bridge_transfer NSString *)cstr];
    NSLog(@"Array size = %ld", [data count]);
    
    // Now cast a Foundation framework object to a Core Foundation type
    NSString *greeting = [[NSString alloc] initWithFormat:@"%@",
                          @"Hello, World!"];
    CFStringRef cstr1 = (__bridge_retained CFStringRef)(greeting);
    printf("String length = %ld", CFStringGetLength(cstr1));
    CFRelease(cstr1);
  }
  return 0;
}

