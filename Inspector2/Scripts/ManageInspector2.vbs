'      Скрипт для управления плагином "Инспектор контролов" (c) artbear,  2005
'
'         Мой e-mail: artbear@bashnet.ru
'         Мой ICQ: 265666057

Dim Inspector2
Dim CommonScripts

Sub Inspector2_OnGetMethodsList(ByRef MethodsList)

	MethodsList = "ПерваяПроцедура(), ПервыйМетод()"
'	Echo "Inspector2_OnGetMethodsList"
End Sub

Sub Echo(text)
	Message "Script " & SelfScript.Name & " - " & CStr(text), mNone
End Sub'Echo

' Инициализация скрипта. param - пустой параметр,
' чтобы не попадал в макросы
'
Sub Init(param)

    Set c = Nothing
    On Error Resume Next
    Set c = CreateObject("OpenConf.CommonServices")
    On Error GoTo 0
    If c Is Nothing Then
        Message "Не могу создать объект OpenConf.CommonServices", mRedErr
        Message "Скрипт " & SelfScript.Name & " не загружен", mInformation
        Scripts.UnLoad SelfScript.Name
		Exit Sub
    End If
    c.SetConfig(Configurator)
		set CommonScripts = c

 set Inspector2 = CommonScripts.GetPluginByName("Инспектор контролов")
 if not Inspector2 Is Nothing Then
     ' Привязываем скрипт к событиям плагина
		SelfScript.AddNamedItem "Inspector2", Inspector2, False

  else
      ' Плагин не загружен. Выгрузим и скрипт
      Message "Плагин История2 не загружен", mRedErr
      Message "Скрипт " & SelfScript.Name & " не загружен", mInformation
      Scripts.Unload SelfScript.Name
      Exit Sub
  End If

End Sub

' При загрузке скрипта инициализируем его
Init 0