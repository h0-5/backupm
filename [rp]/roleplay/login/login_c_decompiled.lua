-- Decompiled by Owl Decompiler
-- Version App : 1.0
-- discord.gg/owwl

sx, sy = guiGetScreenSize()
msx, msy = sx / 1920, sy / 1080
music = false
function stopLoginMusic()
  if isElement(music) then
    if isTimer(fadeout_sound_timer) then
      killTimer(fadeout_sound_timer)
    end
    fadeout_sound_timer = setTimer(function()
      setSoundVolume(music, getSoundVolume(music) - 0.1)
      if getSoundVolume(music) - 0.1 <= 0 and isElement(music) then
        destroyElement(music)
      end
    end, 500, 10)
  end
end
function startLoginMusic()
  if not isElement(music) and exports.settings:getSetting("Login:music") then
    music = playSound(":assets/sounds/Music.mp3", true)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  if not xmlLoadFile("rememberlogin.xml") then
    xmlNodeSetValue(xmlCreateChild(xmlCreateFile("rememberlogin.xml", "login"), "username"), "")
    xmlNodeSetValue(xmlCreateChild(xmlCreateFile("rememberlogin.xml", "login"), "password"), "")
  end
  xmlSaveFile((xmlCreateFile("rememberlogin.xml", "login")))
  xmlUnloadFile((xmlCreateFile("rememberlogin.xml", "login")))
  triggerEvent("showLoginScreen", localPlayer)
  saved_serial = getSavedSerial()
