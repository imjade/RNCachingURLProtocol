//
//  PywWebCacheManager.m
//  CachedWebView
//
//  Created by Jade on 17/2/14.
//
//

#import "PywWebCacheManager.h"
#import "NSString+Sha1.h"

@implementation PywWebCacheManager

/**
 *  缓存路径
 */

+ (NSString *)webCachePath
{
    NSString *cachesPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"WebCache"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建目录
    if (![fileManager fileExistsAtPath:cachesPath]) {
        if (![fileManager createDirectoryAtPath:cachesPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            return nil;
        }
    }
    return cachesPath;
}

/**
 *  请求缓存
 */
- (NSString *)cachePathForRequest:(NSURLRequest *)aRequest
{
    NSString *fileName = [[[aRequest URL] absoluteString] sha1];
    
    return [[PywWebCacheManager webCachePath] stringByAppendingPathComponent:fileName];
}

/**
 *  清除缓存
 */
+ (void)clearAllWebCache
{
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:[PywWebCacheManager webCachePath]];
    for (NSString *fileName in enumerator) {
        [[NSFileManager defaultManager] removeItemAtPath:[[PywWebCacheManager webCachePath] stringByAppendingPathComponent:fileName] error:nil];
    }
}
@end
