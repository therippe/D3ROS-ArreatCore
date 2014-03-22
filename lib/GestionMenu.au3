#include-once
#include <File.au3>
#cs ----------------------------------------------------------------------------

	Extension permettant de gerer le menu

#ce ----------------------------------------------------------------------------

;--------------------------------------------------------------
; Choix de l'acte
;-------------------------------------------------------------

Func SelectGameType($SelectGameType, $auto)

	Local $xSelectGameType, $ySelectGameType, $posSelectGameType
	;Automatisation des sequences sur enchainement de run
	If $auto Then
		Switch $SelectGameType
			Case 1
				$Hero_Axe_Z = $Act1_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct1
			Case 2
				$Hero_Axe_Z = $Act2_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct2
			Case 3
				$Hero_Axe_Z = $Act3_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct3PtSauve
			Case 333
				$Hero_Axe_Z = $Act3_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct333
			Case 362
				$Hero_Axe_Z = $Act3_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct362
			Case 373
				$Hero_Axe_Z = $Act3_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct373
		EndSwitch
	EndIf

	;Selection du Heros
	If ($Totalruns = 1) And ($TypedeBot = 1) Then
		SelectHero()
	EndIf

	Sleep(Random(1500, 2000, 1))

	If $TypedeBot <> 2 Then
		;Selection -> CHANGER DE QUETE
		Sleep(Random(300, 400, 1))
		_Log("Game Settings")
		ClickUI("Root.NormalLayer.BattleNetCampaign_main.LayoutRoot.Menu") ;_randomclick(125, 320) ; tap param�tre de la partie
		Sleep(Random(700, 800, 1)) 
		
		If IsGameSettingsOpened() Then
		   
		   ;Selection de la difficulte et de la puissance des monstres
		   If ($Totalruns = 1) And ($TypedeBot = 1) Then
			  SelectDifficultyMonsterPower()
		   EndIf
		   
		   _Log("Choose a New Quest")
		   ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.StoryModeContent.ChangeQuestButton");_randomclick(395, 371) ; tap changer
		   Sleep(Random(700, 800, 1))
		   
		   ;Selection de la qu�te
		   If IsQuestOpened() Then

			  ;Selection de la scrollbar
			  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.QuestMenu.NavigationMenuList._scrollbar.thumb")
			  Sleep(Random(600, 800, 1))
			  
			  ;valeur de test ok 27 ... mini pour balayer toutes les qu�tes 26
			  For $i = 1 To Random(27, 28, 1) Step 1
				 MouseWheel("up")
				 ;Valeur de test ok 100
				 Sleep(Random(100, 150, 1))
			  Next

			  ;selection d'une quete pour fermer les sous quetes
			  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
			  Sleep(50)
			  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

			  Switch $SelectGameType
				   Case 1;selection de la qu�te 10.1 act 1

					  For $i = 1 To 7 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 1 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

				   Case 2;selection de la qu�te 8.3

					  For $i = 1 To 16 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 2 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next				 
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

				   Case 3;selection de la qu�te 7.3

					  For $i = 1 To 26 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 2 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

				   Case 333 ; Act 3 qu�te 3 sous qu�te 3 --> tuez Ghom

					  For $i = 1 To 22 Step 1
						 MouseWheel("down")
						 Sleep(150)
					  Next				
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 2 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

				   Case 362 ; Act 3 qu�te 6 sous qu�te 2 --> Tuez le briseur de si�ge

					  For $i = 1 To 25 Step 1
						 MouseWheel("down")
						 Sleep(150)
					  Next				
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 1 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed62")

				   Case 373 ; Act 3 qu�te 7 sous qu�te 3 --> Terrasez Asmodam

					  For $i = 1 To 26 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")
					  Sleep(Random(600, 800, 1))
				
					  For $i = 1 To 2 Step 1
						 MouseWheel("down")
						 Sleep(Random(100, 150, 1))
					  Next				 
					  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.unnamed61")

			  EndSwitch
			  
			  ;Bp choisir la quete
			  Sleep(Random(300, 400, 1))
			  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.SelectQuestButton");_randomclick(336, 430) Tap OK 'Choose a new quest'
			  Sleep(Random(300, 400, 1))
			  
			  ; Bp validation de la qu�te
			  If IsQuestChangeUiOpened() Then
				 _log("D�tection de changement qu�te")
				 Sleep(Random(300, 400, 1))
				 Send("{ENTER}")
			  EndIf
			  Sleep(Random(600, 800, 1))
			  ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.SaveAndClose");_randomclick(293, 482) ; tap sauvegarder et fermer
			  Sleep(Random(600, 800, 1))
		  EndIf
	   EndIf
	EndIf
