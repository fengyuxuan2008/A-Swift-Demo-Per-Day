# A-Swift-Demo-Per-Day
每天做一个关于swift的小练习
---

#### The First Day

第一天也是第一次正式开始用swift写代码，使用的感觉就是很不顺手，很多OC熟悉的方法及书写习惯在swift上统统都改变了，不过慢慢适应一下还是蛮好的，由于学习了python，现在对swift的相关理解更上一层楼。

此项目运用了UICollectionView的相关方法做了一个简易的图片浏览器。项目整体设计采用MVC设计模式，清晰明了。

自定义的UICollectionViewCell的布局使用了第三方的SnapKit，使用方法简单，与AutoLayout的原理异曲同工，后续可能专门针对其进行练习。

![the first demo](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/theFirstPic.png)

#### The End
---
#### The Second Day
今天做的这个播放本地视频的项目，主要使用了自定义UITableViewCell,其中cell的布局依旧完全交给SnapKit去处理，播放视频利用的是原生的AVKit与AVFoundation。

tip: 控制器跳转的两个方法push与present的差别：

	 self.navigationController?.pushViewController(viewController: UIViewController, animated: Bool)	
	 
	 self.present(UIViewController, animated: Bool) {}
	 
present方法可以进行后续跳转过去之后的操作，自带block块。

![the first demo](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/2nd.png)


#### The End
---
#### The Third Day
昨天生病了，下班回去早早就休息了，今天继续开始做个小项目。

之前都是用snapkit进行纯代码布局，今天开始尝试使用storyBoard进行界面布局，使用 @IBDesignable 自定义 UIButton 与 UIView 在storyBoard中的可视化属性，可以通过右侧工具栏直接修改期望得到的圆角等属性，十分便利。

	import UIKit
	@IBDesignable class DesignableView: UIView {
   	  @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
       		 }
   		 }
	}
	
	import UIKit

	@IBDesignable class DesignableButton: UIButton {
      @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
      @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
      @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        	}
    	}
	}

![designable-view](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/designable-view.png)

![designable-button](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/designable-button.png)

另外还有一点是关于怎么通过故事板直接实现毛玻璃效果的，其实直接将Visual Effect View 与View按照如下层级安放，然后将View的背景色设置为clearColor即可实现毛玻璃的效果：

![view](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/view.png)

![毛玻璃效果](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/毛玻璃效果.png)

#### The End
---
#### The Forth Day
今天做了一个menu button,用到了UIView的动画效果。

顺便修复使用SourceTree提交commit，在github不显示的问题。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/button_menu.gif)

#### The End
---

#### The Fifth Day
使用UIView的弹性动画效果对UITableViewCell、UIButton做了些动效处理。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/The-fifth-Day_View-Animations/the-fifth-day.gif)

#### The End
---
#### The Sixth Day
今天周末，看了一下iOS11的新特性，熟悉了一下Drag 和 Drop的相关api，并做了一个使用案例，将textView中的选中文本长按并拖拽到tableView中显示出来。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/The-Sixth-Day_DragAndDrop/drag-drop.gif)

#### The End
---
#### The Seventh Day
在swift项目中引用OC的第三方库，方案如下， 下载第三方库然后拖入到项目中，之后创建header文件，创建时需要特别注意如下选项：

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/group.png)

之后在build setting中进行如下设置：

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/images/setting.png)

然后将三方库的头文件在header文件中引用即可成功使用OC的第三方库了。

####The End
---

#### The Eighth Day
使用coreData对数据进行存储并读取。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/TheEighthDay_CoreData/coreData.gif)

#### The End
---
#### The Ninth Day
Using JSON Data from the Web
#### The End
---
#### The Tenth Day
circleTransition，此项目是自定义present的modal属性来实现转场动画。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/TenthDay_circleTransition/circleTransition.gif)
 
#### The End
---
#### The Eleventh Day
circleTransition2,此项目是存在导航的情况下实现的转场动画，用到了动画所需的各种协议与方法，并在最后深入同用户的交互，加入pan手势。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/EleventhDay_CircleTransition(2)/circleTransition2.gif)

#### The End
---
#### The Twelfth Day
到周六了，跟着教学案例做了一个关于SoundMemory的小游戏放松一下。

![](https://github.com/fengyuxuan2008/A-Swift-Demo-Per-Day/raw/master/TwelfthDay_SoundMemory/soundMemory.gif)

#### The End
---
### 项目中使用的第三方框架
- [SnapKit](https://github.com/SnapKit/SnapKit)

### 关于练习案例来源
- [Stanford - Developing iOS 10 Apps with Swift(链接打不开的话需要自备梯子)](https://www.youtube.com/watch?v=4iNHsR6ePYw&index=2&list=PL3d_SFOiG7_-AhUEwk_TJ_GEjO67GMBHR)
- [Make Your Apps Look Awesome](https://www.youtube.com/channel/UChH6WbyYeX0INJjrK2-6WSg)
- [Brian Advent](https://www.youtube.com/channel/UCysEngjfeIYapEER9K8aikw)
- [raywenderlich](https://www.raywenderlich.com/)
- [30DaysofSwift](https://github.com/allenwong/30DaysofSwift)
