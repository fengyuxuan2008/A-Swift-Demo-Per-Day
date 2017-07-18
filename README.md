# A-Swift-Demo-Per-Day
每天做一个关于swift的小练习
---

#### The First Day

第一天也是第一次正式开始用swift写代码，使用的感觉就是很不顺手，很多OC熟悉的方法及书写习惯在swift上统统都改变了，不过慢慢适应一下还是蛮好的，由于学习了python，现在对swift的相关理解更上一层楼。

此项目运用了UICollectionView的相关方法做了一个简易的图片浏览器。项目整体设计采用MVC设计模式，清晰明了。

自定义的UICollectionViewCell的布局使用了第三方的SnapKit，使用方法简单，与AutoLayout的原理异曲同工，后续可能专门针对其进行练习。

![the first demo](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/theFirstPic.png)

The End

#### The Second Day
今天做的这个播放本地视频的项目，主要使用了自定义UITableViewCell,其中cell的布局依旧完全交给SnapKit去处理，播放视频利用的是原生的AVKit与AVFoundation。

tip: 控制器跳转的两个方法push与present的差别：

	 self.navigationController?.pushViewController(viewController: UIViewController, animated: Bool)	
	 
	 self.present(UIViewController, animated: Bool) {}
	 
present方法可以进行后续跳转过去之后的操作，自带block块。

![the first demo](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/2nd.png)


The End

### 项目中使用的第三方框架
- [SnapKit]()

### 关于练习案例来源
- [30DaysofSwift](https://github.com/allenwong/30DaysofSwift)