EndFunc   ;==>SelectGameType

;Selection de la quete en automatique
Func SelectQuest()
	If ($Choix_Act_Run = 1) And ($Totalruns = 1) Then
		SelectGameType(1, True)
	EndIf
	If ($Choix_Act_Run = 2) And ($Totalruns = 1) Then
		SelectGameType(2, True)
	EndIf
	If ($Choix_Act_Run = 3) Then
		If ($Totalruns = 1) Then
			SelectGameType(3, True)
		EndIf
		If ($Totalruns = 2) Then
			$Hero_Axe_Z = $Act3_Hero_Axe_Z
			$File_Sequence = $SequenceFileAct3
		EndIf
	EndIf
	If ($Choix_Act_Run = 333) Then
		SelectGameType(333, True)
	EndIf
	If ($Choix_Act_Run = 362) Then
		SelectGameType(362, True)
	EndIf
	If ($Choix_Act_Run = 373) Then
		SelectGameType(373, True)
	EndIf

	;Selection de la quete en automatique et enchainement des actes
	If $Choix_Act_Run = -1 Then
		;Initialisation de la s�quence
		If ($Totalruns = 1) Or ($Totalruns = $NbreRunChangSeqAlea) Then
			$act = 0
			$NombreRun_Encour = 0
			;Chainage al�atoire ou non des actes
			If $Sequence_Aleatoire Then
				;$ChainageActe[6][3]=[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
				Local $ligne = Random(0, 5, 1)
				For $colonne = 0 To 2 Step 1
					$ChainageActeEnCour[$colonne] = $ChainageActe[$ligne][$colonne]
				Next
			Else
				$ChainageActeEnCour[0] = 1
				$ChainageActeEnCour[1] = 2
				$ChainageActeEnCour[2] = 3
			EndIf
			$ColonneEnCour = 0
			$Act_Encour = $ChainageActeEnCour[$ColonneEnCour]
			SelectGameType($Act_Encour, True)

			;Cr�ation d un fichier de log pour le mode automatique
			If ($Totalruns = 1) Then
				Local $TIME = @MDAY & @MON & @YEAR & "_" & @HOUR & @MIN & @SEC
				$fileLog = ".\stats\StatsRunAuto" & $TIME & ".txt"
				FileWrite($fileLog, "Run automatique du " & @MDAY & "/" & @MON & "/" & @YEAR & " � " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF)
				$numLigneFichier = 2
				_FileWriteToLine($fileLog, $numLigneFichier, "Chainage : Act " & $ChainageActeEnCour[0] & ", " & $ChainageActeEnCour[1] & " et " & $ChainageActeEnCour[2], 1)
				$numLigneFichier = $numLigneFichier + 1
			Else
				$numLigneFichier = $numLigneFichier + 1
				Local $TIME = @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
				_FileWriteToLine($fileLog, $numLigneFichier, $TIME, 1)
				$numLigneFichier = $numLigneFichier + 1
				_FileWriteToLine($fileLog, $numLigneFichier, "Changement de Chainage : Act " & $ChainageActeEnCour[0] & ", " & $ChainageActeEnCour[1] & " et " & $ChainageActeEnCour[2], 1)
				$numLigneFichier = $numLigneFichier + 1
				_FileWriteToLine($fileLog, $numLigneFichier, "Act " & $Act_Encour & ": " & $NombreRun_Encour & "/" & $NombreDeRun, 1)
				$NbreRunChangSeqAlea = $NbreRunChangSeqAlea + $Totalruns
			EndIf

			If ($Nombre_de_Run = 0) Then
				Switch $Act_Encour
					Case 1
						$NombreDeRun = Random($NombreMiniAct1, $NombreMaxiAct1, 1)
					Case 2
						$NombreDeRun = Random($NombreMiniAct2, $NombreMaxiAct2, 1)
					Case 3
						$NombreDeRun = Random($NombreMiniAct3, $NombreMaxiAct3, 1)
				EndSwitch
			Else
				$NombreDeRun = $Nombre_de_Run
			EndIf
		EndIf

		;Changement d acte lorsque l'on a atteint le mombre de run max
		If ($NombreRun_Encour >= $NombreDeRun) Then
			$act = 0
			If $ColonneEnCour < 2 Then
				$ColonneEnCour = $ColonneEnCour + 1
			Else
				$ColonneEnCour = 0
			EndIf
			$Act_Encour = $ChainageActeEnCour[$ColonneEnCour]
			SelectGameType($Act_Encour, True)
			$NombreRun_Encour = 1
			If ($Nombre_de_Run = 0) Then
				Switch $Act_Encour
					Case 1
						$NombreDeRun = Random($NombreMiniAct1, $NombreMaxiAct1, 1)
					Case 2
						$NombreDeRun = Random($NombreMiniAct2, $NombreMaxiAct2, 1)
					Case 3
						$NombreDeRun = Random($NombreMiniAct3, $NombreMaxiAct3, 1)
				EndSwitch
			EndIf
			$numLigneFichier = $numLigneFichier + 1
			Local $TIME = @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
			_FileWriteToLine($fileLog, $numLigneFichier, $TIME, 1)
			$numLigneFichier = $numLigneFichier + 1
			_FileWriteToLine($fileLog, $numLigneFichier, "Act " & $Act_Encour & ": " & $NombreRun_Encour & "/" & $NombreDeRun, 1)
		Else
			If ($Act_Encour = 3) And ($NombreRun_Encour = 1) Then
				$Hero_Axe_Z = $Act3_Hero_Axe_Z
				$File_Sequence = $SequenceFileAct3
			EndIf
			$NombreRun_Encour = $NombreRun_Encour + 1
			_FileWriteToLine($fileLog, $numLigneFichier, "Act " & $Act_Encour & ": " & $NombreRun_Encour & "/" & $NombreDeRun, 1)
		EndIf
	EndIf
EndFunc   ;==>SelectQuest

Func SelectHero()

	; bonton Changer de heros
	_Log("Switch Hero")
	ClickUI("Root.NormalLayer.BattleNetCampaign_main.LayoutRoot.Slot1.LayoutRoot.SwitchHero")
	Sleep(Random(600, 800, 1))

    If IsMenuHeroSelectOpened() Then
	   
	   ;positionnement sur la scrollbar
	   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.HeroSelectList.HeroList._scrollbar")
	   Sleep(Random(600, 800, 1))

	   ;Choix du heros
	   For $i = 1 To Random(6, 7, 1) Step 1
		  MouseWheel("up")
		  ;Valeur de test ok 100
		  Sleep(Random(100, 150, 1))
	   Next

	   Switch $Heros
			Case 1
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed36")
			Case 2
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed37")
			Case 3
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed38")
			Case 4
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed39")
			Case 5
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed40")
			Case 6
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed41")
			Case 7
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed42")
			Case 8			
			   For $i = 1 To 5 Step 1
				  MouseWheel("down")
				  Sleep(Random(100, 150, 1))
			   Next
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed40")
		
			Case 9
			   For $i = 1 To 5 Step 1
				  MouseWheel("down")
				  Sleep(Random(100, 150, 1))
			   Next
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed41")
		
			Case 10
			   For $i = 1 To 5 Step 1
				  MouseWheel("down")
				  Sleep(Random(100, 150, 1))
			   Next	
			   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.d3StackPanel.unnamed42")
	
	   EndSwitch
	   Sleep(Random(600, 800, 1))

	   ;Deplacement sur le bp choisir
	   ClickUI("Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.SelectHeroButton")
	   Sleep(Random(2000, 2500, 1)) ; temps mini de chargement du hero 2000ms
    EndIf
EndFunc   ;==>SelectHero

Func SelectDifficultyMonsterPower()

	;Selection de la difficult�
	_Log("Change Difficulty")
	ClickUI("Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.StoryModeContent.ChangeDifficultyButton")
	Sleep(Random(600, 800, 1))

    If IsGameDifficultyOpened() Then
	
	   Switch $difficulte
			Case 1 ;Normal
			    ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Difficulty_0")
			Case 2 ;Difficile
			    ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Difficulty_1")
			Case 3 ;Expert
			    ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Difficulty_2")
			Case 4 ;Calvaire
			    ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Difficulty_3")
			Case 5 ;Tourment
			    ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Difficulty_4")
	   EndSwitch

	   Sleep(Random(600, 800, 1))

	   ;Selection de la barre du menu des difficult� de Tourment
	   If $difficulte = 5 Then
	   
		  Switch $PuisMonstre
			   Case 1
				   ClickUISlider(-130, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
			   Case 2
				   ClickUISlider(-80, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
			   Case 3
				   ClickUISlider(-30, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
			   Case 4
				   ClickUISlider(20, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
			   Case 5
				   ClickUISlider(70, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
			   Case 6
				   ClickUISlider(120, "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.Details.Slider.MaxSlider.trackDown")
		  EndSwitch

		  Sleep(Random(600, 800, 1))
	   EndIf
	
	   ClickUI("Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.PlayGameButton"); tap OK Difficulty
	   Sleep(Random(900, 1000, 1))
    EndIf
EndFunc   ;==>SelectDifficultyMonsterPower


Func ClickUISlider($i, $name, $bucket=-1)

	If $bucket = -1 Then ;no bucket given slow method
		$result = GetOfsUI($name, 1)
	Else ;bucket given, fast method
		$result = GetOfsFastUI($name, $bucket)
	EndIf

	If $result = false Then
		_log("(ClickUI) UI DOESNT EXIT ! -> " & $name)
		return false
	EndIf

	Dim $Point = GetPositionUI($result)

	While $Point[0] = 0 AND $Point[1] = 0
		$Point = GetPositionUI($result)
		sleep(500)
	WEnd

	Dim $Point2 = GetUIRectangle($Point[0] + $i, $Point[1], $Point[2] + $i, $Point[3])

	MouseClick("left", ($Point2[0] + $Point2[2] / 2) , $Point2[1] + $Point2[3] / 2)
    MouseDown("left")
	Sleep(300)
	MouseUp("left")
	Sleep(50)
	
EndFunc  ;====> ClickUISlider


Func IsQuestChangeUiOpened()
    $QuestChangelookfor = "Root.TopLayer.BattleNetModalNotifications_main.ModalNotification.Buttons.ButtonList"
    Return fastcheckuiitemvisible($QuestChangelookfor, 1, 2022)
EndFunc   ;==>IsQuestChangeUiOpened OK
 
Func IsGameSettingsOpened()
    $GameSettingslookfor = "Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.StoryModeContent.ChangeQuestButton"
    Return fastcheckuiitemvisible($GameSettingslookfor, 1, 954)
EndFunc   ;==>IsGameSettingsOpened
 
Func IsQuestOpened()
    $Questlookfor = "Root.NormalLayer.BattleNetGameSettings_main.LayoutRoot.ChangeQuest.SelectQuestButton"
    Return fastcheckuiitemvisible($Questlookfor, 1, 663)
EndFunc   ;==>IsQuestOpened

Func IsGameDifficultyOpened()
    $GameDifficultylookfor = "Root.TopLayer.BattleNetGameDifficulty_main.LayoutRoot.OverlayContainer.PlayGameButton"
    Return fastcheckuiitemvisible($GameDifficultylookfor, 1, 253)
EndFunc   ;==>IsGameDifficultyOpened

Func IsMenuHeroSelectOpened()
    $MenuHeroSelectlookfor = "Root.NormalLayer.BattleNetHeroSelect_main.LayoutRoot.SelectHeroButton"
    Return fastcheckuiitemvisible($MenuHeroSelectlookfor, 1, 1022)
EndFunc   ;==>IsMenuHeroSelectOpened
 