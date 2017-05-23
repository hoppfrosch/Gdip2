#SingleInstance Force

#Include %A_ScriptDir%\..\node_modules\ahk-unit\dist\ahk-unit.ahk
#Include %A_ScriptDir%\..\dist\Gdip2.ahk
#include %A_ScriptDir%\lib\JSON.ahk


new PointTest()
new SizeTest()
new RectTest()
return

#Include %A_ScriptDir%\Point-test.ahk
#Include %A_ScriptDir%\Size-test.ahk
#Include %A_ScriptDir%\Rect-test.ahk
