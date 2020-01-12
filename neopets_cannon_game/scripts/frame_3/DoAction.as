_root.buttonSound = new Sound(_root);
_root.buttonSound.attachSound("buttonSound");
_root.startGameCode = function()
{
   _global.gMyNeoStatus.sendTag("Game Started");
   var _loc1_ = new LoadVars();
   _loc1_.load("http://view.atdmt.com/TGM/view/nptsxttn0040000013tgm/direct/01/",_loc1_);
   _root.gotoAndPlay("choosecharframe");
};
_root.webCode = function()
{
   getUrl("http://www.neopets.com/process_click.phtml?item_id=5168&type_id=12", "_blank");
};
