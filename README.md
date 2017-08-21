SpringboardCollectionViewLayout
===============================

* A subclass of UICollectionViewLayout that mimics the Springboard four-column layout
* This layout is intended for UICollectionViews with horizontal paging enabled
* Each section of the UICollectionView begins on a new page

### Example

```objective-c
#import "SpringboardCollectionViewLayout.h"

SpringboardCollectionViewLayout *layout = [[SpringboardCollectionViewLayout alloc] init];
UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:someFrame
	collectionViewLayout:layout];
```

<p>
	<img src="https://github.com/luciensn/SpringboardCollectionViewLayout/blob/master/springboard-layout.png" alt="SpringboardCollectionViewLayout" />
</p>