#import "ObjCUsers.h"

@interface ObjCUser : NSObject 
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *handle;
@end

@implementation ObjCUser
@end


@interface ObjCUsers ()
@property (nonatomic, strong) NSMutableArray* users;
@end

@implementation ObjCUsers 

- (instancetype)init:(NSString*)string {
    self = [super init];
    if (self) {
        self.users = [NSMutableArray new];
        
        NSData* raw_data = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSError *e = nil;
        NSArray* raw_array = [NSJSONSerialization JSONObjectWithData:raw_data options:0 error:&e];
        if (raw_array) {
            for(NSDictionary *item in raw_array) {
                ObjCUser* user = [ObjCUser new];
                user.name = item[@"name"];
                user.handle = item[@"handle"];
                [self.users addObject:user];
            }
        }
    }
    return self;
}

- (NSInteger)count {
    return (NSInteger)[self.users count];
}

@end
