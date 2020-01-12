class mx.containers.ScrollPane extends mx.core.ScrollView
{
   static var symbolName = "ScrollPane";
   static var symbolOwner = mx.containers.ScrollPane;
   var className = "ScrollPane";
   static var version = "2.0.0.377";
   var __hScrollPolicy = "auto";
   var __scrollDrag = false;
   var __vLineScrollSize = 5;
   var __hLineScrollSize = 5;
   var __vPageScrollSize = 20;
   var __hPageScrollSize = 20;
   var clipParameters = {contentPath:1,scrollDrag:1,hScrollPolicy:1,vScrollPolicy:1,vLineScrollSize:1,hLineScrollSize:1,vPageScrollSize:1,hPageScrollSize:1};
   static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.containers.ScrollPane.prototype.clipParameters,mx.core.ScrollView.prototype.clipParameters);
   var initializing = true;
   function ScrollPane()
   {
      super();
   }
   function getBytesTotal()
   {
      return this._total;
   }
   function getBytesLoaded()
   {
      return this._loaded;
   }
   function __set__contentPath(scrollableContent)
   {
      if(!this.initializing)
      {
         if(scrollableContent == undefined)
         {
            this.destroyChildAt(0);
         }
         else
         {
            if(this[mx.core.View.childNameBase + 0] != undefined)
            {
               this.destroyChildAt(0);
            }
            this.createChild(scrollableContent,"spContentHolder");
         }
      }
      this.__scrollContent = scrollableContent;
      return this.__get__contentPath();
   }
   function __get__contentPath()
   {
      return this.__scrollContent;
   }
   function __get__content()
   {
      return this.spContentHolder;
   }
   function setHPosition(position)
   {
      if(position <= this.hScroller.maxPos && position >= this.hScroller.minPos)
      {
         super.setHPosition(position);
         this.spContentHolder._x = - position;
      }
   }
   function setVPosition(position)
   {
      if(position <= this.vScroller.maxPos && position >= this.vScroller.minPos)
      {
         super.setVPosition(position);
         this.spContentHolder._y = - position;
      }
   }
   function __get__vLineScrollSize()
   {
      return this.__vLineScrollSize;
   }
   function __set__vLineScrollSize(vLineSize)
   {
      this.__vLineScrollSize = vLineSize;
      this.vScroller.__set__lineScrollSize(vLineSize);
      return this.__get__vLineScrollSize();
   }
   function __get__hLineScrollSize()
   {
      return this.__hLineScrollSize;
   }
   function __set__hLineScrollSize(hLineSize)
   {
      this.__hLineScrollSize = hLineSize;
      this.hScroller.__set__lineScrollSize(hLineSize);
      return this.__get__hLineScrollSize();
   }
   function __get__vPageScrollSize()
   {
      return this.__vPageScrollSize;
   }
   function __set__vPageScrollSize(vPageSize)
   {
      this.__vPageScrollSize = vPageSize;
      this.vScroller.__set__pageScrollSize(vPageSize);
      return this.__get__vPageScrollSize();
   }
   function __get__hPageScrollSize()
   {
      return this.__hPageScrollSize;
   }
   function __set__hPageScrollSize(hPageSize)
   {
      this.__hPageScrollSize = hPageSize;
      this.hScroller.__set__pageScrollSize(hPageSize);
      return this.__get__hPageScrollSize();
   }
   function __set__hScrollPolicy(policy)
   {
      this.__hScrollPolicy = policy.toLowerCase();
      this.setScrollProperties(this.spContentHolder._width,1,this.spContentHolder._height,1);
      return this.__get__hScrollPolicy();
   }
   function __set__vScrollPolicy(policy)
   {
      this.__vScrollPolicy = policy.toLowerCase();
      this.setScrollProperties(this.spContentHolder._width,1,this.spContentHolder._height,1);
      return this.__get__vScrollPolicy();
   }
   function __get__scrollDrag()
   {
      return this.__scrollDrag;
   }
   function __set__scrollDrag(s)
   {
      this.__scrollDrag = s;
      if(this.__scrollDrag)
      {
         this.spContentHolder.useHandCursor = true;
         this.spContentHolder.onPress = function()
         {
            this._parent.startDragLoop();
         };
         this.spContentHolder.tabEnabled = false;
         this.spContentHolder.onRelease = this.spContentHolder.onReleaseOutside = function()
         {
            delete this.onMouseMove;
         };
         this.__scrollDrag = true;
      }
      else
      {
         delete this.spContentHolder.onPress;
         this.spContentHolder.tabEnabled = false;
         this.spContentHolder.tabChildren = true;
         this.spContentHolder.useHandCursor = false;
         this.__scrollDrag = false;
      }
      return this.__get__scrollDrag();
   }
   function init(Void)
   {
      super.init();
      this.tabEnabled = true;
      this.keyDown = this._onKeyDown;
   }
   function createChildren(Void)
   {
      super.createChildren();
      this.mask_mc._visible = false;
      this.initializing = false;
      if(this.__scrollContent != undefined && this.__scrollContent != "")
      {
         this.__set__contentPath(this.__scrollContent);
      }
   }
   function size(Void)
   {
      super.size();
      this.setScrollProperties(this.spContentHolder._width,1,this.spContentHolder._height,1);
      this.hPosition = Math.min(this.hPosition,this.__get__maxHPosition());
      this.vPosition = Math.min(this.vPosition,this.__get__maxVPosition());
   }
   function setScrollProperties(columnCount, columnWidth, rowCount, rowHeight)
   {
      super.setScrollProperties(columnCount,columnWidth,rowCount,rowHeight);
      this.hScroller.__set__lineScrollSize(this.__hLineScrollSize);
      this.hScroller.__set__pageScrollSize(this.__hPageScrollSize);
      this.vScroller.__set__lineScrollSize(this.__vLineScrollSize);
      this.vScroller.__set__pageScrollSize(this.__vPageScrollSize);
   }
   function onScroll(scrollEvent)
   {
      super.onScroll(scrollEvent);
      this.spContentHolder._x = - this.__hPosition;
      this.spContentHolder._y = - this.__vPosition;
   }
   function childLoaded(obj)
   {
      super.childLoaded(obj);
      this.onComplete();
   }
   function onComplete(Void)
   {
      this.setScrollProperties(this.spContentHolder._width,1,this.spContentHolder._height,1);
      this.hPosition = 0;
      this.vPosition = 0;
      this.__set__scrollDrag(this.__scrollDrag);
      this.invalidate();
   }
   function startDragLoop(Void)
   {
      this.spContentHolder.lastX = this.spContentHolder._xmouse;
      this.spContentHolder.lastY = this.spContentHolder._ymouse;
      this.spContentHolder.onMouseMove = function()
      {
         var _loc4_ = this.lastX - this._xmouse;
         var _loc3_ = this.lastY - this._ymouse;
         _loc4_ = _loc4_ + this._parent.hPosition;
         _loc3_ = _loc3_ + this._parent.vPosition;
         this._parent.hPosition = _loc4_;
         this._parent.vPosition = _loc3_;
         if(this._parent.hPosition < this._parent.hScroller.maxPos && this._parent.hPosition > this._parent.hScroller.minPos)
         {
            this.lastX = this._xmouse;
         }
         else if(this._parent.hPosition > this._parent.hScroller.maxPos)
         {
            this._parent.hPosition = this._parent.hScroller.maxPos;
         }
         else if(this._parent.hPosition < this._parent.hScroller.minPos)
         {
            this._parent.hPosition = this._parent.hScroller.minPos;
         }
         if(this._parent.vPosition < this._parent.vScroller.maxPos && this._parent.vPosition > this._parent.vScroller.minPos)
         {
            this.lastY = this._ymouse;
         }
         else if(this._parent.vPosition > this._parent.vScroller.maxPos)
         {
            this._parent.vPosition = this._parent.vScroller.maxPos;
         }
         else if(this._parent.vPosition < this._parent.vScroller.minPos)
         {
            this._parent.vPosition = this._parent.vScroller.minPos;
         }
         super.dispatchEvent({type:"scroll"});
      };
   }
   function dispatchEvent(o)
   {
      o.target = this;
      this._total = o.total;
      this._loaded = o.current;
      super.dispatchEvent(o);
   }
   function refreshPane(Void)
   {
      this.__set__contentPath(this.__scrollContent);
   }
   function _onKeyDown(e)
   {
      if(e.code == 40)
      {
         this.vPosition = this.vPosition + this.vLineScrollSize;
      }
      else if(e.code == 38)
      {
         this.vPosition = this.vPosition - this.vLineScrollSize;
      }
      else if(e.code == 37)
      {
         this.hPosition = this.hPosition - this.hLineScrollSize;
      }
      else if(e.code == 39)
      {
         this.hPosition = this.hPosition + this.hLineScrollSize;
      }
      else if(e.code == 33)
      {
         this.vPosition = this.vPosition - this.vPageScrollSize;
      }
      else if(e.code == 34)
      {
         this.vPosition = this.vPosition + this.vPageScrollSize;
      }
      else if(e.code == 36)
      {
         this.vPosition = this.vScroller.minPos;
      }
      else if(e.code == 35)
      {
         this.vPosition = this.vScroller.maxPos;
      }
   }
}
