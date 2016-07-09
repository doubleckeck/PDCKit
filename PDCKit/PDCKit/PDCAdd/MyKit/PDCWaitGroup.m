
#import "PDCWaitGroup.h"

@interface PDCWaitGroup()
@property (nonatomic, copy) void (^finish)();
@property (nonatomic, copy) void(^waitting)(NSInteger waitCount);
@end

@implementation PDCWaitGroup
{
    dispatch_semaphore_t _semap;
}
#pragma mark - block
+(instancetype )waitGroupWithWait:(NSInteger )waitCount queue:(dispatch_queue_t )queue
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount queue:queue];
}

-(instancetype )initWithWait:(NSInteger)waitCount queue:(dispatch_queue_t )queue
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount delegate:nil queue:queue];
}

+(instancetype )waitGroupWithWait:(NSInteger )waitCount
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount];
}

-(instancetype )initWithWait:(NSInteger )waitCount
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
}

-(void )waitting:(void(^)(NSInteger waitCount)) waitting
{
    self.waitting = waitting;
}

-(void )reduceCount
{
    if (_semap)
    {
        dispatch_semaphore_signal(_semap);
    }
}

-(void )finish:(void (^)())finish
{
    self.finish = finish;
}

#pragma mark - delegate
+(instancetype )waitGroupWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount delegate:delegate];
}

-(instancetype )initWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount delegate:delegate queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
}

+(instancetype )waitGroupWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate queue:(dispatch_queue_t )queue
{
    return [[PDCWaitGroup alloc] initWithWait:waitCount delegate:delegate queue:queue];
}

-(instancetype )initWithWait:(NSInteger)waitCount delegate:(id<PDCWaitGroup> )delegate queue:(dispatch_queue_t )queue
{
    if (self = [super init])
    {
        _delegate = delegate;
        _waitCount = waitCount;
        _semap = dispatch_semaphore_create(1);
        dispatch_async(queue, ^{
            do {
                dispatch_semaphore_wait(_semap, DISPATCH_TIME_FOREVER);
                _waitCount--;
                if (_delegate)
                {
                    if ([_delegate respondsToSelector:@selector(waitting:)]&&_waitCount)
                    {
                        [_delegate waitting:_waitCount];
                    }
                }
                else
                {
                    if (self.waitting&&_waitCount)
                    {
                        self.waitting(_waitCount);
                    }
                }
            } while (_waitCount != 0);
            if (_delegate)
            {
                if ([_delegate respondsToSelector:@selector(finish)])
                {
                    [_delegate finish];
                }
            }
            else
            {
                if (self.finish)
                {
                    self.finish();
                }
            }
        });
    }
    return self;
}
@end
