SpringboardCollectionViewLayout
===============================

* A subclass of UICollectionViewLayout that mimics the Springboard four-column layout
* This layout is intended for UICollectionViews with horizontal paging enabled
* Each section of the UICollectionView begins on a new page

<p align="center">
	<img src="https://dl.dropboxusercontent.com/u/59137317/github/springboard.png" alt="SpringboardCollectionViewLayout" />
</p>

```objective-c
#import "SpringboardCollectionViewLayout.h"

SpringboardCollectionViewLayout *layout = [[SpringboardCollectionViewLayout alloc] init];
UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:someFrame
	collectionViewLayout:layout];
```

<br>

<div>
    <i>
        Questions or feedback? Find me on Twitter <a href="https://twitter.com/luciensn">@luciensn</a><br>
        Environment screenshots from <a href="http://placeit.breezi.com">placeit.breezi.com</a>
    </i>
</div>