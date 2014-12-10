#import <Foundation/Foundation.h>

@interface ObjCUsers : NSObject
@property (nonatomic, readonly) NSInteger count;

- (instancetype)init:(NSString*)string;

@end
