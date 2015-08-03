// 31 july 2015
#import "osxaltest.h"

@implementation tButton {
	NSButton *b;
	id<tControl> parent;
}

- (id)tInitWithText:(NSString *)text
{
	self = [super init];
	if (self) {
		self->b = [[NSButton alloc] initWithFrame:NSZeroRect];
		[self->b setTitle:text];
		[self->b setButtonType:NSMomentaryPushInButton];
		[self->b setBordered:YES];
		[self->b setBezelStyle:NSRoundedBezelStyle];
		[self->b setFont:[NSFont systemFontOfSize:[NSFont systemFontSizeForControlSize:NSRegularControlSize]]];
		[self->b setTranslatesAutoresizingMaskIntoConstraints:NO];

		self->parent = nil;
	}
	return self;
}

- (void)tSetParent:(id<tControl>)p addToView:(NSView *)v relayout:(BOOL)relayout
{
	self->parent = p;
	[v addSubview:self->b];
	if (relayout)
		[self tRelayout];
}

- (void)tFillAutoLayout:(tAutoLayoutParams *)p
{
	p->view = self->b;
	p->attachLeft = YES;
	p->attachTop = YES;
	p->attachRight = YES;
	p->attachBottom = YES;
}

- (void)tRelayout
{
	if (self->parent != nil)
		[self->parent tRelayout];
}

@end