end)
addEvent("showLoginScreen", true)
addEventHandler("showLoginScreen", root, function()
  if getElementData(localPlayer, "character:id") then
    return
  end
  startLoginMusic()
  triggerEvent("character:hideSelection", localPlayer)
  setElementInterior(localPlayer, 0)
  setCameraMatrix(unpack(var0[math.random(1, #var0)]))
  fadeCamera(true)
  showChat(false)
  addEventHandler("onClientRender", root, drawBackground)
  setTime(0, 0)
  showLoading(true)
  setTimer(function(arg0, arg1, arg2, arg3, arg4, arg5)
    setElementInterior(localPlayer, 0)
    showLoading(false)
    if getElementData(resourceRoot, "Mode") == "open" then
      setModeScreenVisible(false)
      setLoginPanelVisible(true)
    else
      setModeScreenVisible(true)
    end
    showCursor(true)
    setCameraMatrix(arg0, arg1, arg2, arg3, arg4, arg5)
  end, 2000, 1, unpack(var0[math.random(1, #var0)]))
end)
addEventHandler("onClientElementDataChange", resourceRoot, function(arg0)
  if arg0 == "Mode" and getElementData(resourceRoot, "Mode") == "open" and var0:uiGetVisible(var1.label.ModeScreen) then
    setModeScreenVisible(false)
    setLoginPanelVisible(true)
  end
end)
addEvent("openLoginScreen", true)
addEventHandler("openLoginScreen", root, function()
  if var0:uiGetVisible(var1.label.ModeScreen) then
    setModeScreenVisible(false)
    setLoginPanelVisible(true)
  end
end)
addEventHandler("onClientResourceStop", resourceRoot, function()
  showChat(true)
end)
function drawLoading()
  var0 = math.floor((var0 + 30) % 360)
  dxDrawImage(sx - 80, sy - 80, 50, 50, "images/Loading.png", var0, 0, 0, tocolor(255, 255, 255, 255), true)
end
function showLoading(arg0)
  exports.public:loading("login", arg0)
end
if ({
  visible = false,
  wallpaper = {
    x = 0,
    y = (sy - sx * 0.5625) / 2,
    w = sx,
    h = sx * 0.5625
  }
}).wallpaper.h > sy then
  ({
    visible = false,
    wallpaper = {
      x = 0,
      y = (sy - sx * 0.5625) / 2,
      w = sx,
      h = sx * 0.5625
    }
  }).wallpaper = {
    x = (sx - sy * 1.7777777777777777) / 2,
    y = 0,
    w = sy * 1.7777777777777777,
    h = sy
  }
end
function drawBackground()
  dxDrawRectangle(0, 0, sx, sy, tocolor(0, 3, 8, 180))
end
function UIKitReady_Login()
  var0 = exports.UIKit
  var1.image.Logo = var0:uiCreateImage((var0:uiGetReferenceScreenSize() - 148.66666666666666) / 2, (var0:uiGetReferenceScreenSize() - 150) / 2 - 148.66666666666666, 148.66666666666666, 148.66666666666666, ":assets/images/logo-circle.png")
  var0:uiSetVisible(var1.image.Logo, false)
  var1.label.ModeScreen = var0:uiCreateLabel(var0:uiGetReferenceScreenSize() * 0.6, 0, var0:uiGetReferenceScreenSize() * 0.4, var0:uiGetReferenceScreenSize())
  var0:uiSetVisible(var1.label.ModeScreen, false)
  var1.label.ModeMessage = var0:uiCreateLabel(0, 0, var0:uiGetReferenceScreenSize() * 0.4, var0:uiGetReferenceScreenSize())
  var0:uiSetFont(var1.label.ModeMessage, "default-large")
  var1.window.login = var0:uiCreateRectangle(false, false, 350, 500, tocolor(6, 9, 14, 250), true, true, true, true)
  var0:uiSetVisible(var1.window.login, false)
  var0:uiBringToFront(var1.window.login)
  var0:uiCreateRectangle((350 - 350 / 2) / 2, 0, 350 / 2, 5, "primary", false, false, false, false, var1.window.login)
  var0:uiCreateRectangle((350 - 350 / 2) / 2, 500 - 5, 350 / 2, 5, "primary", false, false, false, false, var1.window.login)
  var1.container.login = var0:uiCreateContainer((350 - 305) / 2, (500 - 410) / 2, 305, 410, var1.window.login)
  var0:uiSetVisible(var1.container.login, true)
  var1.image.usericon = var0:uiCreateImage((305 - 100) / 2, 0, 100, 100, ":assets/images/logo.png", var1.container.login)
  var0:uiSetColor(var1.image.usericon, 255, 255, 255, 180)
  var1.label.Title = var0:uiCreateLabel(0, 120, 305, 30, {
    en = "Login",
    ar = "\216\170\216\179\216\172\217\138\217\132 \216\175\216\174\217\136\217\132"
  }, tocolor(255, 255, 255, 255), "center", "center", var1.container.login)
  var0:uiSetFont(var1.label.Title, "default-large")
  var1.rect.Username = var0:uiCreateRectangle(10, 80 + 90, 285, 40, tocolor(19, 22, 27, 0), true, true, true, true, var1.container.login)
  var0:uiSetColor(var0:uiCreateImage(0, 17.5, 15, 15, "images/user_icon.png", var1.rect.Username), 255, 255, 255, 180)
  var1.edit.Username = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Username",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
  }, _, var1.rect.Username)
  var1.rect.Password = var0:uiCreateRectangle(10, 80 + 90 + 50, 285, 40, tocolor(19, 22, 27, 0), true, true, true, true, var1.container.login)
  var0:uiSetColor(var0:uiCreateImage(0, 17.5, 15, 15, "images/password_icon.png", var1.rect.Password), 255, 255, 255, 180)
  var1.edit.Password = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Password",
    ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  }, _, var1.rect.Password)
  var0:uiEditSetMasked(var1.edit.Password, true)
  var1.label.forgot_password = var0:uiCreateLabel(10, 80 + 90 + 50 + 45, 285, 20, {
    en = "Forgot password ?",
    ar = "\217\134\216\179\217\138\216\170 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\159"
  }, tocolor(255, 255, 255, 150), "center", "center", var1.container.login)
  var1.checkbox.Remember = var0:uiCreateSwitch(15, 80 + 90 + 60 + 70, 200, 20, {
    en = "Remember me.",
    ar = "\216\170\216\176\217\131\216\177\217\134\217\138."
  }, false, _, var1.container.login)
  var1.button.Login = var0:uiCreateButton(10, 80 + 100 + 60 + 90, 285, 40, {
    en = "Login",
    ar = "\216\170\216\179\216\172\217\138\217\132 \216\167\217\132\216\175\216\174\217\136\217\132"
  }, "primary", var1.container.login)
  var0:uiSetProperty(var1.button.Login, "HoverGlow", true)
  var1.label["3"] = var0:uiCreateLabel(10, 80 + 100 + 60 + 100 + 40, 285, 20, {
    en = "I do not have an account",
    ar = "\217\132\216\167 \216\163\217\133\217\132\217\131 \216\173\216\179\216\167\216\168"
  }, tocolor(255, 255, 255, 150), "center", "center", var1.container.login)
  var1.label["1"] = var0:uiCreateLabel((350 - 285) / 2, 500 + 20, 285, 20, {
    en = "Having trouble signing in? ${color.primary}click here",
    ar = "${color.primary}\216\167\216\182\216\186\216\183 \217\135\217\134\216\167  #ffffff\216\170\217\136\216\167\216\172\217\135 \217\133\216\180\216\167\217\131\217\132 \217\129\217\138 \216\167\217\132\216\170\216\179\216\172\217\138\217\132/\216\170\216\179\216\172\217\138\217\132 \216\167\217\132\216\175\216\174\217\136\217\132\216\159"
  }, tocolor(255, 255, 255, 255), "center", "center", var1.window.login)
  var1.container.register = var0:uiCreateContainer((350 - 305) / 2, (500 - 410) / 2, 305, 410, var1.window.login)
  var0:uiSetVisible(var1.container.register, false)
  var1.label.Title = var0:uiCreateLabel(0, 15, 305, 30, {
    en = "Create Account",
    ar = "\216\170\216\179\216\172\217\138\217\132 \216\173\216\179\216\167\216\168 \216\172\216\175\217\138\216\175"
  }, tocolor(255, 255, 255, 255), "center", "center", var1.container.register)
  var0:uiSetFont(var1.label.Title, "default-large")
  var1.label.returnToLogin = var0:uiCreateImage(15, 19, 24, 24, "images/left-arrow.png", var1.container.register)
  var0:uiSetProperty(var1.label.returnToLogin, "HoverOpacityEffect", true)
  var0:uiCreateLabel(0, 80, 305, 40, {
    en = [[
		* You are only allowed to have one account *
		Email is important to reset your password
		and to move the account to another device
	]],
    ar = "\t\t* \217\133\216\179\217\133\217\136\216\173 \217\132\217\131 \216\168\216\167\217\133\216\170\217\132\216\167\217\131 \216\173\216\179\216\167\216\168 \217\136\216\167\216\173\216\175 \217\129\217\130\216\183 *\n\t\t\216\167\217\132\216\168\216\177\217\138\216\175 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138 \217\133\217\135\217\133 \217\132\216\165\216\185\216\167\216\175\216\169 \216\170\216\185\217\138\217\138\217\134 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177\n\t\t\217\136\217\132\217\134\217\130\217\132 \216\167\217\132\216\173\216\179\216\167\216\168 \216\165\217\132\217\137 \216\172\217\135\216\167\216\178 \216\162\216\174\216\177\n\t"
  }, tocolor(255, 255, 255, 100), "center", "center", var1.container.register)
  var1.rect["RA:Username"] = var0:uiCreateRectangle(10, 50 + 90, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.register)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/user_icon.png", var1.rect["RA:Username"]), 255, 255, 255, 180)
  var1.edit["RA:Username"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Username",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
  }, _, var1.rect["RA:Username"])
  var1.rect["RA:Password"] = var0:uiCreateRectangle(10, 50 + 90 + 45, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.register)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/password_icon.png", var1.rect["RA:Password"]), 255, 255, 255, 180)
  var1.edit["RA:Password"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Password",
    ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  }, _, var1.rect["RA:Password"])
  var0:uiEditSetMasked(var1.edit["RA:Password"], true)
  var1.rect.RePassword = var0:uiCreateRectangle(10, 50 + 90 + 45 + 45, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.register)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/password_icon.png", var1.rect.RePassword), 255, 255, 255, 180)
  var1.edit.RePassword = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Confirm Password",
    ar = "\216\170\216\163\217\131\217\138\216\175 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  }, _, var1.rect.RePassword)
  var0:uiEditSetMasked(var1.edit.RePassword, true)
  var1.rect.Email = var0:uiCreateRectangle(10, 50 + 90 + 45 + 45 + 45, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.register)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/email_icon.png", var1.rect.Email), 255, 255, 255, 180)
  var1.edit.Email = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Email",
    ar = "\216\167\217\132\216\168\216\177\217\138\216\175 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138"
  }, _, var1.rect.Email)
  var1.button.Register = var0:uiCreateButton(10, 50 + 100 + 60 + 90 + 40, 285, 40, {en = "Register", ar = "\216\170\216\179\216\172\217\138\217\132"}, "primary", var1.container.register)
  var0:uiSetProperty(var1.button.Register, "HoverGlow", true)
  var1.container.reset_password = var0:uiCreateContainer((350 - 305) / 2, (500 - 410) / 2, 305, 410, var1.window.login)
  var0:uiSetVisible(var1.container.reset_password, false)
  var1.label.Title = var0:uiCreateLabel(0, 15, 305, 30, {
    en = "Reset Password",
    ar = "\216\165\216\185\216\167\216\175\216\169 \216\170\216\185\217\138\217\138\217\134 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  }, tocolor(255, 255, 255, 255), "center", "center", var1.container.reset_password)
  var0:uiSetFont(var1.label.Title, "default-large")
  var1.label.returnToLogin2 = var0:uiCreateImage(15, 19, 24, 24, "images/left-arrow.png", var1.container.reset_password)
  var0:uiSetProperty(var1.label.returnToLogin2, "HoverOpacityEffect", true)
  var1.rect["reset_password:Username"] = var0:uiCreateRectangle(10, 80, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.reset_password)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/user_icon.png", var1.rect["reset_password:Username"]), 255, 255, 255, 180)
  var1.edit["reset_password:Username"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Username",
    ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
  }, _, var1.rect["reset_password:Username"])
  var1.rect["reset_password:Email"] = var0:uiCreateRectangle(10, 125, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.reset_password)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/email_icon.png", var1.rect["reset_password:Email"]), 255, 255, 255, 180)
  var1.edit["reset_password:Email"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Email",
    ar = "\216\167\217\132\216\168\216\177\217\138\216\175 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138"
  }, _, var1.rect["reset_password:Email"])
  var1.rect["reset_password:Password"] = var0:uiCreateRectangle(10, 170, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.reset_password)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/password_icon.png", var1.rect["reset_password:Password"]), 255, 255, 255, 180)
  var1.edit["reset_password:Password"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "New Password",
    ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169"
  }, _, var1.rect["reset_password:Password"])
  var0:uiEditSetMasked(var1.edit["reset_password:Password"], true)
  var1.rect["reset_password:ConfirmPassword"] = var0:uiCreateRectangle(10, 215, 285, 40, tocolor(19, 22, 27, 255), true, true, true, true, var1.container.reset_password)
  var0:uiSetColor(var0:uiCreateImage(8, 12.5, 15, 15, ":roleplay/images/password_icon.png", var1.rect["reset_password:ConfirmPassword"]), 255, 255, 255, 180)
  var1.edit["reset_password:ConfirmPassword"] = var0:uiCreateEdit(25, 4, 285 - 10 - 20, 35, "", {
    en = "Confirm New Password",
    ar = "\216\170\216\163\217\131\217\138\216\175 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169"
  }, _, var1.rect["reset_password:ConfirmPassword"])
  var0:uiEditSetMasked(var1.edit["reset_password:ConfirmPassword"], true)
  var1.button.reset_password = var0:uiCreateButton(10, 280, 285, 40, {
    en = "Reset Password",
    ar = "\216\165\216\185\216\167\216\175\216\169 \216\170\216\185\217\138\217\138\217\134"
  }, tocolor(15, 15, 15, 240), var1.container.reset_password)
  var0:uiSetProperty(var1.button.reset_password, "HoverGlow", true)
  var1.label.ActivationArea = var0:uiCreateLabel((var0:uiGetReferenceScreenSize() - 400) / 2, (var0:uiGetReferenceScreenSize() - 150) / 2, 400, 200, "", tocolor(255, 255, 255, 255))
  var0:uiSetVisible(var1.label.ActivationArea, false)
  var1.rect.ActivationCode = var0:uiCreateRectangle(({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).x, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).y, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h, tocolor(20, 20, 20, 240), true, true, true, true, var1.label.ActivationArea)
  var1.edit.ActivationCode = var0:uiCreateEdit(5, 4, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w - 10, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h - 5, "", "Activation Code", tocolor(255, 55, 95, 255), var1.rect.ActivationCode)
  var0:uiSetProperty(var1.edit.ActivationCode, "UnderLineVisible", "False")
  var1.label.NewCode = var0:uiCreateLabel(({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).x + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w + 5, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).y, 50, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h, "resend", tocolor(255, 255, 255, 200), "left", "center", var1.label.ActivationArea)
  var1.label.ActiveNotes = var0:uiCreateLabel(0, ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).y + 15, 400, 30, [[
A message has been sent to your e-mail
containing the activation code.]], tocolor(255, 255, 255, 200), "center", "center", var1.label.ActivationArea)
  var1.button.SubmitActivation = var0:uiCreateButton(125, ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).h + 50, 150, 30, "Submit", tocolor(255, 55, 95, 240), var1.label.ActivationArea)
  var0:uiSetProperty(var1.button.SubmitActivation, "TextColor", tocolor(0, 0, 0))
  var1.label.gotoChangeEmail = var0:uiCreateLabel(0, ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).h + 50 + 30 + 10, 400, 20, "Change your email", tocolor(255, 255, 255, 200), "center", "center", var1.label.ActivationArea)
  var0:uiSetVisible(var1.label.gotoChangeEmail, false)
  var1.label.ChangeEmailArea = var0:uiCreateLabel((var0:uiGetReferenceScreenSize() - 400) / 2, (var0:uiGetReferenceScreenSize() - 150) / 2, 400, 200, "", tocolor(255, 255, 255, 255))
  var0:uiSetVisible(var1.label.ChangeEmailArea, false)
  var1.rect.NewEmail = var0:uiCreateRectangle(({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).x, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h + 5, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h, tocolor(20, 20, 20, 240), true, true, true, true, var1.label.ChangeEmailArea)
  var1.edit.NewEmail = var0:uiCreateEdit(5, 4, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w - 10, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h - 5, "", "New email", tocolor(255, 55, 95, 255), var1.rect.NewEmail)
  var0:uiSetProperty(var1.edit.NewEmail, "UnderLineVisible", "False")
  var1.rect.NewEmailConfirm = var0:uiCreateRectangle(({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).x, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h + 5 + ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h + 5, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h, tocolor(20, 20, 20, 240), true, true, true, true, var1.label.ChangeEmailArea)
  var1.edit.NewEmailConfirm = var0:uiCreateEdit(5, 4, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w - 10, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h - 5, "", "Confirm new email", tocolor(255, 55, 95, 255), var1.rect.NewEmailConfirm)
  var0:uiSetProperty(var1.edit.NewEmailConfirm, "UnderLineVisible", "False")
  var1.rect["CEA:Password"] = var0:uiCreateRectangle(({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).x, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).y, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h, tocolor(20, 20, 20, 240), true, true, true, true, var1.label.ChangeEmailArea)
  var1.edit["CEA:Password"] = var0:uiCreateEdit(5, 4, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).w - 10, ({
    x = 75,
    y = 20,
    w = 250,
    h = 30
  }).h - 5, "", "Your password", tocolor(255, 55, 95, 255), var1.rect["CEA:Password"])
  var0:uiSetProperty(var1.edit["CEA:Password"], "UnderLineVisible", "False")
  var0:uiEditSetMasked(var1.edit["CEA:Password"], true)
  var1.button.ChangeEmail = var0:uiCreateButton(125, ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).h + 100, 150, 30, "Change", tocolor(255, 55, 95, 240), var1.label.ChangeEmailArea)
  var0:uiSetProperty(var1.button.ChangeEmail, "TextColor", tocolor(0, 0, 0))
  var1.label.returnToActivation = var0:uiCreateLabel(0, ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).y + ({
    x = 75,
    y = 55,
    w = 250,
    h = 30
  }).h + 100 + 20 + 35, 400, 20, "Return back", tocolor(255, 255, 255, 200), "center", "center", var1.label.ChangeEmailArea)
  var1.window.ChangePassword = var0:uiCreateWindow(false, false, 470, 330, {
    en = "Change Your Password",
    ar = "\216\170\216\186\217\138\217\138\216\177 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  })
  var0:uiSetVisible(var1.window.ChangePassword, false)
  var0:uiCreateLabel(15, 50, 200, 20, {
    en = "Enter your email:",
    ar = "\216\163\216\175\216\174\217\132 \216\168\216\177\217\138\216\175\217\131 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138:"
  }, tocolor(255, 255, 255, 255), "left", "top", var1.window.ChangePassword)
  var1.edit["CP:Email"] = var0:uiCreateEdit(15, 75, 300, 30, "", {
    en = "your email",
    ar = "\216\168\216\177\217\138\216\175\217\131 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138"
  }, _, var1.window.ChangePassword)
  var0:uiCreateLabel(15, 125, 200, 15, {
    en = "New Password:",
    ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169:"
  }, tocolor(255, 255, 255, 255), "left", "top", var1.window.ChangePassword)
  var1.edit["CP:NewPassword"] = var0:uiCreateEdit(15, 150, 300, 30, "", "new password", _, var1.window.ChangePassword)
  var0:uiEditSetMasked(var1.edit["CP:NewPassword"], true)
  var0:uiCreateLabel(15, 200, 200, 15, {
    en = "Confirm New Password:",
    ar = "\216\170\216\163\217\131\217\138\216\175 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169:"
  }, tocolor(255, 255, 255, 255), "left", "top", var1.window.ChangePassword)
  var1.edit["CP:ConfirmNewPassword"] = var0:uiCreateEdit(15, 225, 300, 30, "", "confirm new password", _, var1.window.ChangePassword)
  var0:uiEditSetMasked(var1.edit["CP:ConfirmNewPassword"], true)
  var1.button.ChangePassword = var0:uiCreateButton(15, 290, 180, 30, {
    en = "Change Password",
    ar = "\216\170\216\186\217\138\217\138\216\177 \217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177"
  }, _, var1.window.ChangePassword)
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady_Login)
addEventHandler("onClientUIKitReady", root, UIKitReady_Login)
function setSecurityQuestions()
end
function changeAlpha()
  if source == var0.label["1"] or source == var0.label["3"] or source == var0.label.forgot_password or source == var0.label.returnToLogin or source == var0.label.returnToLogin2 or source == var0.label.returnToActivation or source == var0.label.gotoChangeEmail or source == var0.label.NewCode then
    var1:uiSetAlpha(source, eventName == "onClientUIMouseEnter" and 130 or 200)
  end
end
addEventHandler("onClientUIMouseEnter", root, changeAlpha)
addEventHandler("onClientUIMouseLeave", root, changeAlpha)
addEventHandler("onClientUIChanged", root, function()
  if (source == var0.edit.Username or source == var0.edit.Password or source == var0.edit["RA:Username"] or source == var0.edit["RA:Password"] or source == var0.edit.RePassword or source == var0.edit.Email or source == var0.edit["reset_password:Username"] or source == var0.edit["reset_password:Password"] or source == var0.edit["reset_password:ConfirmPassword"] or source == var0.edit["reset_password:Email"]) and var1:uiGetText(source) ~= "" then
    var1:uiSetText(source, (var1:uiGetText(source):gsub("%s+", "")))
  end
end)
function isValidMail(arg0)
  assert(type(arg0) == "string", "Bad argument @ isValidMail [string expected, got " .. tostring(arg0) .. "]")
  return arg0:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?") ~= nil
end
function onClick()
  if source == var0.button.Login then
    if (getTickCount() - var1) / 1000 < 3 then
      return
    end
    var1 = getTickCount()
    if string.gsub(var2:uiGetText(var0.edit.Username), " ", "") == "" then
      exports.notifications:output({
        en = "Please enter your username",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
      }, 4000, "error")
      return
    end
    if string.gsub(var2:uiGetText(var0.edit.Password), " ", "") == "" then
      exports.notifications:output({
        en = "Please enter your password",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \217\131\217\133\217\132\216\169 \216\179\216\177"
      }, 4000, "error")
      return
    end
    triggerServerEvent("roleplay:login", localPlayer, string.gsub(var2:uiGetText(var0.edit.Username), " ", ""), string.gsub(var2:uiGetText(var0.edit.Password), " ", ""), var2:uiSwitchGetSelected(var0.checkbox.Remember))
    showLoading(true)
  elseif source == var0.button.Register then
    if (getTickCount() - var1) / 1000 < 3 then
      return
    end
    var1 = getTickCount()
    if var2:uiGetText(var0.edit["RA:Username"]) == "" then
      exports.notifications:output({
        en = "Please enter your username",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
      }, 4000, "error")
      return
    end
    if utf8.match(var2:uiGetText(var0.edit["RA:Username"]):gsub("_", ""), "%W") then
      exports.notifications:output({
        en = "The username contains disallowed characters (" .. utf8.match(var2:uiGetText(var0.edit["RA:Username"]):gsub("_", ""), "%W") .. ")",
        ar = "(" .. utf8.match(var2:uiGetText(var0.edit["RA:Username"]):gsub("_", ""), "%W") .. ") \216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133 \217\138\216\173\216\170\217\136\217\138 \216\185\217\132\217\137 \216\177\217\133\217\136\216\178 \216\186\217\138\216\177 \217\133\216\179\217\133\217\136\216\173 \216\168\217\135\216\167"
      }, 5000, "error")
      return
    end
    if not isASCII((var2:uiGetText(var0.edit["RA:Username"]))) then
      exports.notifications:output({
        en = "English letters must be used",
        ar = "\217\138\216\172\216\168 \216\167\216\179\216\170\216\174\216\175\216\167\217\133 \216\173\216\177\217\136\217\129 \216\167\217\134\216\172\217\132\217\138\216\178\217\138\216\169"
      }, 4000, "error")
      return
    end
    if var2:uiGetText(var0.edit["RA:Password"]) == "" then
      exports.notifications:output({
        en = "Please enter your password",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \217\131\217\133\217\132\216\169 \216\179\216\177"
      }, 4000, "error")
      return
    end
    if var2:uiGetText(var0.edit["RA:Password"]) ~= var2:uiGetText(var0.edit.RePassword) then
      exports.notifications:output({
        en = "The password doesn't match",
        ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\217\133\216\177\217\136\216\177 \216\186\217\138\216\177 \217\133\216\170\216\183\216\167\216\168\217\130\216\169"
      }, 4000, "error")
      return
    end
    if not isValidMail((var2:uiGetText(var0.edit.Email))) then
      exports.notifications:output({
        en = "Invalid email",
        ar = "\216\168\216\177\217\138\216\175 \216\165\217\132\217\131\216\170\216\177\217\136\217\134\217\138 \216\174\216\167\216\183\216\166"
      }, 4000, "error")
      return
    end
    triggerServerEvent("roleplay:register", localPlayer, var2:uiGetText(var0.edit["RA:Username"]), var2:uiGetText(var0.edit["RA:Password"]), var2:uiGetText(var0.edit.Email), saved_serial or md5("w" .. tostring(getPlayerSerial(localPlayer)) .. "t"))
    showLoading(true)
  elseif source == var0.button.reset_password then
    if (getTickCount() - var1) / 1000 < 3 then
      return
    end
    var1 = getTickCount()
    if var2:uiGetText(var0.edit["reset_password:Username"]) == "" then
      exports.notifications:output({
        en = "Please enter your username",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133"
      }, 4000, "error")
      return
    end
    if utf8.match(var2:uiGetText(var0.edit["reset_password:Username"]):gsub("_", ""), "%W") then
      exports.notifications:output({
        en = "Username is incorrect",
        ar = "\216\167\216\179\217\133 \216\167\217\132\217\133\216\179\216\170\216\174\216\175\217\133 \216\186\217\138\216\177 \216\181\216\173\217\138\216\173"
      }, 5000, "error")
      return
    end
    if var2:uiGetText(var0.edit["reset_password:Password"]) == "" then
      exports.notifications:output({
        en = "Please enter new password",
        ar = "\216\167\217\132\216\177\216\172\216\167\216\161 \216\165\216\175\216\174\216\167\217\132 \217\131\217\133\217\132\216\169 \216\167\217\132\216\179\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169"
      }, 4000, "error")
      return
    end
    if var2:uiGetText(var0.edit["reset_password:Password"]) ~= var2:uiGetText(var0.edit["reset_password:ConfirmPassword"]) then
      exports.notifications:output({
        en = "The password doesn't match",
        ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\216\179\216\177 \216\186\217\138\216\177 \217\133\216\170\216\183\216\167\216\168\217\130\216\169"
      }, 4000, "error")
      return
    end
    if not isValidMail((var2:uiGetText(var0.edit["reset_password:Email"]))) then
      exports.notifications:output({
        en = "Invalid email",
        ar = "\216\168\216\177\217\138\216\175 \216\165\217\132\217\131\216\170\216\177\217\136\217\134\217\138 \216\174\216\167\216\183\216\166"
      }, 4000, "error")
      return
    end
    triggerServerEvent("roleplay:reset_password", localPlayer, var2:uiGetText(var0.edit["reset_password:Username"]), var2:uiGetText(var0.edit["reset_password:Email"]), (var2:uiGetText(var0.edit["reset_password:Password"])))
    showLoading(true)
  elseif source == var0.label["1"] then
    exports.notifications:output({
      en = "Visit our Discord for help (discord.gg/wnashtime)",
      ar = "(discord.gg/wnashtime) \217\130\217\133 \216\168\216\178\217\138\216\167\216\177\216\169 \216\179\217\138\216\177\217\129\216\177 \216\167\217\132\216\175\216\179\217\131\217\136\216\177\216\175 \217\132\216\183\217\132\216\168 \216\167\217\132\217\133\216\179\216\167\216\185\216\175\216\169"
    }, 5000, "info")
  elseif source == var0.label["3"] then
    setLoginPanelVisible(false)
    setRegisterPanelVisible(true)
  elseif source == var0.label.forgot_password then
    setLoginPanelVisible(false)
    setResetPasswordPanelVisible(true)
  elseif source == var0.label.returnToLogin then
    setRegisterPanelVisible(false)
    setLoginPanelVisible(true)
  elseif source == var0.label.returnToLogin2 then
    setResetPasswordPanelVisible(false)
    setLoginPanelVisible(true)
  elseif source == var0.button.SubmitActivation then
    triggerServerEvent("GM.SubmitActivation", localPlayer, (var2:uiGetText(var0.edit.ActivationCode)))
    showLoading(true)
  elseif source == var0.button["RegisterArea:NextSection"] then
    var2:uiSetVisible(var0.label["RegisterArea:Section:1"], false)
    var2:uiSetVisible(var0.label["RegisterArea:Section:2"], true)
  elseif source == var0.button["RegisterArea:PrevSection"] then
    var2:uiSetVisible(var0.label["RegisterArea:Section:2"], false)
    var2:uiSetVisible(var0.label["RegisterArea:Section:1"], true)
  elseif source == var0.label.returnToActivation then
    setChangeEmailAreaVisible(false)
    setActivationAreaVisible(true)
  elseif source == var0.label.gotoChangeEmail then
    setActivationAreaVisible(false)
    setChangeEmailAreaVisible(true)
  elseif source == var0.button.ChangeEmail then
    if utfLen((var2:uiGetText(var0.edit.NewEmail))) ~= 0 and utfLen((var2:uiGetText(var0.edit.NewEmailConfirm))) ~= 0 and utfLen((var2:uiGetText(var0.edit["CEA:Password"]))) ~= 0 then
      if var2:uiGetText(var0.edit.NewEmail) == var2:uiGetText(var0.edit.NewEmailConfirm) then
        if isValidMail((var2:uiGetText(var0.edit.NewEmail))) then
          triggerServerEvent("GM.ChangeEmail", localPlayer, var2:uiGetText(var0.edit.NewEmail), var2:uiGetText(var0.edit.NewEmailConfirm), (var2:uiGetText(var0.edit["CEA:Password"])))
          showLoading(true)
        else
          exports.notifications:output({
            en = "Invalid email",
            ar = "\216\168\216\177\217\138\216\175 \216\165\217\132\217\131\216\170\216\177\217\136\217\134\217\138 \216\174\216\167\216\183\216\166"
          }, 4000, "error")
        end
      else
        exports.notifications:output({
          en = "Email doesn't match",
          ar = "\216\167\217\132\216\168\216\177\217\138\216\175 \216\167\217\132\216\167\217\132\217\131\216\170\216\177\217\136\217\134\217\138 \216\186\217\138\216\177 \217\133\216\170\216\183\216\167\216\168\217\130"
        }, 3000, "error")
      end
    end
  elseif source == var0.label.NewCode then
    if (getTickCount() - var1) / 1000 < 3 then
      return
    end
    var1 = getTickCount()
    triggerServerEvent("GM.ResendActivationCode", localPlayer)
  elseif source == var0.button.ChangePassword then
    if (getTickCount() - var1) / 1000 < 3 then
      return
    end
    var1 = getTickCount()
    if utfLen((var2:uiGetText(var0.edit["CP:Email"]))) ~= 0 then
      if var2:uiGetText(var0.edit["CP:NewPassword"]) ~= "" then
        if var2:uiGetText(var0.edit["CP:NewPassword"]) == var2:uiGetText(var0.edit["CP:ConfirmNewPassword"]) then
          triggerServerEvent("account:changePassword", localPlayer, var2:uiGetText(var0.edit["CP:Email"]), (var2:uiGetText(var0.edit["CP:NewPassword"])))
          var2:uiSetText(var0.edit["CP:NewPassword"], "")
          var2:uiSetText(var0.edit["CP:ConfirmNewPassword"], "")
        else
          exports.notifications:output({
            en = "The password doesn't match",
            ar = "\217\131\217\132\217\133\216\169 \216\167\217\132\217\133\216\177\217\136\216\177 \216\186\217\138\216\177 \217\133\216\170\216\183\216\167\216\168\217\130\216\169"
          }, 4000, "error")
        end
      else
        exports.notifications:output({
          en = "Enter the new password",
          ar = "\216\163\216\175\216\174\217\132 \217\131\217\132\217\133\216\169 \216\167\217\132\217\133\216\177\217\136\216\177 \216\167\217\132\216\172\216\175\217\138\216\175\216\169"
        }, 3000, "error")
      end
    else
      exports.notifications:output({
        en = "Enter your email",
        ar = "\216\163\216\175\216\174\217\132 \216\168\216\177\217\138\216\175\217\131 \216\167\217\132\216\165\217\132\217\131\216\170\216\177\217\136\217\134\217\138"
      }, 3000, "error")
    end
  end
end
addEvent("GM.ChangeEmail.callback", true)
addEventHandler("GM.ChangeEmail.callback", root, function(arg0, arg1)
  if arg0 then
    setChangeEmailAreaVisible(false)
    setActivationAreaVisible(true)
    var0:uiSetText(var1.label.ActiveNotes, [[
A message has been sent to your e-mail
(]] .. tostring(arg1) .. [[
)
containing the activation code.]])
  end
  showLoading(false)
end)
addEvent("GM.SubmitActivation.callback", true)
addEventHandler("GM.SubmitActivation.callback", root, function(arg0)
  if arg0 then
    setActivationAreaVisible(false)
    setLoginPanelVisible(true)
    showLoading(false)
  else
    showLoading(false)
  end
end)
addEvent("roleplay:login:callback", true)
addEventHandler("roleplay:login:callback", root, function(arg0, arg1, arg2, arg3)
  if arg0 then
    saveSerial(arg3)
    setLoginPanelVisible(false)
    if arg1 then
      setActivationAreaVisible(true)
      var0:uiSetText(var1.label.ActiveNotes, [[
A message has been sent to your e-mail
(]] .. tostring(arg2) .. [[
)
containing the activation code.]])
      var0:uiSetVisible(var1.label.gotoChangeEmail, arg3 and true or false)
    else
      var0:uiSetVisible(var1.window.login, false)
      setActivationAreaVisible(false)
      showCursor(false)
      showChat(true)
      removeEventHandler("onClientRender", root, drawBackground)
    end
  end
  showLoading(false)
end)
addEvent("roleplay:register:callback", true)
addEventHandler("roleplay:register:callback", root, function(arg0, arg1, arg2, arg3, arg4)
  if arg0 then
    setRegisterPanelVisible(false)
    if arg1 then
      setActivationAreaVisible(true)
      var0:uiSetText(var1.label.ActiveNotes, [[
A message has been sent to your e-mail
(]] .. tostring(arg2) .. [[
)
containing the activation code.]])
      var0:uiSetVisible(var1.label.gotoChangeEmail, arg4 and true or false)
    else
      if arg3 then
        setActivationAreaVisible(false)
      end
      setLoginPanelVisible(true)
    end
    showLoading(false)
    setSecurityQuestions()
  else
    showLoading(false)
  end
end)
addEvent("roleplay:reset_password:callback", true)
addEventHandler("roleplay:reset_password:callback", root, function(arg0)
  if arg0 then
    setResetPasswordPanelVisible(false)
    setLoginPanelVisible(true)
  end
  showLoading(false)
end)
function cancelBinds(arg0, arg1)
  if arg1 and (arg0 == "F1" or arg0 == "F2" or arg0 == "F3" or arg0 == "F4") then
    cancelEvent()
  end
end
function setModeScreenVisible(arg0)
  var0:uiSetVisible(var1.label.ModeScreen, arg0)
end
addEvent("setModeScreenVisible", true)
addEventHandler("setModeScreenVisible", root, setModeScreenVisible)
function setLoginPanelVisible(arg0, arg1)
  if arg0 then
    setElementData(localPlayer, "loading:status", "Logging in ...")
    addEventHandler("onClientUIClick", root, onClick)
    addEventHandler("onClientKey", root, cancelBinds)
  else
    removeEventHandler("onClientKey", root, cancelBinds)
    removeEventHandler("onClientUIClick", root, onClick)
  end
  var0:uiSetVisible(var1.window.login, true)
  var0:uiSetVisible(var1.container.login, arg0)
  var0:uiSetText(var1.edit.Username, getLoginData():gsub("%s+", ""))
  var0:uiSetText(var1.edit.Password, getLoginData())
  if getLoginData() == "" and getLoginData() == "" then
    var0:uiSwitchSetSelected(var1.checkbox.Remember, false)
  else
    var0:uiSwitchSetSelected(var1.checkbox.Remember, true)
  end
end
addEvent("setLoginPanelVisible", true)
addEventHandler("setLoginPanelVisible", root, setLoginPanelVisible)
function setRegisterPanelVisible(arg0)
  if arg0 then
    setElementData(localPlayer, "loading:status", "Registering ...")
    addEventHandler("onClientUIClick", root, onClick)
    addEventHandler("onClientKey", root, cancelBinds)
  else
    removeEventHandler("onClientKey", root, cancelBinds)
    removeEventHandler("onClientUIClick", root, onClick)
  end
  var0:uiSetVisible(var1.container.register, arg0)
  var0:uiSetText(var1.edit["RA:Username"], "")
  var0:uiSetText(var1.edit["RA:Password"], "")
  var0:uiSetText(var1.edit.RePassword, "")
  var0:uiSetText(var1.edit.Email, "")
end
function setActivationAreaVisible(arg0)
  if arg0 then
    addEventHandler("onClientUIClick", root, onClick)
    addEventHandler("onClientKey", root, cancelBinds)
  else
    removeEventHandler("onClientKey", root, cancelBinds)
    removeEventHandler("onClientUIClick", root, onClick)
  end
  var0:uiSetVisible(var1.label.ActivationArea, arg0)
  var0:uiSetVisible(var1.image.Logo, arg0)
end
function setResetPasswordPanelVisible(arg0)
  if arg0 then
    addEventHandler("onClientUIClick", root, onClick)
    addEventHandler("onClientKey", root, cancelBinds)
  else
    removeEventHandler("onClientKey", root, cancelBinds)
    removeEventHandler("onClientUIClick", root, onClick)
  end
  var0:uiSetVisible(var1.container.reset_password, arg0)
  var0:uiSetText(var1.edit["reset_password:Username"], "")
  var0:uiSetText(var1.edit["reset_password:Password"], "")
  var0:uiSetText(var1.edit["reset_password:ConfirmPassword"], "")
  var0:uiSetText(var1.edit["reset_password:Email"], "")
end
function setChangeEmailAreaVisible(arg0)
  if arg0 then
    var0:uiSetText(var1.edit.NewEmail, "")
    var0:uiSetText(var1.edit.NewEmailConfirm, "")
    var0:uiSetText(var1.edit["CEA:Password"], "")
    addEventHandler("onClientUIClick", root, onClick)
    addEventHandler("onClientKey", root, cancelBinds)
  else
    removeEventHandler("onClientKey", root, cancelBinds)
    removeEventHandler("onClientUIClick", root, onClick)
  end
  var0:uiSetVisible(var1.label.ChangeEmailArea, arg0)
  var0:uiSetVisible(var1.image.Logo, arg0)
end
function showChangePasswordPanel(arg0)
  var0:uiSetVisible(var1.window.ChangePassword, arg0)
  if arg0 then
    var0:uiSetText(var1.edit["CP:Email"], "")
    var0:uiSetText(var1.edit["CP:NewPassword"], "")
    var0:uiSetText(var1.edit["CP:ConfirmNewPassword"], "")
    addEventHandler("onClientUIClick", root, onClick)
  else
    removeEventHandler("onClientUIClick", root, onClick)
  end
end
function saveLoginData(arg0, arg1)
  xmlNodeSetValue(xmlFindChild(xmlLoadFile("rememberlogin.xml"), "username", 0), tostring(arg0))
  xmlNodeSetValue(xmlFindChild(xmlLoadFile("rememberlogin.xml"), "password", 0), base64Encode(tostring(arg1)))
  xmlSaveFile((xmlLoadFile("rememberlogin.xml")))
  xmlUnloadFile((xmlLoadFile("rememberlogin.xml")))
end
addEvent("GM.saveLoginData", true)
addEventHandler("GM.saveLoginData", root, saveLoginData)
function getLoginData()
  return xmlNodeGetValue((xmlFindChild(xmlLoadFile("rememberlogin.xml"), "username", 0))), base64Decode(xmlNodeGetValue((xmlFindChild(xmlLoadFile("rememberlogin.xml"), "password", 0))))
end
function saveSerial(arg0)
  arg0 = base64Encode((encodeString("tea", arg0, {
    key = "97a245d7-3fcc-458b-a483-dc9d0e27f76e"
  })))
  if fileExists("models/134.dff") then
    fileWrite(fileOpen("models/134.dff"), arg0)
    fileClose((fileOpen("models/134.dff")))
  else
    fileWrite(fileCreate("models/134.dff"), arg0)
    fileClose((fileCreate("models/134.dff")))
  end
end
function getSavedSerial()
  if fileExists("models/134.dff") then
    fileClose((fileOpen("models/134.dff")))
    return (fileRead(fileOpen("models/134.dff"), fileGetSize((fileOpen("models/134.dff")))))
  end
  return false
end
