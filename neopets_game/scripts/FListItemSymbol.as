function FListItemClass()
{
   this.init();
}
FListItemClass.prototype = new FSelectableItemClass();
Object.registerClass("FListItemSymbol",FListItemClass);
